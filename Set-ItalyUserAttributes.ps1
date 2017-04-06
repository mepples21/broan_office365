$cerretoUsers = @()
$cerretoUsers = Get-User -OrganizationalUnit "OU=Users,OU=Cerreto D'Esi,OU=SITES,OU=BROAN,DC=broan,DC=com"
 
foreach ($user in $cerretoUsers) {
    
    #Build username values
    $Firstname = $user.FirstName.ToString()
    $Lastname = $user.LastName.ToString()
    $userName = $Firstname+$Lastname
    $UPN = $userName+'@broan.com'
    
    
    Set-User -Identity $user.Guid.Guid -SamAccountName $userName -UserPrincipalName $UPN
} 
