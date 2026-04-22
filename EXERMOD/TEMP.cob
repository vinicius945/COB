       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEMP.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  TEMP  PIC 9(04)V9.
          
       PROCEDURE DIVISION.
           DISPLAY "Digite a temperatura em FAHRENHEIT: ".
           ACCEPT TEMP.
           CALL "CONVERSOR" USING  TEMP.
           STOP RUN.
