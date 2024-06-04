*&---------------------------------------------------------------------*
*& Report ZVSM_MODU_FUNC_POPU
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zvsm_modu_func_popu.

DATA: v_answer(1) TYPE c.

*&---------------------------------------------------------------------*
START-OF-SELECTION.
*&---------------------------------------------------------------------*

  CALL FUNCTION 'POPUP_TO_CONFIRM'
    EXPORTING
      titlebar              = 'ESTADO DE CUENTA'
*     DIAGNOSE_OBJECT       = ' '
      text_question         = 'Deseas borrar el numero de cuenta'
      text_button_1         = 'Si'(001)
*     ICON_BUTTON_1         = ' '
      text_button_2         = 'No'(002)
*     ICON_BUTTON_2         = ' '
*     DEFAULT_BUTTON        = '1'
      display_cancel_button = 'X'
*     USERDEFINED_F1_HELP   = ' '
*     START_COLUMN          = 25
*     START_ROW             = 6
*     POPUP_TYPE            =
*     IV_QUICKINFO_BUTTON_1 = ' '
*     IV_QUICKINFO_BUTTON_2 = ' '
    IMPORTING
      answer                = v_answer
* TABLES
*     PARAMETER             =
    EXCEPTIONS
      text_not_found        = 1
      OTHERS                = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
    MESSAGE ID sy-msgid TYPE sy-msgty
    NUMBER sy-msgno
    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.
