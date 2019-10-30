net use Z: "\\192.168.2.21\USB_Store"

Rename-Item -Path 'Z:\Project Backup Old' "temp"
Rename-Item -Path 'Z:\Project Backup New' "Project Backup Old"

New-Item -ItemType Directory -Path 'Z:\Project Backup New'


$folders = get-childitem "Z:\temp" | where-object {$_.PSIscontainer}

foreach ($folder in $folders)
{

$path = "Z:\temp\$folder"

# Delete files from the old backup.
Get-ChildItem -Path $path -Include * -Recurse -Force | Remove-Item -Include * -Force -Recurse -ErrorAction SilentlyContinue


# Delete any empty directories left behind after deleting the old files.
Get-ChildItem -Path $path -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

&cmd.exe /c rd /s /q $path

}
 
Get-ChildItem -Path "Z:\temp" -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

&cmd.exe /c rd /s /q "Z:\temp"