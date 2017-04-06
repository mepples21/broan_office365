#Run from on-prem Exchange Management Shell to set the WindowsEmailAddress field to match the userPrincipalName field

Get-User abner.guo | Where { -Not [string]::IsNullOrEmpty($_.UserPrincipalName) } | ForEach { Set-User -Identity $_.Guid.ToString() -WindowsEmailAddress $_.UserPrincipalName.ToString() }