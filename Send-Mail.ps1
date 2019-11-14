#region Mail
Function Send-Mail {
    $myEmail = "venkatesh.radhakrishnan@telliant.net"
    $smtp = "smtp.office365.com"
    # $myEmail = "venkatesh.radhakrishnan@telliant.com"
    # $smtp = "smtp.ionos.com"
    $To = "venkatesh.radhakrishnan@telliant.com"
    $sub = "Test mail from script"
    $Body = "Test mail from Script"
    $File = "C:\Users\vradhakrishnan\Desktop\testpass.txt"    
    $cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $myEmail, (Get-Content $File | ConvertTo-SecureString)
    
    
    Send-MailMessage -To $To -From $myEmail -Subject $sub -Body $Body -SmtpServer $smtp -Credential $cred -UseSsl -Port 587
    
    }

$before = (Get-Process notepad).PagedMemorySize /1MB

Start-Sleep -Seconds 10

$after = (Get-Process notepad).PagedMemorySize /1MB
if($before -eq $after)
    {
        Send-Mail
    }
#endregion


(Get-Credential).Password | ConvertFrom-SecureString | Out-File -FilePath “C:\Users\vradhakrishnan\Desktop\testpass.txt"
# $cred = (Get-Credential -Credential "$myEmail")

# $cred.Password = ConvertTo-SecureString -String "Venkat@1992" -AsPlainText -Force
    # $credentials = Get-Credential
    # $encrypted = $credentials.Password | ConvertFrom-SecureString
    # $cred = New-Object System.Management.Automation.PSCredential $myEmail,$encrypted

# $credentials = Get-Credential
# $encrypted = $credentials.Password | ConvertFrom-SecureString
# $encrypted
<#Function Mail-Send {
$myEmail = "venkatesh.radhakrishnan@telliant.net"
$smtp = "smtp.office365.com"
$myEmail = "venkatesh.radhakrishnan@telliant.com"
$smtp = "smtp.ionos.com"
$To = "venkatesh.radhakrishnan@telliant.com"
$sub = "Test mail from script"
$Body = "Test mail from Script"
$cred = (Get-Credential -Credential "$myEmail")

Send-MailMessage -To $To -From $myEmail -Subject $sub -Body $Body -SmtpServer $smtp -Credential $cred -UseSsl -Port 587

}#>