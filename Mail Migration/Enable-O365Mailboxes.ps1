<#

.SYNOPSIS
Creates mailboxes in Office 365 and links existing user accounts on-prem.

.DESCRIPTION


.PARAMETER CsvPath
Specifies the CSV file to import to use for user account generation. The CSV can have 3 columns, Identity and RemoteRoutingAddress. All other columns will be ignored.
The Identity column may contain the ADObjectID,GUID,Distinguished name (DN),Domain\SamAccountName,User principal name (UPN),LegacyExchangeDN, or User alias.
A third column called Type may also be included if you have room or equipment mailboxes. The Type column may contain RoomMailbox, EquipmentMailbox, SharedMailbox or UserMailbox.

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
$LogFileName = "Enable-O365Mailboxes-$(Get-date -f yyyy-MM-dd-ss).log"
New-Item -Path $LogFileName
Start-Transcript -Path $LogFileName


#Check for Exchange PowerShell
$PSSessionServer = Get-ExchangeServer (Get-PSSession | Where-Object {$_.State -eq 'Opened'}).ComputerName
if ($PSSessionServer.AdminDisplayVersion.Major -eq 14) { $ExVersion = "2010" }
if ($PSSessionServer.AdminDisplayVersion.Major -eq 15 -and $PSSessionServer.AdminDisplayVersion.Minor -eq 0) { $ExVersion = "2013" }
if ($PSSessionServer.AdminDisplayVersion.Major -eq 15 -and $PSSessionServer.AdminDisplayVersion.Minor -eq 1) { $ExVersion = "2016" }
if ($ExVersion -eq $null) {
    Write-Host "ERROR: This script must be run from the Exchange Management Shell on an Exchange 2010-2016 server." -Foreground Red
    Exit(1)
}


#Run a foreach loop and enable each mailbox
foreach ($user in $userdata) {

    if ($user.Type -eq "RoomMailbox") {
        try {
            Enable-RemoteMailbox -Identity $user.Identity -RemoteRoutingAddress $user.RemoteRoutingAddress -Room -ErrorAction Stop
        }
        catch {
            Write-Host "Failed to create mailbox for $user"
        }

    } elseif ($user.Type -eq "EquipmentMailbox") {
        try {
            Enable-RemoteMailbox -Identity $user.Identity -RemoteRoutingAddress $user.RemoteRoutingAddress -Equipment -ErrorAction Stop
        } catch {
            Write-Host "Failed to create mailbox for $user"
        }

    } else {
        try {
            Enable-RemoteMailbox -Identity $user.Identity -RemoteRoutingAddress $user.RemoteRoutingAddress -ErrorAction Stop
        } catch {
            Write-Host "Failed to create mailbox for $user"
        }

    }

}

Stop-Transcript
Write-Host "Please review the log file at $LogFileName" -BackgroundColor Green -ForegroundColor Black