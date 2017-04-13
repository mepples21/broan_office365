#Gather user data
$remotemailboxes = @()
$remotemailboxes = Get-RemoteMailbox -ResultSize Unlimited


$remotemailboxes | ForEach-Object {
    for ($i=0;$i -lt $_.EmailAddresses.Count; $i++)
    {
        $address = $_.EmailAddresses[$i]
        if ($address.IsPrimaryAddress -eq $false -and $address.SmtpAddress -like "*nortekinc.mail.onmicrosoft.com" )
        {
            Write-host($address.AddressString.ToString() | out-file c:\addressesRemoved.txt -append )
            $_.EmailAddresses.RemoveAt($i)
            $i--
        }
    }
    Set-RemoteMailbox -Identity $_.Identity -EmailAddresses $_.EmailAddresses
}

