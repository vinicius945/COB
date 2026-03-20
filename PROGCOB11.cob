       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOB11.
      *********************************
      *AREA DE COMENTARIOS - REMARKS***
      *AUTHOR = VINICIUS(ALTAFINI)*****
      *OBJETIVO: RECEBER LARGURA E COMPRIMENTO
      *CALCULAR AREA
      *DATA   = 10/03/2026 
      *********************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.  
       77 WRK-LARGURA           PIC 9(03)V99 VALUES ZEROS.
       77 WRK-COMPRIMENTO       PIC 9(03)V99 VALUES ZEROS.
       77 WRK-AREA              PIC 9(03)V99 VALUES ZEROS.
       PROCEDURE  DIVISION.
           DISPLAY 'LARGURA.. '
           ACCEPT WRK-LARGURA.

           DISPLAY 'COMPRIMENTO..  '
           ACCEPT WRK-COMPRIMENTO.
             
           IF WRK-LARGURA > 0 AND WRK-COMPRIMENTO > 0
              COMPUTE WRK-AREA = (WRK-LARGURA * WRK-COMPRIMENTO)
              DISPLAY '======================================='
              DISPLAY  'AREA......' WRK-AREA
           ELSE
              DISPLAY 'FALTA INFORMAR ALGO'
           END-IF.
           
           STOP RUN.