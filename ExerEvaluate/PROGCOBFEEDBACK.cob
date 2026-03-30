       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PROGCOBFEEDBACK.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NOTA PIC 9(02)V99.

       PROCEDURE DIVISION.

           DISPLAY "Digite a sua nota de satisfação(0 a 10): "
           ACCEPT NOTA.

           EVALUATE NOTA
              WHEN 0 THRU 3.99
                 DISPLAY "INSATISFEITO"
              WHEN 4 THRU 6.99
                 DISPLAY  "NEUTRO"
              WHEN 7 THRU 8.99
                 DISPLAY "SATISFEITO"
              WHEN 9 THRU 10.00
                 DISPLAY "MUITO SATISFEITO"
              WHEN OTHER
                 DISPLAY "NOTA INVALIDA"
           END-EVALUATE.

           DISPLAY "----------------------"
           DISPLAY "FIM DO PROGRAMA".
           DISPLAY "----------------------"

           STOP RUN.