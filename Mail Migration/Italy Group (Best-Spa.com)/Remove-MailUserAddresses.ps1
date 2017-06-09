$mailusers = @()
$mailusers = Get-MailUser -ResultSize Unlimited

$mailusers | ForEach-Object {
            for ($i=0;$i -lt $_.EmailAddresses.Count; $i++)
            {
                $address = $_.EmailAddresses[$i]
                if ($address.IsPrimaryAddress -eq $false -and $address.SmtpAddress -like $domain )
                {
                    Write-Host($address.AddressString.ToString() | out-file .\addressesRemoved -Append )
                    $_.EmailAddresses.RemoveAt($i)
                    $i--
                }
            }
            Set-MailUser -Identity $_.Identity -EmailAddresses $_.EmailAddresses
        }