#region (Ping test for list of machines)
$gpfailedpcs =Get-Content -Path "C:\Users\vradhakrishnan\Desktop\failedpcs.txt"
Foreach ($pc in $gpfailedpcs)
{
#Ping Test.
$PingRequest = Test-Connection $pc -Count 1 -Quiet
if ($PingRequest -eq $false)
{
Write-Output "Ping Failed in $pc" | Out-File -FilePath "C:\Users\vradhakrishnan\Desktop\pingfailed.txt" -Append
}
else 
{
Write-Output "Ping success in $pc" | Out-File -FilePath "C:\Users\vradhakrishnan\Desktop\pingsuccess.txt" -Append
}
}
#endregion