@echo off
setlocal enabledelayedexpansion

echo Restoring MotorTown save files...
REM Define source and destination paths. Change these if your save files are located elsewhere or if you have to restore from a different backup location.

set "BACKUP_DIR=%USERPROFILE%\Desktop\MotorTown Backups"