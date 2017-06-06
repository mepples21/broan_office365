# Connect to Nortek Tenant
$password = get-content C:\projects\broan\nortekpassword.txt | convertto-securestring
$UserCredential = new-object -typename System.Management.Automation.PSCredential -argumentlist "broan.wiz@nortek.com",$password
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session

set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Julie.Stefanski@broan.mail.onmicrosoft.com -Identity Julie.Stefanski@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Janet.Frank@broan.mail.onmicrosoft.com -Identity Janet.Frank@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Kim.Wenninger@broan.mail.onmicrosoft.com -Identity Kim.Wenninger@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Candy.Svien@broan.mail.onmicrosoft.com -Identity Candy.Svien@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Kayla.Grudzinski@broan.mail.onmicrosoft.com -Identity Kayla.Grudzinski@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Stan.Winarski@broan.mail.onmicrosoft.com -Identity Stan.Winarski@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Kathy.Ish@broan.mail.onmicrosoft.com -Identity Kathy.Ish@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Sylvia.Bartling@broan.mail.onmicrosoft.com -Identity Sylvia.Bartling@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Gene.Theisen@broan.mail.onmicrosoft.com -Identity Gene.Theisen@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Tracy.Lucht@broan.mail.onmicrosoft.com -Identity Tracy.Lucht@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Mike.Wallace@broan.mail.onmicrosoft.com -Identity Mike.Wallace@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Tammy.Smith@broan.mail.onmicrosoft.com -Identity Tammy.Smith@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Chuck.Trauba@broan.mail.onmicrosoft.com -Identity Chuck.Trauba@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Keith.Gray@broan.mail.onmicrosoft.com -Identity Keith.Gray@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Marnie.Kinney@broan.mail.onmicrosoft.com -Identity Marnie.Kinney@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Richard.Peterson@broan.mail.onmicrosoft.com -Identity Richard.Peterson@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Audrey.Wisth@broan.mail.onmicrosoft.com -Identity Audrey.Wisth@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Ryan.Revers@broan.mail.onmicrosoft.com -Identity Ryan.Revers@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Brady.Relihan@broan.mail.onmicrosoft.com -Identity Brady.Relihan@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress bryan.utz@broan.mail.onmicrosoft.com -Identity bryan.utz@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Cliff.Maas@broan.mail.onmicrosoft.com -Identity Cliff.Maas@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress dale.muhonen@broan.mail.onmicrosoft.com -Identity dale.muhonen@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress dennis.birmingham@broan.mail.onmicrosoft.com -Identity dennis.birmingham@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress greg.lorenz@broan.mail.onmicrosoft.com -Identity greg.lorenz@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress greg.lorenz@broan.mail.onmicrosoft.com -Identity greg.lorenz@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress kathleen.buckett@broan.mail.onmicrosoft.com -Identity kathleen.buckett@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Mike.Powers@broan.mail.onmicrosoft.com -Identity Mike.Powers@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Marge.Neumann@broan.mail.onmicrosoft.com -Identity Marge.Neumann@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Terri.Zubke@broan.mail.onmicrosoft.com -Identity Terri.Zubke@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Tom.Blackstone@broan.mail.onmicrosoft.com -Identity Tom.Blackstone@broan-nutone.com

# Disconnect from Nortek Tenant
Remove-PSSession $Session