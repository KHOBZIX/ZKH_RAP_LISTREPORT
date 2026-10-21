@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Header'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
define view entity zi_PurchaseHeader as select from zkhpoheader
//association [0..*] to ZI_PurchaseItems as _PurchaseItems on $projection.PoHeader = _PurchaseItems.PoHeader
association [0..*] to ZC_PurchaseItems_Quantity as _PurchaseItems on $projection.PoHeader = _PurchaseItems.PoHeader
association [1] to ZI_OrderType as _OderType on $projection.PoType = _OderType.PoType
association [1] to ZI_Supplier as _Supplier on $projection.Supplier = _Supplier.Supplierid
association [1] to ZC_SUPPLIER as _SupplierC on $projection.Supplier = _SupplierC.Supplierid
{
    key po_header as PoHeader,
    po_desc as PoDesc,
    po_type as PoType,
    company as Company,
    po_org as PoOrg,
    supplier as Supplier,
    _Supplier.SupplierName as SupplierName,
    _OderType.IsActive as Status,
     @Semantics.amount.currencyCode: 'PriceUnit'
    sum( _PurchaseItems.ProductPrice ) as TotalProductPrice, 
    _PurchaseItems.PriceUnit as PriceUnit,
    _OderType.Description as OTDescription,
    imageurl as Imageurl,
    createdby as Createdby,
    createat as Createat,
    changerby as Changerby,
    changeat as Changeat,
    _PurchaseItems,
    _OderType,
    _Supplier,
    _SupplierC
}
group by
    po_header,
    po_desc,
    po_type,
    company,
    po_org,
    supplier,
    _Supplier.SupplierName,
    _OderType.IsActive,
    _OderType.Description,
    imageurl,
    createdby,
    createat,
    changerby,
    changeat,
    _PurchaseItems.PriceUnit
    

