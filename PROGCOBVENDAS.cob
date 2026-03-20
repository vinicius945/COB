       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOB02.
      *********************************
      *AREA DE COMENTARIOS - REMARKS***
      *AUTHOR = VINICIUS(ALTAFINI)*****
      *OBJETIVO: OPERADORES ARITMÉTICOS
      *DATA   = 03/03/2026 
      *********************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.  
       77 WRK-NUM1  PIC 9(06)V9 VALUES ZEROS.
       77 WRK-NUM2  PIC 9(06)V9 VALUES ZEROS.
       77 WRK-RESUL  PIC 9(07) VALUES ZEROS.
       77 WRK-RESUL-ED PIC $ZZZ.ZZ9,99.
       77 WRK-NUM1-ED PIC $ZZZ.ZZ9,99.
       77 WRK-NUM2-ED PIC $ZZZ.ZZ9,99.
       PROCEDURE  DIVISION.
           ACCEPT WRK-NUM1 FROM CONSOLE.
           ACCEPT WRK-NUM2 FROM CONSOLE.
           DISPLAY '==================================.'
           MOVE WRK-NUM1 TO WRK-NUM1-ED.
           MOVE WRK-NUM2 TO WRK-NUM2-ED.
           DISPLAY  'VENDA1: R' WRK-NUM1-ED.
           DISPLAY  'VENDA2: R' WRK-NUM2-ED.
      *******************SOMA,*******************
           ADD WRK-NUM1 WRK-NUM2 GIVING WRK-RESUL.
           MOVE WRK-RESUL TO WRK-RESUL-ED.
           DISPLAY 'SOMA DAS VENDAS: R' WRK-RESUL-ED.
      *****************COMPUTE*********************
           COMPUTE  WRK-RESUL = (WRK-NUM1 + WRK-NUM2) / 2.
           MOVE  WRK-RESUL TO WRK-RESUL-ED.
           DISPLAY  'MEDIA ARITIMÉTICA DAS VENDAS: R' WRK-RESUL-ED.
           STOP RUN.