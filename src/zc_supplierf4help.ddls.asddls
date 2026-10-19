@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier f4 Help'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define view entity ZC_SUPPLIERF4Help as select from ZI_Supplier
{
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    @Search.ranking: #MEDIUM  
    @EndUserText.label: 'Supplier ID'
    key Supplierid,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    @Search.ranking: #MEDIUM
    @EndUserText.label: 'Supplier Name'
    SupplierName
}
