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
    
    @ObjectModel.text.element: [ 'OTDescription' ]
    PoType,
    
    OTDescription,
    
    Company,
    
    PoOrg,
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    @Search.ranking: #MEDIUM   
    Supplier,
    
    SupplierName,
    
    case Status
        when 'X' then 'Active'
        when  '' then 'Blocked'
     else ''
    end as StatusDesc,
    
    case Status
        when 'X' then 3
        when  '' then 1
     else 0
    end as StatusValue,
    
    case 
        when TotalProductPrice < 50 then 1
        when TotalProductPrice > 50 and TotalProductPrice < 300 then 2
        when TotalProductPrice > 300 then 3
     else 0
    end as PriceValue,
    
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
    Status,
    OTDescription,
    TotalProductPrice

