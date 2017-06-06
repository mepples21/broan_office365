# Connect to Broan Tenant
$password = get-content C:\projects\broan\broanpassword.txt | convertto-securestring
$UserCredential = new-object -typename System.Management.Automation.PSCredential -argumentlist "broan.wiz@nortek.com",$password
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session

set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Julie.Stefanski@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Janet.Frank@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Kim.Wenninger@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Candy.Svien@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Kayla.Grudzinski@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Stan.Winarski@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Kathy.Ish@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Sylvia.Bartling@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Gene.Theisen@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Tracy.Lucht@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Mike.Wallace@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Tammy.Smith@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Chuck.Trauba@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Keith.Gray@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Marnie.Kinney@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Richard.Peterson@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Audrey.Wisth@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Ryan.Revers@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Brady.Relihan@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity bryan.utz@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Cliff.Maas@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity dale.muhonen@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity dennis.birmingham@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity greg.lorenz@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity greg.lorenz@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity kathleen.buckett@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Mike.Powers@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Marge.Neumann@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Terri.Zubke@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity Tom.Blackstone@broan.com

# Disconnect from Broan Tenant
Remove-PSSession $Session