@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Items  Quantity'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE

define view entity ZC_PurchaseItems_Quantity as select from ZI_PurchaseItems
{

    key PoHeader,
    key PoItem,
    ShortText,
    Material,
    Plant,
    MatGroup,
    @Semantics.quantity.unitOfMeasure: 'OrderUnit'
    OrderQunt,
    OrderUnit,
    @Semantics.amount.currencyCode: 'PriceUnit'
    ProductPrice,
 cast(  cast( OrderQunt as abap.dec(15,3) ) * cast( ProductPrice as abap.dec(15,2) ) as abap.dec(15,2) ) as TotalPrice,
    PriceUnit,
    LocalLastChangedBy,
    /* Associations */
    _Currency,
    _PurchaseHeader
}
