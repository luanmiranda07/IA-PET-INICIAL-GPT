Write-Host "Iniciando criacao do executavel..."

uv run pyinstaller --onefile --windowed --add-data "Pet Inicial modelo para IA.docx;." --add-data ".env;." --icon "ICON_PET_INICIAL_IA.ico" --name "AssistenteDEMOINICIAL" --collect-all PySide6 gui.py

Write-Host "Processo finalizado!"
Pause
