@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Type F4 Help'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define view entity ZC_OrderTypeF4Help as select from ZI_OrderType
{
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    @Search.ranking: #HIGH
    @EndUserText.label: 'Order Type'
    key PoType,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    @Search.ranking: #MEDIUM
    @EndUserText.label: 'Description'
    Description
}
