@echo off
setlocal enabledelayedexpansion

echo Restoring MotorTown save files...
REM Define source and destination paths. Change these if your save files are located elsewhere or if you have to restore from a different backup location.

set "BACKUP_DIR=%USERPROFILE%\Desktop\MotorTown Backups"
set "MTOWNSAVEFILE=%USERPROFILE%\AppData\Local\MotorTown\Saved\SaveGames"

echo Choose a backup folder to restore from by entering the corresponding folder name:
echo Available backup folders:
dir "%BACKUP_DIR%" /b

set /p "SELECTED_BACKUP=Enter the folder name of the backup you want to restore: "
set "SELECTED_DATE=%BACKUP_DIR%\%SELECTED_BACKUP%"

if not exist "%SELECTED_DATE%" (
    echo The specified backup folder does not exist. Please check the name and try again.
    echo Press any key to exit...
    pause >nul
    exit /b 1
)

Echo Choose a backup folder to restore from by entering the corresponding folder name:
echo Available backup folders:
dir "%SELECTED_DATE%" /b

set /p "SELECTED_DATE_BACKUP=Enter the folder name of the backup you want to restore: "
set "SELECTED_BACKUP_PATH=%SELECTED_DATE%\%SELECTED_DATE_BACKUP%"
if not exist "%SELECTED_BACKUP_PATH%" (
    echo The specified backup folder does not exist. Please check the name and try again.
    echo Press any key to exit...
    pause >nul
    exit /b 1
)

echo Creating a backup of current save files before restoring...
call mtownbackup.bat

if errorlevel 1 (
    echo Backup failed. Restore aborted.
    echo Press any key to exit...
    pause >nul
    exit /b 1
)

echo Clearing current save files...
rmdir /s /q "%MTOWNSAVEFILE%"
mkdir "%MTOWNSAVEFILE%"
echo Restoring save files from backup...
xcopy "%SELECTED_BACKUP_PATH%" "%MTOWNSAVEFILE%" /E /H /C /I /Y

If exist "%MTOWNSAVEFILE%\Characters" (
    echo Restore successful! Save files restored from: "%SELECTED_BACKUP_PATH%" to "%MTOWNSAVEFILE%"
) else (
    echo Restore failed. Please check for errors and try again.
)


pause
