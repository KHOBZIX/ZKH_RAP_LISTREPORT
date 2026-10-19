@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Total Price'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'PoHeader' ]
@Search.searchable: true
define view entity ZC_PurchaseHeader_Price as select from zi_PurchaseHeader
{
    @ObjectModel.text.element: [ 'PoDesc' ]
    key PoHeader,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    @Search.ranking: #HIGH  
    @EndUserText.label: 'Description'  
    PoDesc,
    PoType,
     @Semantics.amount.currencyCode: 'PriceUnit'
    sum( _PurchaseItems.ProductPrice ) as TotalProductPrice, 
    _PurchaseItems.PriceUnit as PriceUnit,
    Company,
    PoOrg,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    @Search.ranking: #MEDIUM   
    Supplier,
    SupplierName,
    case Status
    when 'X' then 'Active'
    when '' then 'Desactivate'
    else ''
    end as StatusDesc,
    Imageurl,
    Createdby,
    Createat,
    Changerby,
    Changeat,
    /* Associations */
    _OderType,
    _PurchaseItems,
    _Supplier,
    _SupplierC
}
group by
    PoHeader,
    PoDesc,
    PoType,
    Company,
    PoOrg,
    Supplier,
    Imageurl,
    Createdby,
    Createat,
    Changerby,
    Changeat,
    _PurchaseItems.PriceUnit,
    SupplierName,
    Status

