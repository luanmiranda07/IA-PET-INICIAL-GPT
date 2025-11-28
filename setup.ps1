Write-Host "Iniciando configuracao do ambiente..."

Write-Host "1. Instalando pipx..."
pip install pipx

Write-Host "2. Instalando uv..."
pipx install uv

Write-Host "3. Sincronizando dependências com uv, criando ambiente virtual..."
uv sync

Write-Host "Configuracao concluida!"
Pause
