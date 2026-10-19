CLASS zkhcl_fill_tables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zkhcl_fill_tables IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DATA : lt_ot TYPE TABLE of zkhordertype.
 lt_ot = VALUE #(
  ( client = '100' po_type = 'SO'  is_active = 'X' description = 'Standard Order' )
  ( client = '100' po_type = 'NB'  is_active = '' description = 'Standard Purchase Order' )
  ( client = '100' po_type = 'FO'  is_active = 'X' description = 'Framework Order' )
  ( client = '100' po_type = 'MK'  is_active = '' description = 'Quantity Contract' )
  ( client = '100' po_type = 'CP'  is_active = 'X' description = 'Consignment PO' )
  ( client = '100' po_type = 'ST'  is_active = 'X' description = 'Stock Transport Order' )
  ( client = '100' po_type = 'SR'  is_active = '' description = 'Service Purchase Order' )
  ( client = '100' po_type = 'RQ'  is_active = 'X' description = 'Request for Quotation' )
  ( client = '100' po_type = 'IM'  is_active = '' description = 'Intra-company Transfer' )
  ( client = '100' po_type = 'ZPO' is_active = 'X' description = 'Custom Purchase Order' )
).

update zkhordertype from TABLE @lt_ot.

COMMIT WORK.
  ENDMETHOD.

ENDCLASS.
