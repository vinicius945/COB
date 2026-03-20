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
       77 WRK-NUM1  PIC 9(02) VALUES ZEROS.
       77 WRK-NUM2  PIC 9(02) VALUES ZEROS.
       77 WRK-RESUL  PIC 9(04) VALUES ZEROS.
       77 WRK-RESTO  PIC 9(04) VALUES ZEROS.
       77 WRK-RESUL-ED PIC ZZZ.ZZZ,99.
       PROCEDURE  DIVISION.
           ACCEPT WRK-NUM1 FROM CONSOLE.
           ACCEPT WRK-NUM2 FROM CONSOLE.
           DISPLAY '==================================.'
           DISPLAY  'NUMERO1.. ' WRK-NUM1.
           DISPLAY  'NUMERO2.. ' WRK-NUM2.
      *******************SOMA,*******************
           ADD WRK-NUM1 WRK-NUM2 GIVING WRK-RESUL.
           MOVE WRK-RESUL TO WRK-RESUL-ED.
           DISPLAY 'SOMA .... ' WRK-RESUL-ED.
      *******************SUBTRAÇÃO****************
           SUBTRACT WRK-NUM1 FROM WRK-NUM2 GIVING WRK-RESUL.
           MOVE WRK-RESUL TO WRK-RESUL-ED.
           DISPLAY 'SUBTRAÇÃO .... ' WRK-RESUL-ED.
      *****************DIVISAO*******************
           DIVIDE WRK-NUM1 BY WRK-NUM2 GIVING WRK-RESUL
              REMAINDER WRK-RESTO.
           MOVE WRK-RESUL TO WRK-RESUL-ED.
           DISPLAY 'DIVISAO .... ' WRK-RESUL-ED.
           DISPLAY 'RESTO .... ' WRK-RESTO.
      *****************MULTIPLICACAO**************
           MULTIPLY WRK-NUM1 BY WRK-NUM2 GIVING WRK-RESUL.
           MOVE WRK-RESUL TO WRK-RESUL-ED.
           DISPLAY 'MULTIPLICACAO .... ' WRK-RESUL-ED.
      *****************COMPUTE*********************
           COMPUTE  WRK-RESUL = (WRK-NUM1 + WRK-NUM2) / 2.
           MOVE  WRK-RESUL TO WRK-RESUL-ED.
           DISPLAY  'MEDIA...  ' WRK-RESUL-ED.
           STOP RUN.