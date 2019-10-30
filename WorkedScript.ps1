# PowerShell Script to delete files and or folders older than X days.
# Version 1.0
#--------------------------------------------------------------------
net use Z: "\\192.168.2.21\USB_Store"
Z:
# Renaming the Old backup folder to temp
Rename-Item -Path 'Z:\Project Backup Old' "tmp"
Rename-Item -Path 'Z:\Project Backup New' "Project Backup Old"
New-Item -ItemType Directory -Path 'Z:\Project Backup New'
#--------------------------------------------------------------------
# Define scfript log file
$d1= (Get-Date).ToString("dd-MM-yyyy")
$logfile="E:\Backup_log\deletefiles_folders_" + $d1 +".log"
# Define the directory path to delete
$foldername = "Z:\tmp"
$folders = get-childitem $foldername -Recurse
echo "----------------------------------------" >> $logfile
$today = Get-Date
echo "Start deleting old backups at:" $today >> $logfile
# Define direcroty to delete
#
foreach ($item in $folders)
{
#
$deletefilesolderthan="1"
echo "deleting old files and or folders:"$item.FullName >>$logfile
Get-ChildItem -Path $item.FullName | Where CreationTime -lt (Get-Date).AddDays(-$deletefilesolderthan)| Remove-Item -Force -Recurse -ErrorAction SilentlyContinue  >> $logfile
#
Get-ChildItem -Path $item.FullName | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue >> $logfile
}
#
&cmd /c rmdir $foldername /S /Q
#
echo "Deleting old files and or folders is completed" >>$logfile