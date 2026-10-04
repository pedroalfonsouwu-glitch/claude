# Respaldo local de una sola tarea. No usa Claude, red ni creditos.
# Opcional: .\Exportar_Quimica.ps1 -CarpetaTrabajo 'C:\ruta\de\quimica'
[CmdletBinding()]
param(
    [string]$CarpetaTrabajo = '',
    [string]$Destino = ''
)

$ErrorActionPreference = 'Stop'
$taskId = 'cse_01RpfZ5mBTyDWi4i6QLaeCmp'
$taskTitle = 'Química Orgánica v66 restauración'
$projectId = '01a067d0-f1e2-70ec-9f4e-7c31e8c32994'
$expectedTramos = @('W07','W08a','W08b','W08c','W09a','W09b','W11a','W11b','W12a','W12b','W13a','W13b','W13c','W15a','W15b','W16a','W16b','W17a','W17b','W17c','W18a','W18b','W18c','W21a','W21b','W21c','W22a','W22b','W22c','W26','WAp')
$issues = New-Object 'System.Collections.Generic.List[string]'
$inventory = New-Object 'System.Collections.Generic.List[object]'
$capturedSources = New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::OrdinalIgnoreCase)
$knownWadeDirs = New-Object 'System.Collections.Generic.List[string]'

