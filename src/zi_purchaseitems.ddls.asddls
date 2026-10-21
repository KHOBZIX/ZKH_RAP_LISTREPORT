@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Itrems'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
define view entity ZI_PurchaseItems as select from zkhpoitems
association [0..1] to zi_PurchaseHeader as _PurchaseHeader on $projection.PoHeader = _PurchaseHeader.PoHeader
association [1] to I_Currency as _Currency on $projection.PriceUnit = _Currency.Currency
{
    key po_header as PoHeader,
    key po_item as PoItem,
    short_text as ShortText,
    material as Material,
    plant as Plant,
    mat_group as MatGroup,
    @Semantics.quantity.unitOfMeasure: 'OrderUnit'
    order_qunt as OrderQunt,
    order_unit as OrderUnit,
    @Semantics.amount.currencyCode: 'PriceUnit'
    product_price as ProductPrice,
    price_unit as PriceUnit,
    local_last_changed_by as LocalLastChangedBy,
    _PurchaseHeader,
    _Currency
}
