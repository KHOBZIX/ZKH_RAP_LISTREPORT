@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
define view entity ZC_SUPPLIER as select from ZI_Supplier
{
    key Supplierid,
    @Semantics.name.fullName: true
    @Semantics.text: true
    SupplierName,
    @Semantics.telephone.type: [ #CELL ]
    PhoneNumber,
    @Semantics.telephone.type: [ #FAX ]
    FaxNumber,
    @Semantics.eMail.type: [ #WORK ]
    WebAddress,
    LocalLastChangedBy
}
