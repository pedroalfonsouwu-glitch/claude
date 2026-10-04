# Recuperación adicional desde el último punto trabajado

Se conservaron 16 comandos con sus salidas visibles, cuatro cuerpos completos de scripts y dos textos corregidos completos (W18c-06 y W18c-07). Sus longitudes coinciden con los controles originales: 2.429 y 2.477 caracteres. Se extrajeron 10 fragmentos de verificación con valores literales; las expresiones que necesitan archivos faltantes se conservaron sin resolver.

Los scripts no se ejecutaron. `commands_from_cowork.json` conserva el texto y salida originales que muestra la interfaz. `comandos_y_salidas` separa cada registro sin cambiarlo. `tool_details_from_cowork.json` conserva otros controles abiertos, incluidos dos errores del verificador W11a. Una de esas salidas contiene un truncamiento explícito de 18.550 caracteres; no se rellenó el hueco. `session_main_snapshot.txt` es una lectura parcial de la interfaz, no la transcripción completa del chat.

Los cuerpos extraídos están en `03_wade3_recuperado/fragmentos_historicos`, con procedencia y SHA-256. Aunque un fragmento tenga una nota completa, no sustituye al conjunto `out_*.json`, `ver_*.json` ni `led_*.md` de la tarea. No se pudo confirmar el último comando exitoso global de todos los agentes. Los conteos de las salidas son controles históricos, no un inventario actual de la VM.

El próximo paso requiere una exportación local o de la sesión original. El exportador preparado copia lo que encuentra en Windows; no extrae el disco de la VM y puede no alcanzar todos los archivos. Si consigue los registros originales, se podrá revisar si contienen los datos faltantes.
