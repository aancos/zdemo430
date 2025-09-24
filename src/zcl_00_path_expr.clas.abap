CLASS zcl_00_path_expr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_00_PATH_EXPR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
    FROM Z00_C_EmployeeQuery
    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,
           departmentdescription,
           \_department\_assistant-firstname AS assistantfname,
           assistantname,
           \_department\_head-lastname AS headname
    INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
