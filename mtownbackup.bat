@echo off
setlocal enabledelayedexpansion

REM Get today's date in YYYY-MM-DD format
for /f %%a in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set "TODAY=%%a"

REM Get the current user's profile path
set "USERPROFILE=%USERPROFILE%"

REM Define source and destination paths
set "SOURCE=%USERPROFILE%\AppData\Local\MotorTown\Saved\SaveGames"
set "DEST=%USERPROFILE%\Desktop\Saves backup\%TODAY%"

REM Create destination folder if it doesn't exist
if not exist "%DEST%" (
    mkdir "%DEST%"
)

REM Copy the SavedGames folder to the destination
xcopy "%SOURCE%" "%DEST%\SaveGames" /E /H /C /I /Y

echo Backup completed to: "%DEST%\SavedGames"
pause
