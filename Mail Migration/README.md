# Mail Migration Steps

This guide will help you through the process of moving from one Office 365 tenant to another. This guide assumes that the domain that is being moved to the new Office 365 tenant is already in use in the old tenant. If that is not the case some steps may be simplified or skipped since the domain does not need to be stripped out of the old tenant.

Several assumptions are made:

    - No mailboxes will be on-premises in the new environment
    - Exchange is running 2010 or later
    - Azure AD Connect will be used for account creation
    - ADFS is not being used (the UPN matching script won't work if it is)
    - MigrationWiz is going to be used for mailbox migrations. Other options may be used, but this guide does not explictly address them.

## CSV Information

### Recommended Columns

    - Type
        - Identifies room, shared, or user mailbox
    - DisplayName
        - Name that can be used when creating objects
    - UserPrincipalName
        - This should be the UPN in the old tenant
    - CurrentPrimarySMTPAddress
        - This should be the primary SMTP address in the old tenant
    - PrimaryDomain
        - This should be the domain the user's mailbox uses for its primary SMTP address
    - RemoteRoutingAddress
        - This should be the @domain.mail.onmicrosoft.com address the user is assigned in the old tenant
    - Identity
        - This should be the UPN the user will use in the new tenant
        - The user cannot use the same UPN in both tenants, the UPN's domain MUST change as part of the project
    - TempUPN
        - This should be the UPN the user will use in the new tenant, but with a suffix of @domain.onmicrosoft.com instead of the UPN suffix they will use after the migration
        - This is necessary for setting up mail forwarding before the domain is moved from the old tenant to the new

See the ExampleCsv.csv file.

## Pre-Cutover Configuration Steps

    1. Validate that all UPNs are set to their final state in AD
    2. Install AD Connect and begin synchronizing objects to the new tenant. Users will get @domain.onmicrosoft.com UPNs since the domains haven't been moved over to the new tenant. This will be cleaned up in a later step.
    3. Install Exchange and configure Email Address Policies. Put in all desired accepted domains, even if the domains cannot be verified with Office 365 yet. The goal is to make sure the on-premises objects have the correct email addresses, even if not all of the attributes can be synced right away.
    4. Run Enable-O365Mailboxes.ps1

    - This script assumes that the user accounts already exist in AD
    - This should be run from the on-premises Exchange server that will be used for Hybrid in the new domain
    - The purpose of this step is to configure mail attributes on the on-premises AD objects and make them manageable in the on-premises Exchagne environment

    5. Run an AD Connect sync pass
    6. License all accounts that will have mailboxes, including Shared Mailboxes
    7. Wait for Exchange Online to create mailboxes for all of the users you licensed
    8. Convert relevant mailboxes to Shared Mailboxes in Exchange Online
    9. Remove licenses from mailboxes converted to Shared
    10. Run Set-TenantMailForwarding.ps1 in the new Exchange Online tenant to configure mail forwarding from the new mailboxes to the old mailboxes
    11. Pick a cutover date for moving the domain to the new tenant. Proceed to the next steps only during the cutover time period

## Cutover Steps

Perform these steps during the cutover window. This will typically be during a maintenance window.

    1. Open Remove-EmailAddresses.ps1 and customize line 67 to reflect the domain you will be removing from the old tenant
    2. Run Remove-EmailAddresses.ps1 on the on-premises Exchange server in the old domain to remove the relevant domain from mail objects
    3. Run an Azure AD Connect pass in the old environment
    4. Remove the domain from the old Office 365 tenant
    5. Verify the domain with the new Office 365 tenant
    6. Run the Hybrid Configuration Wizard in the new environment to configure the newly added domain for Hybrid
    7. Run an Azure AD Connect sync in the new environment
    8. Run Set-CloudUPNsToMatchEmail.ps1 to change the cloud user UPNs from @domain.onmicrosoft.com to their proper login addresses
    9. Test mailflow and forwarding from the new tenant to the old tenant.

## Post-Cutover Steps

These steps can be performed at any time after the cutover and do not need to be done during a maintenance window.

    1. Create MigrationWiz service accounts in both Office 365 tenants

        - They need Exchange Administrator rights for mail migrations
        - They need SharePoint Administrator rights for document migrations

    2. Create the endpoints in MigrationWiz to be used for the migration. Make sure to specify that Impersonation should be used.
    3. Prepare a CSV file to use for the MigrationWiz account provisioning (optional)

        - This step is option depending on how many mailboxes will be moved between tenants
        - If all mailboxes are going to be moved you can simply use the "Autodiscover" option to discover all the mailboxes that should be moved
        - If only a subset of mailboxes will be moved then use the CSV upload option
        - The CSV should contain these columns:
            - Source Email
                - Specify the primary email address of the user in the old tenant
            - Source Login Name
                - Leave blank
            - Source Password
                - Leave blank
            - Destination Email
                - Specify the user's email routing address in the new tenant, e.g. emailaddress@contoso.mail.onmicrosoft.com
            - Destination Login Name
                - Leave blank
            - Destination Password
                - Leave blank

    4. Upload the CSV to MigrationWiz to create the migration configurations
    5. Run the MigrationWiz credential test
    6. Run the Pre-Stage migration step for the desired users and wait for mail content syncing to complete before moving on to the next steps

## User Cutover Steps

These steps can be performed to complete a user's move to the new tenant. These should typically be performed after hours.

    1. Communicate that the cutover will be occurring to the user(s).
    2. Turn off forwarding for the desired users by running this command for each mailbox in the new Exchange Online tenant:

        `Set-Mailbox -Identity emailaddress@newdomain.com -DeliverToMailboxAndForward $false -ForwardingSMTPAddress $null`

    3. Turn on forwarding for the desired users by running this command for each mailbox in the old Exchange Online tenant:

        `Set-Mailbox -Identity emailaddress@olddomain.com -DeliverToMailboxAndForward $true -ForwardingSMTPAddress emailaddress@newdomain.com`

    4. Run the Full Migration task in MigrationWiz to move the remainder of the email data to the new tenant.
    5. Have the user reconfigure Outlook and devices to connect to the mailbox in the new tenant. This can be done manually or using a tool like BitTitan's DeploymentPro.