net use G: \\192.168.1.12\J$

$date=Get-Date
$date=$date.ToString("dd-MMM-yyyy")



# Backup Script for the Redmine Application Server to the Harddisk
New-Item -ItemType directory 'G:\Redmine Server Backup\Application\temptest1'

Copy-Item -Path C:\Bitnami -Destination 'G:\Redmine Server Backup\Application\temptest1' -Recurse -Force

Rename-Item -Path 'G:\Redmine Server Backup\Application\temptest1' $date

$limit = (Get-Date).AddDays(-30)
$path1 = 'G:\Redmine Server Backup\Application'

# Delete files older than the $limit.
Get-ChildItem -Path $path1 -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item -Force

# Delete any empty directories left behind after deleting the old files.
Get-ChildItem -Path $path1 -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse





# Backup Script for the BonoboGit Server to the Harddisk
New-Item -ItemType directory 'G:\BonoboGit Server Backup\temptest2'

Copy-Item -Path F:\Bonobo.Git.Server -Destination 'G:\BonoboGit Server Backup\temptest2' -Recurse -Force

Copy-Item -Path F:\OLD -Destination 'G:\BonoboGit Server Backup\temptest2' -Recurse -Force

Rename-Item -Path 'G:\BonoboGit Server Backup\temptest2' $date

$limit = (Get-Date).AddDays(-30)
$path2 = 'G:\BonoboGit Server Backup'

# Delete files older than the $limit.
Get-ChildItem -Path $path2 -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item -Force

# Delete any empty directories left behind after deleting the old files.
Get-ChildItem -Path $path2 -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse





# Backup Script of the SVN server to the Harddisk
New-Item -ItemType Directory -Path 'G:\SVN Server Backup\tempsvn'

Copy-Item -Path 'E:\Accelitas' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\Aspen P3' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\COE' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\CollectorPro' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\ebatch' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\JavaPoCs' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\K2L' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\K2L_old' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\Kubtec' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\Matrix IT' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\Navitouch' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\NorthpointCF' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\PA Dashboard' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\PA Reports' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\Rabbit EHR' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\Rabbit EHR1' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\Sales Commission' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\Source' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\Tourex' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\tt' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\Tourexmessage' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force
Copy-Item -Path 'E:\TRM' -Destination 'G:\SVN Server Backup\tempsvn' -Recurse -Force

Rename-Item -Path 'G:\SVN Server Backup\tempsvn' $date

$limit = (Get-Date).AddDays(-30)
$path3 = 'G:\SVN Server Backup'

# Delete files older than the $limit.
Get-ChildItem -Path $path3 -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item -Force

# Delete any empty directories left behind after deleting the old files.
Get-ChildItem -Path $path3 -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse




# Redmine SQL Database backup utility

# Backup Script of the Redmine SQL Database to the Harddisk
New-Item -ItemType Directory -Path 'G:\Redmine Server Backup\Database\tempdb'

cd C:\Bitnami\redmine-3.3.3-1\mysql\bin\

.\mysqldump.exe -p bitnami_redmine -u root --password=Telliant1 > C:\Users\vradhakrishnan\Downloads\bitnami_redmine.sql

Move-Item -Path 'C:\Users\vradhakrishnan\Downloads\bitnami_redmine.sql' -Destination 'G:\Redmine Server Backup\Database\tempdb'

Rename-Item -Path 'G:\Redmine Server Backup\Database\tempdb' $date

$limit = (Get-Date).AddDays(-30)
$path4 = 'G:\Redmine Server Backup\Database'

# Delete files older than the $limit.
Get-ChildItem -Path $path4 -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item -Force

# Delete any empty directories left behind after deleting the old files.
Get-ChildItem -Path $path4 -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse

net use G: /delete