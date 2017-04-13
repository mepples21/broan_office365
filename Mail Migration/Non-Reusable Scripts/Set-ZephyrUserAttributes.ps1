#Create and populate the array
$zephyrUsers = @()
$zephyrUsers = Get-User -OrganizationalUnit "OU=Users,OU=Zephyr,OU=SITES,OU=BROAN,DC=broan,DC=com"

#Process each object one at a time
foreach ($user in $zephyrUsers) {
    
    #Build username values
    $Firstname = $user.FirstName.ToString()
    $Lastname = $user.LastName.ToString()
    $userName = $Firstname+$Lastname.substring(0,1)
    $UPN = $userName+'@zephyronline.com'
    
    #Write AD object changes
    Set-User -Identity $user.Guid.Guid -SamAccountName $userName -UserPrincipalName $UPN
}