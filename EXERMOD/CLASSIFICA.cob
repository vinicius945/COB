       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLASSIFICA.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       LINKAGE SECTION.
       01  NOTA  PIC 9(03) VALUES ZEROS.

       PROCEDURE DIVISION USING NOTA.

        EVALUATE TRUE
              WHEN NOTA < 6.0
                 DISPLAY "REPROVADO"
              WHEN NOTA <= 7.0
                 DISPLAY  "Em reuperacao"
              WHEN NOTA <= 10
                 DISPLAY "APROVADO"
              WHEN OTHER
                 DISPLAY "NOTA INVALIDA"
        END-EVALUATE.
