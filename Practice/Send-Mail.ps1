#region Mail2
# Send mail to the changes to the process counter in Resource monitor
Function Send-Mail {
    $myEmail = "*******"                                    #From Mail address
    $smtp = "smtp.office365.com"
    # $myEmail = "****@gmail.com"                           #From Mail Address
    # $smtp = "smtp.gmail.com"
    $To = "*****@gmail.com"                                 #To Mail Address
    $sub = "Memory Usage Report"
    $Body = "Memory usage"
    $File = "C:\Users\***\Desktop\Emailcred.txt"            #Email Credential Document
    
    $cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $myEmail, (Get-Content $File | ConvertTo-SecureString)
    Send-MailMessage -To $To -From $myEmail -Subject $sub -Body $Body -SmtpServer $smtp -Credential $cred -UseSsl -Port 587
     }
# $before = Get-Counter -Counter '\Process(notepad)\Working Set - Private' | Format-List -Property Readings
# Start-Sleep -Seconds 3
# $after = Get-Counter -Counter '\Process(notepad)\Working Set - Private' | Format-List -Property Readings

$Counter = Get-Counter -Counter "\Process(notepad)\Working Set" 
$before = $Counter.CounterSamples[0] | Select-Object -ExpandProperty CookedValue

Start-Sleep -Seconds 10

$after = $Counter.CounterSamples[0] | Select-Object -ExpandProperty CookedValue
if($before -eq $after)
    {
        #Write-Output "Check Success"
        Send-Mail
    }
#endregion
