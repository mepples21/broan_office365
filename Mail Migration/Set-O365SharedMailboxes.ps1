<#

.SYNOPSIS
Converts specified mailboxes to Shared Mailboxes.

.DESCRIPTION


.PARAMETER CsvPath
Specifies the CSV file to import to use for shared mailbox generation. The CSV must have 2 columns, Identity and Type. All other columns will be ignored.
The Identity column may contain the Name, Display name, Alias, Email address, or user principal name (UPN).
The Type column may contain RoomMailbox, EquipmentMailbox, SharedMailbox or UserMailbox. This script will only manipulate objects with SharedMailbox in the Type column.

.EXAMPLE


.LINK


.NOTES
Version: 1.0
Date: 03/30/2017
Authors: Michael Epping (mepping@concurrency.com)

Wishlist
    - Better error checking and handling

/#>

#Inputs
param(
    [Parameter(Mandatory=$true)][string]$CsvPath
)

#Define functions


#Execute script


#Import CSV data
$userdata = @()
$userdata = Import-Csv -Path $CsvPath


#Create Output File
$LogFileName = "Set-O365SharedMailboxes-$(Get-date -f yyyy-MM-dd-ss).log"
New-Item -Path $LogFileName
Start-Transcript -Path $LogFileName


#Check for Exchange Online PowerShell
$ExchangeOnlinePowerShell = Get-UnifiedGroup | select -First 1
if ($ExchangeOnlinePowerShell -eq $null) {
    Write-Host "ERROR: This script must be run from the Exchange Online (Office 365) Management Shell." -Foreground Red
    Exit(1)
}


#Run a foreach loop and convert relevant mailboxes to Shared
$results = @()
foreach ($user in $userdata) {

    if ($user.Type -eq "SharedMailbox") {
        try {
            Set-Mailbox -Identity $user.Identity -Shared
        }
        catch {
            Write-Host "Unable to convert $user to a Shared mailbox."
        }

    } else {
        Continue
    }

}

Stop-Transcript