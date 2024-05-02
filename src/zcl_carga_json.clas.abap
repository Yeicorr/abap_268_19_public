CLASS zcl_carga_json DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CARGA_JSON IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DELETE FROM zrent_brands.
    if sy-subrc eq 0.
    out->write( 'All data deleted' ).
    endif.
  ENDMETHOD.
ENDCLASS.
