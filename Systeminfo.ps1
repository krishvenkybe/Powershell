$adcomputer = Get-ADComputer -Filter *
foreach ($computer in $adcomputer.name) 
{
    Invoke-Command -ComputerName $computer -ScriptBlock 
        {
            Get-ComputerInfo | Out-File -FilePath "\\192.168.9.114\temp bkp\systeminfo\$env:COMPUTERNAME.txt"
        }
}

#$adcomputer = Get-ADComputer -Filter *;
#foreach ($computer in $adcomputer.name)
#{
#   Invoke-Command -ComputerName $computer -ScriptBlock 
#        {
#            Write-Output "Computername : $computer"
#            Get-ComputerInfo | Out-File -FilePath "\\192.168.9.114\temp bkp\systeminfo\$env:COMPUTERNAME.txt"
#        }
#}

#region (Ping test for list of machines)
$gpfailedpcs = Get-Content -Path C:\Users\ithelpdesk\Desktop\test.txt
Foreach ($pc in $gpfailedpcs)
{
#Ping Test. If PC is shut off, script will stop for the current PC in pipeline and move to the next one.
$PingRequest = &cmd /c ping $Computer -n 1 
if ($PingRequest -contains "TTL")
{
Write-Output "Ping Failed in $pc"
Continue
}
else 
{Write-Output "Ping success in $pc"
}
}
#endregion

Invoke-Command -ComputerName telliant69 -ScriptBlock {Get-ComputerInfo | Out-File -FilePath "\\192.168.9.114\temp bkp\Systeminfo\$env:computername.txt"}