# Mail Migration Steps

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

1 Validate that all UPNs are set to their final state in AD
2 Install AD Connect and begin synchronizing objects to the new tenant. Users will get @domain.onmicrosoft.com UPNs since the domains haven't been moved over to the new tenant. This will be cleaned up in a later step.
3 Enable-O365Mailboxes.ps1

    - This script assumes that the user accounts already exist in AD
    - This should be run from the on-premises Exchange 
2 