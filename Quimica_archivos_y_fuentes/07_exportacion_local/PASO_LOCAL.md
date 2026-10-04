# Único paso que necesita acceso a tu Windows

Desde este chat se pudo consultar Claude en la web. No hay acceso directo al escritorio, PowerShell ni al disco de tu computadora. Tenerla prendida permite que Claude Desktop conecte sus carpetas; no habilita un acceso directo desde este chat.

Claude Code ya está instalado. No hace falta instalarlo de nuevo para hacer este respaldo.

1. Descargá `Exportar_Quimica.ps1` y dejalo en Descargas.
2. En PowerShell ejecutá:

```powershell
& "$env:USERPROFILE\Downloads\Exportar_Quimica.ps1"
```

El script mostrará la ruta de un ZIP nuevo en Descargas. Adjuntá **ese ZIP** a este chat: contiene el inventario, los archivos de la sesión que pudo encontrar y una lista de faltantes. No requiere cargar saldo ni hacer consultas a Claude.

Si Windows no permite ejecutar un archivo `.ps1`, abrilo en Bloc de notas, copiá su contenido y pegalo en PowerShell. No hace falta cambiar la política de ejecución del sistema.

Si conocés la carpeta concreta donde quedó el trabajo de química, podés indicarla:

```powershell
& "$env:USERPROFILE\Downloads\Exportar_Quimica.ps1" -CarpetaTrabajo "C:\ruta\de\la\carpeta\de\quimica"
```

La carpeta debe contener `wade3\tramos.json`, `tramos.json`, `INSTR_wade3.md`, `step9n_pre.html` o `step9n.html`. Usá la carpeta del trabajo, no toda tu cuenta ni todo AppData.

El exportador conserva los originales, registra tamaños y hashes, comprueba los JSON de notas encontrados y marca los 31 tramos. Incluye solo sesiones cuyo ID o título coincidan y la memoria del proyecto indicado. Omite credenciales, repositorios internos y dependencias regenerables.

**Límite:** los archivos que existen solamente dentro de la VM de Cowork no se extraen con este script. Si no aparecen, habrá que exportarlos desde la tarea original cuando permita ejecutar un comando. El script tampoco presupone que el esquema local de sesión sea el de esta instalación.

El script fue revisado y preparado aquí, pero no se pudo ejecutar en tu Windows desde este chat.
