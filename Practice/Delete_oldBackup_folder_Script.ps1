# PowerShell Script to delete files and or folders older than X days.
#--------------------------------------------------------------------
Z:
# Renaming the Old backup folder to temp
Rename-Item -Path 'Z:\Project Backup Old' "tmp"
Rename-Item -Path 'Z:\Project Backup New' "Project Backup Old"
New-Item -ItemType Directory -Path 'Z:\Project Backup New'
#--------------------------------------------------------------------
# Define scfript log file
$d1= (Get-Date).ToString("dd-MM-yyyy")
$logfile="D:\Backup_log\deletefiles_folders_" + $d1 +".log"
# Define the directory path to delete
$foldername = "Z:\tmp"
$today = Get-Date
echo "Start deleting old backups at:" $today >> $logfile
$folders = get-childitem $foldername 
foreach ($folder in $folders)
        { 
            $Itempath = "Z:\tmp\$folder"
            echo "----------------------------------------" >> $logfile
            echo "deleting old files and or folders:" $today.DateTime $folder.fullname >>$logfile
            $path = Get-ChildItem $Itempath
            #Define direcroty to delete
            echo "----------------------------------------" >> $logfile
            foreach ($item in $path)
                {
                echo $item.FullName >>$logfile
                Get-ChildItem -Path $item.FullName -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue  >> $logfile
                #
                Get-ChildItem -Path $item.FullName -Recurse | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue >> $logfile
                            
                
                &cmd /c rmdir $item.FullName /S /Q
                }
        echo "----------------------------------------" >> $logfile
        &cmd /c rmdir $Itempath /S /Q
        }

&cmd /c rmdir $foldername /S /Q
#
echo "Deleting old files and or folders is completed" >>$logfile