# Recuperación ordenada — Química Orgánica

Tarea: `cse_01RpfZ5mBTyDWi4i6QLaeCmp` · 4 de octubre de 2026.

**La recuperación todavía es parcial. Este paquete conserva lo que se pudo recuperar y deja identificado lo que falta. Los JSON de resultados originales de Wade no están dentro.**

## Qué hay en cada carpeta

| Carpeta | Contenido | Procedencia y límite |
|---|---|---|
| `01_contexto` | Cuatro memorias completas del proyecto, en Markdown y JSON; instrucciones del proyecto; prompt maestro anterior | Contenido visible de «Ver memoria» y del proyecto. El prompt maestro es del 31 de agosto; se conserva como antecedente. |
| `02_checkpoint` | Archivo `CHECKPOINT_v97_U2_ej8_ej9_flechas_2026-10-02.md` | Las 76 líneas que muestra actualmente el visor, recuperadas sin resumir. Aunque el nombre dice v97, su contenido llega hasta v132. No es todo el historial de la tarea. |
| `03_wade3_recuperado` | `tramos.json` y `mkap.py` | Contenidos reconstruidos fielmente a partir de los comandos originales visibles, sin ejecutarlos. Tamaños coincidentes con el listado histórico: 2.274 y 1.115 bytes. |
| `04_evidencias` | Comandos con sus salidas, extractos de historial y prueba del bloqueo | Evidencia visible recuperada, con duplicaciones posibles. No es una exportación completa de todos los mensajes ni de los agentes. |
| `05_apunte` | Apunte disponible: 461 archivos | Copia sin modificar del ZIP disponible: HTML, registros, CSS e imágenes. Contiene los registros hasta v132. No se verificó identidad byte a byte con `step9n_pre.html` del antiguo entorno. |
| `06_fuentes/Wade` | Ocho partes del Wade 5.ª edición | PDFs originales disponibles, conservados sin modificaciones. La secuencia indicada por los nombres abarca las páginas PDF 1–1282. |
| `07_exportacion_local` | Script para reunir archivos existentes en Windows e instrucciones | Hace una copia local de la sesión identificada y del proyecto; no usa un modelo, créditos ni red. No extrae el disco de la VM. |

`inventario.json` registra tamaño y SHA-256 de cada archivo incluido. `estado_recuperacion.json` y `FALTANTES.md` distinguen lo recuperado de los resultados originales aún inaccesibles.

## Lo confirmado

- `tramos.json` contiene 31 tramos que suman 623 páginas; coincide con la salida del comando original.
- Se recuperaron las cuatro entradas que aparecen en la memoria de este proyecto: **Preferences**, **Verification Rules**, **Apunte Maestro** y **Quimica organica**. Se preservó su texto, no una traducción ni un resumen. «Quimica organica» tiene un resumen sin detalles adicionales visibles.
- El checkpoint identifica v132 como publicación `artifact134` y una línea base histórica `rev2/v134pub_step9n.html`. La lectura posterior preparó sus extractos desde `step9n_pre.html`.
- Las memorias contienen estados anteriores (por ejemplo V8). Son antecedentes, no una prueba de la versión actual. Las contradicciones entre preferencias también se conservaron.
- El historial contiene entregas de verificación de W18a, W18c y W21b: 60 notas, con 44 aprobadas y 16 corregidas. **Se recuperó esa evidencia; no los tres archivos JSON completos.**
- Se solicitó exportar los archivos desde la tarea original. Cowork rechazó también esa solicitud por el límite semanal, con reinicio indicado para el **7 de octubre a las 19:00, Argentina**. El encabezado de la tarea mostraba la laptop conectada.

## Para llevarlo al siguiente chat

1. Descomprimí el paquete conservando las carpetas. El apunte está en `05_apunte/index.html`.
2. Si todavía no tenés el estado original, ejecutá el exportador local siguiendo `07_exportacion_local/PASO_LOCAL.md` y adjuntá el ZIP que genera. Un resultado que dice «no recuperado» no demuestra que se haya perdido el archivo: puede seguir dentro de la VM o de la sesión de Cowork.
3. Proporcioná al siguiente chat `00_LEEME.md`, `estado_recuperacion.json`, `01_contexto`, `02_checkpoint`, `03_wade3_recuperado` y cualquier exportación local obtenida. Los ocho PDF son las fuentes para verificar el Wade.
4. Usá `CONTINUAR_EN_CODE.txt` para pedir que se inventaríe primero el estado y se continúe desde lo comprobado.

El ID de Cowork identifica la tarea del sitio. Este paquete no convierte ese ID en una sesión local de Claude Code ni garantiza que `claude --resume` pueda abrirla.

No quedó una revisión de química ejecutándose en segundo plano. Los archivos originales no se modificaron ni se publicaron en GitHub.

## Referencias sobre dónde puede conservarse el estado

- [Arquitectura oficial de Cowork](https://support.claude.com/en/articles/14479288-claude-cowork-architecture-overview): las sesiones locales ejecutan código dentro de una VM Linux. Una ruta `/home/claude/work/...` no es por sí misma una ruta de Windows.
- [Cambios de Cowork y chat](https://support.claude.com/en/articles/16761823-claude-cowork-and-chat-are-one-claude): la carpeta de almacenamiento local se consulta desde Configuración en la app de escritorio.
- Las rutas candidatas del exportador se comprueban antes de usarlas. Incluyen la instalación de escritorio y la ubicación virtualizada de Windows Store descrita en el [reporte del repositorio oficial](https://github.com/anthropics/claude-code/issues/58421); no se presume que sean las de esta computadora.

## Actualización de recuperación adicional

Se añadieron 16 comandos y salidas, cuatro scripts, 10 fragmentos de verificación y dos notas corregidas completas. La recuperación total de los originales sigue pendiente. Consultá `ESTADO_ACTUAL.md` y `04_evidencias/recuperacion_adicional/LEEME.md`.
