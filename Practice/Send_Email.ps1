#region Mail2
# Create the Credential file for the Email
# (Get-Credential).Password | ConvertFrom-SecureString | Out-File -FilePath "C:\Users\venkat\Documents\EmailCred.txt"

# Function Send-Mail {
#     $myEmail = "krishvenkybe@gmail.com"
#     # $smtp = "smtp.office365.com"
#     $smtp = "smtp.gmail.com"
#     # $myEmail = "rambtech.k@gmail.com"
#     # $smtp = "smtp.gmail.com"
#     $To = "venkatesh.radhakrishnan@telliant.net"
#     $sub = "Memory Usage Report"
#     $Body = "Memory usage"
#     $File = "C:\Users\venkat\Documents\EmailCred.txt"
#     $cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $myEmail, (Get-Content $File | ConvertTo-SecureString)

#     Send-MailMessage -To $To -From $myEmail -Subject $sub -Body $Body -SmtpServer $smtp -Credential $cred -UseSsl -Port 465 #(587 for SSL)
#      }

# Send-Mail
Function Send-Mail {
    $from = "venkatesh.radhakrishnan@telliant.net"
    $to = "venkatesh.radhakrishnan@telliant.net"
    $sub = "Test"
    $body = "Message Received successfully"
    $file = "C:\Users\venkat\Documents\EmailCred.txt"
    # $SMTPServer = "smtp.outlook.com"
    $SMTPServer = "smtp.office365.com"
    $SMTPClient = New-object Net.Mail.SmtpClient($smtpserver, 587)
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential("venkatesh.radhakrishnan@telliant.net", (Get-Content $File | ConvertTo-SecureString));
    $SMTPClient.Send($from, $to, $sub, $body)
}
Send-Mail
#endregion