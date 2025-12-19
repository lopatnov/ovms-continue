@echo off
REM Скрипт запуска OpenVINO Model Server для Code Completion

echo Starting OpenVINO Model Server...
echo Port: 8000
echo Config: models/config_all.json
echo.

cd /d "%~dp0"

REM Установка переменных окружения
call ovms\setupvars.bat

REM Запуск OVMS
ovms\ovms.exe --rest_port 8000 --config_path models/config_all.json

pause
