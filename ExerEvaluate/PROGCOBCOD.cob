       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PROGCOBCOD.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 CODIGO PIC 9(04) VALUES ZEROS.

       PROCEDURE DIVISION.

       DISPLAY "DIGITE O CODIGO DE 3 DIGITOS"
       ACCEPT CODIGO

       EVALUATE  CODIGO
           WHEN 100 THRU 199
              DISPLAY "Alimentacao"
           WHEN 200 THRU 399
              DISPLAY "Higiene"
           WHEN 400 THRU 599
              DISPLAY "Limpeza"
           WHEN 600 THRU 799
              DISPLAY "Bebidas"
           WHEN 800 THRU 999
              DISPLAY "Eletronicos"
           WHEN OTHER
              DISPLAY "Codigo invalido"
       END-EVALUATE.

       DISPLAY "----------------------"
       DISPLAY "FIM DO PROGRAMA".
       DISPLAY "----------------------"

       STOP RUN.       
            