# MotortownBTW-Save-File-Backup
***

This Repo consists two shell files, responsible for backing up your MotorTown: Behind the Wheel save file into a location for safe keeping.

## mtownbackup.bat
mtownbackup.bat can be used to automatically go into your save file and back it up to a location, currently Desktop. This location can be changed by modifying "BACKUP_DIR", and changing it to the location you desire.

This script can be run by pressing on the shell file, or through command prompt.
Additionally, This code can be set to run automatically through task scheduler on WINDOWS, or CRON JOBS on Linux or MACOS.

Here is a tutorial on this:
https://www.youtube.com/watch?v=yqhk2cNdf1U

***

## retorebackup.bat:
Backups can be restored by replacing your MotorTown save file with the contents of a save file, or by running the restorebackup.bat file, and following the onscreen instructions. Note this should only be run when needed.

***

## NOTES
Source and destination paths may need to be modified slighly based off your save file location and prefrences. Replace these paths with your actual path if it differs
