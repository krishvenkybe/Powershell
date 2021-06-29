#region Mail2
# Create the Credential file for the Email
(Get-Credential).Password | ConvertFrom-SecureString | Out-File -FilePath "C:\Users\***\Documents\EmailCred.txt"

Function Send-Mail {
    $myEmail = "***@gmail.com"
    # $smtp = "smtp.office365.com"
    $smtp = "smtp.gmail.com"
    # $myEmail = "*******@gmail.com"
    # $smtp = "smtp.gmail.com"
    $To = "****@telliant.net"
    $sub = "Memory Usage Report"
    $Body = "Memory usage"
    $File = "C:\Users\***\Documents\EmailCred.txt"
    $cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $myEmail, (Get-Content $File | ConvertTo-SecureString)

    Send-MailMessage -To $To -From $myEmail -Subject $sub -Body $Body -SmtpServer $smtp -Credential $cred -UseSsl -Port 465 #(587 for SSL)
     }

Send-Mail
#endregion
