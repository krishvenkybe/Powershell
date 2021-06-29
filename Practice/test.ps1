#region (Ping test for list of machines)
$systems =  Import-Csv -Path "C:\Users\v********\Downloads\Asset_Report_Nov2019.csv" | `
            Select-Object -ExpandProperty "Machine Name"
# $systems | Get-Member
# #Ping Test.
foreach($pcs in $systems)
    {
        if(Test-Connection $pcs -Count 1 -Quiet)
        {
            Write-Output "$pcs, Success" | Out-File -FilePath "C:\Users\v**********\Desktop\test.txt" -Append
        }
        else
        {
            Write-Output "$pcs, Failed" | Out-File -FilePath "C:\Users\v************\Desktop\test.txt" -Append
        }
    }
$1 = Get-Content -Path "C:\Users\v**********\Desktop\test.txt"
$2 = $1 | Export-Csv -Delimiter ',' -Path "C:\Users\v*********\Desktop\test1.csv"

#endregion
