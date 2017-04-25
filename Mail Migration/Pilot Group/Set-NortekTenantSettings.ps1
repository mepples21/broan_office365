# Connect to Nortek Tenant
$password = get-content C:\projects\broan\nortekpassword.txt | convertto-securestring
$UserCredential = new-object -typename System.Management.Automation.PSCredential -argumentlist "broan.wiz@nortek.com",$password
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session

Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Julie.Stefanski@broan.mail.onmicrosoft.com -Identity Julie.Stefanski@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Janet.Frank@broan.mail.onmicrosoft.com -Identity Janet.Frank@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Kim.Wenninger@broan.mail.onmicrosoft.com -Identity Kim.Wenninger@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Candy.Svien@broan.mail.onmicrosoft.com -Identity Candy.Svien@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Kayla.Grudzinski@broan.mail.onmicrosoft.com -Identity Kayla.Grudzinski@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Stan.Winarski@broan.mail.onmicrosoft.com -Identity Stan.Winarski@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Kathy.Ish@broan.mail.onmicrosoft.com -Identity Kathy.Ish@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Gene.Theisen@broan.mail.onmicrosoft.com -Identity Gene.Theisen@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Tracy.Lucht@broan.mail.onmicrosoft.com -Identity Tracy.Lucht@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Mike.Wallace@broan.mail.onmicrosoft.com -Identity Mike.Wallace@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Tammy.Smith@broan.mail.onmicrosoft.com -Identity Tammy.Smith@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Chuck.Trauba@broan.mail.onmicrosoft.com -Identity Chuck.Trauba@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Keith.Gray@broan.mail.onmicrosoft.com -Identity Keith.Gray@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Marnie.Kinney@broan.mail.onmicrosoft.com -Identity Marnie.Kinney@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Richard.Peterson@broan.mail.onmicrosoft.com -Identity Richard.Peterson@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Ryan.Revers@broan.mail.onmicrosoft.com -Identity Ryan.Revers@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress Brady.Relihan@broan.mail.onmicrosoft.com -Identity Brady.Relihan@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress david.george@broan.mail.onmicrosoft.com -Identity david.george@broan-nutone.com
Set-Mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress michael.castrova@broan.mail.onmicrosoft.com -Identity michael.castrova@broan-nutone.com -Whatif

# Disconnect from Nortek Tenant
Remove-PSSession $Session