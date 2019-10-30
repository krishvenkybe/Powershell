$disk = Get-WmiObject win32_logicaldisk -ComputerName $computername -Filter "DeviceID='C:'" | Select-Object Size, Freespace
param([parameter(Mandatory=$true)][string]$computername)
Write-Host "Size of the C drive is " ($disk.Size/1GB)"GB"
Write-Host "Size of the Free space is " ($disk.Freespace/1GB)"GB"

@pause