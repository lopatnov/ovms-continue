# PowerShell скрипт запуска OpenVINO Model Server
Write-Host "Starting OpenVINO Model Server..." -ForegroundColor Green
Write-Host "Port: 8000" -ForegroundColor Cyan
Write-Host "Config: models/config_all.json" -ForegroundColor Cyan
Write-Host ""

# Переход в директорию проекта
Set-Location -Path $PSScriptRoot

# Установка переменных окружения
& ".\ovms\setupvars.bat"

# Запуск OVMS
& ".\ovms\ovms.exe" --rest_port 8000 --config_path "models\config_all.json"
