@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
define view entity ZI_Supplier as select from zkhsupplier
{
    key supplierid as Supplierid,
    supplier_name as SupplierName,
    email_address as EmailAddress,
    phone_number as PhoneNumber,
    fax_number as FaxNumber,
    web_address as WebAddress,
    local_last_changed_by as LocalLastChangedBy
}
