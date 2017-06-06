# Connect to Broan Tenant
$password = get-content C:\projects\broan\broanpassword.txt | convertto-securestring
$UserCredential = new-object -typename System.Management.Automation.PSCredential -argumentlist "broan.wiz@nortek.com",$password
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session

set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity david.george@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity david.larson@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity don.gehring@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity doug.worzalla@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity gary.behm@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity george.bentley@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity jason.casey@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity jeff.hurlbut@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity john.harmon@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity jon.wall@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity joy.keller@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity julie.stefanski@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity ken.garfinkel@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity kris.volkman@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity landon.flaig@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity michael.castrova@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity mike.boland@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity pam.jerzak@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity pradeep.chukkala@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity ryan.robenhorst@broan.com
set-mailbox -DeliverToMailboxAndForward $false -ForwardingSmtpAddress $null -Identity samantha.manning@broan.com

# Disconnect from Broan Tenant
Remove-PSSession $Session