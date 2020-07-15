$dest = '\\192.168.2.21\IT Backup 2019\SVN data'
$cred = Get-Credential -UserName "Ch-telliant\ithelpdesk"
$pss = New-PSSession -ComputerName "Tellserv02" -Credential $cred
Invoke-Command -Session $pss `
-ScriptBlock {Copy-Item "E:\" -Destination '$dest' -Recurse -Force -Credential $cred}