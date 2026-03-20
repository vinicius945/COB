       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOB06.
      *********************************
      *AREA DE COMENTARIOS - REMARKS***
      *AUTHOR = VINICIUS(ALTAFINI)*****
      *OBJETIVO: USO DO SINAL ( - +)
      *DATA   = 05/03/2026 
      *********************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.  
       77 WRK-NUM1  PIC 9(02) VALUES ZEROS.
       77 WRK-NUM2  PIC 9(02) VALUES ZEROS.
       77 WRK-RESUL  PIC S9(04) VALUES ZEROS.
       77 WRK-RESUL-ED PIC -ZZ9 VALUES ZEROS.
       PROCEDURE  DIVISION.
           ACCEPT WRK-NUM1 FROM CONSOLE.
           ACCEPT WRK-NUM2 FROM CONSOLE.
           DISPLAY '==================================.'
           DISPLAY  'NUMERO1.. ' WRK-NUM1.
           DISPLAY  'NUMERO2.. ' WRK-NUM2.
      *******************SUBTRAÇÃO****************
           SUBTRACT WRK-NUM2 FROM WRK-NUM1 GIVING WRK-RESUL.
           MOVE WRK-RESUL TO WRK-RESUL-ED.
           DISPLAY 'SUBTRAÇÃO .... ' WRK-RESUL-ED.
           STOP RUN.