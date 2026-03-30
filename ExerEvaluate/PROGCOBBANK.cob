       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PROGCOBBANK.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CARACTERE PIC X.

       PROCEDURE DIVISION.

       DISPLAY "Digite um caracter: ".
       ACCEPT CARACTERE.
       
       EVALUATE CARACTERE
           WHEN 'A' THRU 'Z'
              DISPLAY "LETRA MAIUSCULA"
           WHEN '0' THRU  '9'
              DISPLAY "Numero"
           WHEN OTHER
              DISPLAY "OUTRO SIMBOLO"
       END-EVALUATE.

       STOP RUN.
