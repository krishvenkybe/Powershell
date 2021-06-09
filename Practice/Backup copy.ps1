$dest = '\\********\IT Backup 2019\SVN data'
$cred = Get-Credential -UserName "************"
$pss = New-PSSession -ComputerName "*******" -Credential $cred
Invoke-Command -Session $pss `
-ScriptBlock {Copy-Item "E:\" -Destination '$dest' -Recurse -Force -Credential $cred}
