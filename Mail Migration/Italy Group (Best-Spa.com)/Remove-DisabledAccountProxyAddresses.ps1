 $SMTPDomainToRemove = "@best-spa.com"
$AllUsers = Get-ADUser -Filter * -SearchBase "OU=_Disabled,OU=Accounts,DC=nortek,DC=com" -Properties proxyAddresses
Foreach($usr In $AllUsers)
{
    $NewAddressList = @()
    $OldAddressList = $usr.proxyAddresses
    Foreach($addr In $OldAddressList)
    {
        If(!($addr -Match $SMTPDomainToRemove))
        {
            $NewAddressList += $addr
        }
    }
    If($NewAddressList.Count -GT 0)
    {
        Set-ADUser $usr -Replace @{ 'proxyAddresses' = $NewAddressList}
    }
} 