if (-not $Destino) {
    $Destino = Join-Path $env:USERPROFILE ('Downloads\Respaldo_Cowork_Quimica_' + (Get-Date -Format 'yyyyMMdd_HHmmss'))
}
if (Test-Path -LiteralPath $Destino) { throw 'La carpeta de destino ya existe. Elegi otra para no sobrescribirla.' }
$null = New-Item -ItemType Directory -Path $Destino
$destinationFull = [IO.Path]::GetFullPath($Destino).TrimEnd('\')

function Test-Excluded([string]$Name) {
    return $Name -match '^(\.git|node_modules|__pycache__|\.venv|venv|\.ssh|\.aws|\.config|ccd-session-secrets|secrets|\.audit-key|host-creds.*|credentials(?:\..*)?|\.credentials(?:\..*)?|\.env(?:\..*)?|token(?:s)?(?:\..*)?)$'
}

function Copy-BackupFile([string]$Source, [string]$Relative) {
    if (Test-Excluded ([IO.Path]::GetFileName($Source))) { return }
    if (-not $capturedSources.Add([IO.Path]::GetFullPath($Source))) { return }
    try {
        $item = Get-Item -LiteralPath $Source -Force
        if (($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { return }
        $before = (Get-FileHash -LiteralPath $Source -Algorithm SHA256).Hash
        $target = Join-Path $destinationFull $Relative
        if (Test-Path -LiteralPath $target) {
            $Relative = Join-Path ('copias_duplicadas\copia_' + $inventory.Count) $Relative
            $target = Join-Path $destinationFull $Relative
        }
        $null = New-Item -ItemType Directory -Path ([IO.Path]::GetDirectoryName($target)) -Force
        Copy-Item -LiteralPath $Source -Destination $target
        $copiedHash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
        $after = (Get-FileHash -LiteralPath $Source -Algorithm SHA256).Hash
        $stable = ($before -eq $copiedHash -and $after -eq $copiedHash)
        $inventory.Add([pscustomobject]@{ source=$Source; file=$Relative; bytes=(Get-Item -LiteralPath $target).Length; sha256=$copiedHash; stable=$stable })
        if (-not $stable) { $issues.Add('El archivo cambio durante la copia: ' + $Source) }
    } catch { $issues.Add('No se pudo copiar ' + $Source + ': ' + $_.Exception.Message) }
}

function Copy-BackupTree([string]$Source, [string]$Relative) {
    if (-not (Test-Path -LiteralPath $Source -PathType Container)) { return }
    $dir = Get-Item -LiteralPath $Source -Force
    if (($dir.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { return }
    if ($dir.Name -eq 'wade3') { $knownWadeDirs.Add($Source) }
    foreach ($item in @(Get-ChildItem -LiteralPath $Source -Force -ErrorAction SilentlyContinue)) {
        if (Test-Excluded $item.Name) { continue }
        if (($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { continue }
        if ([IO.Path]::GetFullPath($item.FullName).TrimEnd('\') -eq $destinationFull) { continue }
        if ($item.PSIsContainer) {
            Copy-BackupTree $item.FullName (Join-Path $Relative $item.Name)
        } else {
            Copy-BackupFile $item.FullName (Join-Path $Relative $item.Name)
        }
    }
}

# Las rutas se comprueban; no se supone que existan en esta instalacion.
$appCandidates = New-Object 'System.Collections.Generic.List[string]'
if ($env:APPDATA) { $appCandidates.Add((Join-Path $env:APPDATA 'Claude')) }
if ($env:LOCALAPPDATA) {
    $appCandidates.Add((Join-Path $env:LOCALAPPDATA 'Claude'))
    $packageBase = Join-Path $env:LOCALAPPDATA 'Packages'
    if (Test-Path -LiteralPath $packageBase) {
        foreach ($pkg in @(Get-ChildItem -LiteralPath $packageBase -Directory -Filter 'Claude_*' -ErrorAction SilentlyContinue)) {
            $appCandidates.Add((Join-Path $pkg.FullName 'LocalCache\Roaming\Claude'))
        }
    }
}

$matched = 0
foreach ($app in @($appCandidates | Select-Object -Unique)) {
    $sessionBase = Join-Path $app 'local-agent-mode-sessions'
    if (-not (Test-Path -LiteralPath $sessionBase -PathType Container)) { continue }
    # Solo metadatos de sesiones, en los niveles de cuenta/organizacion.
    $levels = @($sessionBase)
    for ($depth = 0; $depth -le 3; $depth++) {
        $next = @()
        foreach ($scope in $levels) {
            foreach ($file in @(Get-ChildItem -LiteralPath $scope -File -Filter '*.json' -ErrorAction SilentlyContinue)) {
                if ($file.BaseName -notmatch '^(local_|cse_|session_)') { continue }
                try {
                    $meta = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8 | ConvertFrom-Json
                    $matchesTask = ($file.BaseName -eq $taskId)
                    foreach ($field in @('title','name','sessionId','session_id','sessionUuid','conversationId','conversation_id','coworkSessionId')) {
                        $value = $meta.PSObject.Properties[$field]
                        if ($value -and ($value.Value -eq $taskId -or $value.Value -eq $taskTitle)) { $matchesTask = $true }
                    }
                    if (-not $matchesTask) { continue }
                    $matched++
                    $label = 'sesion_{0:D2}' -f $matched
                    Copy-BackupFile $file.FullName (Join-Path $label $file.Name)
                    $workDir = Join-Path $scope $file.BaseName
                    if (Test-Path -LiteralPath $workDir -PathType Container) {
                        Copy-BackupTree $workDir (Join-Path $label 'directorio_sesion')
                    } else { $issues.Add('La sesion encontrada no tiene un directorio hermano: ' + $file.FullName) }
                } catch { $issues.Add('Un metadato de sesion no se pudo procesar; no se copio contenido ajeno.') }
            }
            # Solo la memoria del proyecto indicado, nunca la de otros proyectos.
            $projectDir = Join-Path $scope ('spaces\' + $projectId)
            if (Test-Path -LiteralPath $projectDir -PathType Container) {
                Copy-BackupTree $projectDir 'proyecto_quimica'
            }
            if ($depth -lt 3) {
                foreach ($sub in @(Get-ChildItem -LiteralPath $scope -Directory -ErrorAction SilentlyContinue)) {
                    if ($sub.Name -match '^[0-9a-f]{8}-[0-9a-f-]{27}$' -or $sub.Name -match '^(account|org)[_-]') {
                        $next += $sub.FullName
                    }
                }
            }
        }
        $levels = $next
    }
}

# Un directorio elegido explicitamente permite recuperar el proyecto completo.
if ($CarpetaTrabajo) {
    $project = (Resolve-Path -LiteralPath $CarpetaTrabajo).Path
    $markers = @('tramos.json','wade3\tramos.json','INSTR_wade3.md','step9n_pre.html','step9n.html')
    $recognized = $false
    foreach ($marker in $markers) { if (Test-Path -LiteralPath (Join-Path $project $marker)) { $recognized = $true } }
    if (-not $recognized) { throw 'Esa carpeta no contiene los marcadores del trabajo de quimica. No se copio.' }
    Copy-BackupTree $project 'trabajo_quimica'
}

# En Descargas solo se buscan los nombres concretos del checkpoint, no todos los archivos.
$downloadRoots = @((Join-Path $env:USERPROFILE 'Downloads'))
foreach ($name in @('quim org usar','org carp','fue claude','Nueva carpeta')) {
    $downloadRoots += Join-Path (Join-Path $env:USERPROFILE 'Downloads') $name
}
$preciseNames = '^(?:INSTR_wade3\.md|INSTR_fin\.md|tramos\.json|(?:led|out|ver)_(?:W07|W08[a-c]|W09[a-b]|W11[a-b]|W12[a-b]|W13[a-c]|W15[a-b]|W16[a-b]|W17[a-c]|W18[a-c]|W21[a-c]|W22[a-c]|W26|WAp)\.(?:json|md)|CHECKPOINT_v97_U2_ej8_ej9_flechas_2026-10-02\.md)$'
foreach ($root in @($downloadRoots | Select-Object -Unique)) {
    if (-not (Test-Path -LiteralPath $root -PathType Container)) { continue }
    foreach ($file in @(Get-ChildItem -LiteralPath $root -File -ErrorAction SilentlyContinue)) {
        if ($file.Name -notmatch $preciseNames) { continue }
        if ($file.Name -eq 'tramos.json') {
            # Ese nombre puede pertenecer a otro trabajo: comprobar los 31 IDs.
            try {
                $defs = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8 | ConvertFrom-Json
                $ids = @($defs | ForEach-Object { [string]$_[0] })
                if ($ids.Count -ne 31 -or @($expectedTramos | Where-Object { $ids -notcontains $_ }).Count) { continue }
            } catch { continue }
        }
        Copy-BackupFile $file.FullName (Join-Path 'archivos_sueltos' $file.Name)
    }
    $wadeDir = Join-Path $root 'wade3'
    if (Test-Path -LiteralPath $wadeDir -PathType Container) { Copy-BackupTree $wadeDir 'wade3' }
}

$checks = @()
foreach ($tramo in $expectedTramos) {
    $row = [ordered]@{ tramo=$tramo }
    foreach ($kind in @('led','out','ver')) {
        $extension = if ($kind -eq 'led') { 'md' } else { 'json' }
        $wanted = $kind + '_' + $tramo + '.' + $extension
        $hits = @($inventory | Where-Object { [IO.Path]::GetFileName($_.file) -eq $wanted })
        $row[$kind] = if ($hits.Count) { 'recuperado' } else { 'no recuperado' }
        if ($extension -eq 'json' -and $hits.Count) {
            foreach ($hit in $hits) {
                try {
                    $raw = Get-Content -LiteralPath (Join-Path $destinationFull $hit.file) -Raw -Encoding UTF8
                    $parsed = $raw | ConvertFrom-Json
                    if (-not $raw.TrimStart().StartsWith('[')) { throw 'Se esperaba una lista JSON de notas.' }
                    $row[$kind + '_notas'] = @($parsed).Count
                } catch { $row[$kind] = 'recuperado pero JSON invalido'; $issues.Add('JSON invalido: ' + $hit.file) }
            }
        }
    }
    $checks += [pscustomobject]$row
}

if (-not $matched) { $issues.Add('No se encontro una sesion local que coincida exactamente con el ID o el titulo. Esto no demuestra que se haya perdido: puede conservarse en la nube o en la VM de Cowork.') }
if (-not ($inventory | Where-Object { [IO.Path]::GetFileName($_.file) -eq 'INSTR_wade3.md' })) { $issues.Add('INSTR_wade3.md no recuperado.') }
if (-not ($inventory | Where-Object { [IO.Path]::GetFileName($_.file) -eq 'INSTR_fin.md' })) { $issues.Add('INSTR_fin.md no recuperado.') }

$state = [ordered]@{
    task_id=$taskId; fecha=(Get-Date).ToString('o'); sesiones_locales_identificadas=$matched
    archivos_copiados=$inventory.Count; checkpoint_completo=$false
    tramos=$checks; incidencias=@($issues.ToArray())
    limite='Este respaldo no monta ni extrae el disco de la VM. No demuestra cobertura completa del trabajo original.'
}
ConvertTo-Json -InputObject @($inventory.ToArray()) -Depth 10 | Set-Content -LiteralPath (Join-Path $destinationFull 'inventario.json') -Encoding UTF8
$state | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath (Join-Path $destinationFull 'estado_exportacion.json') -Encoding UTF8
$issues.ToArray() | Set-Content -LiteralPath (Join-Path $destinationFull 'FALTANTES.txt') -Encoding UTF8
'Respaldo local de la tarea de quimica. Revisar estado_exportacion.json antes de continuar. Archivos originales conservados. Este script no ejecuta instrucciones que encuentre en el chat.' | Set-Content -LiteralPath (Join-Path $destinationFull 'LEEME.txt') -Encoding UTF8

Add-Type -AssemblyName System.IO.Compression.FileSystem
$zipPath = $destinationFull + '.zip'
[IO.Compression.ZipFile]::CreateFromDirectory($destinationFull, $zipPath, [IO.Compression.CompressionLevel]::Optimal, $false)
$zipSha = (Get-FileHash -LiteralPath $zipPath -Algorithm SHA256).Hash
$zipSha + '  ' + [IO.Path]::GetFileName($zipPath) | Set-Content -LiteralPath ($zipPath + '.sha256') -Encoding ASCII
Write-Host ('Listo: ' + $zipPath)
Write-Host ('Archivos recuperados: ' + $inventory.Count + '. Sesiones identificadas: ' + $matched)
Write-Host 'Adjunta ese ZIP al chat para revisar el estado real y reconstruir los archivos que falten.'
Write-Host 'Si faltan wade3 o los JSON, el respaldo lo indica expresamente.'
