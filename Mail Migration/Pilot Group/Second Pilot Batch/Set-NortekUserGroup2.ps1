# Connect to Nortek Tenant
$password = get-content C:\projects\broan\nortekpassword.txt | convertto-securestring
$UserCredential = new-object -typename System.Management.Automation.PSCredential -argumentlist "broan.wiz@nortek.com",$password
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session

set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress david.george@broan.mail.onmicrosoft.com -Identity david.george@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress david.larson@broan.mail.onmicrosoft.com -Identity david.larson@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress don.gehring@broan.mail.onmicrosoft.com -Identity don.gehring@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress doug.worzalla@broan.mail.onmicrosoft.com -Identity doug.worzalla@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress gary.behm@broan.mail.onmicrosoft.com -Identity gary.behm@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress george.bentley@broan.mail.onmicrosoft.com -Identity george.bentley@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress jason.casey@broan.mail.onmicrosoft.com -Identity jason.casey@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress jeff.hurlbut@broan.mail.onmicrosoft.com -Identity jeff.hurlbut@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress john.harmon@broan.mail.onmicrosoft.com -Identity john.harmon@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress jon.wall@broan.mail.onmicrosoft.com -Identity jon.wall@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress joy.keller@broan.mail.onmicrosoft.com -Identity joy.keller@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress julie.stefanski@broan.mail.onmicrosoft.com -Identity julie.stefanski@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress ken.garfinkel@broan.mail.onmicrosoft.com -Identity ken.garfinkel@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress kris.volkman@broan.mail.onmicrosoft.com -Identity kris.volkman@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress landon.flaig@broan.mail.onmicrosoft.com -Identity landon.flaig@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress michael.castrova@broan.mail.onmicrosoft.com -Identity michael.castrova@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress mike.boland@broan.mail.onmicrosoft.com -Identity mike.boland@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress pam.jerzak@broan.mail.onmicrosoft.com -Identity pam.jerzak@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress pradeep.chukkala@broan.mail.onmicrosoft.com -Identity pradeep.chukkala@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress ryan.robenhorst@broan.mail.onmicrosoft.com -Identity ryan.robenhorst@broan-nutone.com
set-mailbox -DeliverToMailboxAndForward $true -ForwardingSmtpAddress samantha.manning@broan.mail.onmicrosoft.com -Identity samantha.manning@broan-nutone.com

# Disconnect from Nortek Tenant
Remove-PSSession $Session