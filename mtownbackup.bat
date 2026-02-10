@echo off
setlocal enabledelayedexpansion

echo Backing up MotorTown save files... 
REM Define source and destination paths. Change these if your save files are located elsewhere or if you want to store backups in a different location.
set "SOURCE=%USERPROFILE%\AppData\Local\MotorTown\Saved\SaveGames"
set "BACKUP_DIR=%USERPROFILE%\Desktop\MotorTown Backups"

REM Get today's date in YYYY-MM-DD format
for /f %%a in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set "TODAY=%%a"
for /f %%a in ('powershell -NoProfile -Command "Get-Date -Format HH-mm-ss"') do set "SystemTime=%%a"

REM Create a unique backup folder based on the current date and time
set DATE_DEST=%BACKUP_DIR%\%TODAY%
set TIME_DEST=%DATE_DEST%\%SystemTime%

REM Check if the source folder exists
if not exist "%SOURCE%" (
    echo Source folder not found: "%SOURCE%"
    echo Backup failed. Please ensure MotorTown is installed and has been run at least once.
    echo Press any key to exit...
    pause >nul
    exit /b 1
)

REM Check if the backup directory exists, if not create it
if not exist "%BACKUP_DIR%" (
    mkdir "%BACKUP_DIR%"
    echo Created backup directory: "%BACKUP_DIR%"
)

REM Create destination folder if it doesn't exist
mkdir "%TIME_DEST%"

REM Copy the SavedGames folder to the destination
xcopy "%SOURCE%" "%TIME_DEST%" /E /H /C /I /Y

if exist "%TIME_DEST%\Characters" (
    echo Backup successful! Files copied to: "%TIME_DEST%"

) else (
    echo Backup failed. Please check for errors and try again.
    echo Press any key to exit...
    pause >nul
    exit /b 1

)
