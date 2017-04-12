# Mail Migration Steps

This guide will help you through the process of moving from one Office 365 tenant to another. This guide assumes that the domain that is being moved to the new Office 365 tenant is already in use in the old tenant. If that is not the case some steps may be simplified or skipped since the domain does not need to be stripped out of the old tenant.

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

## Configuration Order

    1. Validate that all UPNs are set to their final state in AD
    2. Install AD Connect and begin synchronizing objects to the new tenant. Users will get @domain.onmicrosoft.com UPNs since the domains haven't been moved over to the new tenant. This will be cleaned up in a later step.
    3. Run Enable-O365Mailboxes.ps1

    - This script assumes that the user accounts already exist in AD
    - This should be run from the on-premises Exchange server that will be used for Hybrid in the new domain
    - The purpose of this step is to configure mail attributes on the on-premises AD objects and make them manageable in the on-premises Exchagne environment

    4. Run an AD Connect sync pass
    5. License all accounts that will have mailboxes, including Shared Mailboxes
    6. Wait for Exchange Online to create mailboxes for all of the users you licensed
    7. Convert relevant mailboxes to Shared Mailboxes in Exchange Online
    8. Remove licenses from mailboxes converted to Shared
    9. Run Set-TenantMailForwarding.ps1 in the new Exchange Online tenant to configure mail forwarding from the new mailboxes to the old mailboxes
    10. Pick a cutover date for moving the domain to the new tenant
    11. Open Remove-EmailAddresses.ps1 and customize line 67 to reflect the domain you will be removing from the old tenant
    12. Run Remove-EmailAddresses.ps1 on the on-premises Exchange server in the old domain to remove the relevant domain from mail objects
    13. 