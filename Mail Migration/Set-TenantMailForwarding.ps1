<#

.SYNOPSIS
Sets up cross-tenant forwarding on mailboxes specified in a CSV file.

.DESCRIPTION
This script assists with setting up cross-tenant forwarding for migrations from one Office 365 tenant to another. It assumes that there is a CSV file available that contains
mailbox information. There should be at least two columns, Identity and RemoteRoutingAddress. Identity should identify the mailbox in the tenant, preferably using the
mailbox's email address. RemoteRoutingAddress should contain the email address mail should be forwarded to for coexistence. Typically this will be in the format
emailaddress@contoso.mail.onmicrosoft.com.

.PARAMETER CsvPath
Specifies the CSV file to import to use for mail forwarding. The CSV can have 3 columns, Identity and RemoteRoutingAddress. All other columns will be ignored.
The Identity column may contain the ADObjectID,GUID,Distinguished name (DN),Domain\SamAccountName,User principal name (UPN),LegacyExchangeDN, or User alias.
A third column called Type may also be included if you have room or equipment mailboxes. The Type column may contain RoomMailbox, EquipmentMailbox, SharedMailbox or UserMailbox.

.PARAMETER ForwardingDomain
Specifies the domain to use for the mail forwarding address suffixes. Should only be used if the full forwarding address is not listed in the CSV file and only the account prefix
is listed.

.EXAMPLE
./Set-TenantMailForwarding.ps1 -CsvPath ./MailboxList.csv

.EXAMPLE
./Set-TenantMailForwarding.ps1 -CsvPath ./MailboxList.csv -ForwardingDomain contoso.mail.onmicrosoft.com

.LINK
https://github.com/mepples21/PowerShell/blob/master/Clients/Broan/Set-TenantMailForwarding.ps1

.NOTES
Version: 1.0
Date: 04/04/2017
Authors: Michael Epping (mepping@concurrency.com)

Wishlist
    - Better error checking and handling

/#>

#Inputs
param(
    [Parameter(Mandatory=$true)][string]$CsvPath,
    [Parameter(Mandatory=$false)][string]$ForwardingDomain
)

#Define functions


#Execute script


#Import CSV data
$userdata = @()
$userdata = Import-Csv -Path $CsvPath


#Create Output File
$LogFileName = "Set-TenantMailForwarding-$(Get-date -f yyyy-MM-dd-ss).log"
New-Item -Path $LogFileName
Start-Transcript -Path $LogFileName

#Check for Exchange Online PowerShell
$ExchangeOnlinePowerShell = Get-UnifiedGroup | Select-Object -First 1
if ($ExchangeOnlinePowerShell -eq $null) {
    Write-Host "ERROR: This script must be run from the Exchange Online (Office 365) Management Shell." -Foreground Red
    Exit(1)
}

#Run a foreach loop and enable each mailbox
if ($ForwardingDomain) {

    foreach ($user in $userdata) {
        $forwardingaddress = $user.RemoteRoutingAddress + $ForwardingDomain
        Set-Mailbox -Identity $user.Identity -DeliverToMailboxAndForward $true -ForwardingSMTPAddress $forwardingaddress
    }

} else {

    foreach ($user in $userdata) {
        Set-Mailbox -Identity $user.TempUPN -DeliverToMailboxAndForward $true -ForwardingSMTPAddress $user.RemoteRoutingAddress
    }

}

Stop-Transcript
Write-Host "Please review the log file at $LogFileName" -BackgroundColor Green -ForegroundColor Black