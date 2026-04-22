       IDENTIFICATION DIVISION.
       PROGRAM-ID. AVALIACREDITO.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 PERCENTUAL  PIC 9(3) VALUES ZEROS.
       LINKAGE SECTION.
       01 LNK-EMPRESTIMO.
           05 RENDA PIC 9(04)V99 VALUES ZEROS.
           05 VALOR PIC 9(04)V99 VALUES ZEROS.

       PROCEDURE DIVISION USING LNK-EMPRESTIMO.
           COMPUTE PERCENTUAL = (VALOR * 100)  / RENDA.
              DISPLAY "Percentual comprometido: " PERCENTUAL "%".
           EVALUATE TRUE
              WHEN PERCENTUAL <=  30
                 DISPLAY "Emprestimo aprovado"
              WHEN  PERCENTUAL  >= 31 AND PERCENTUAL <= 50
                 DISPLAY "Analise manual necessaria"
              WHEN  PERCENTUAL > 50
                 DISPLAY  "Emprestimo negado"
           END-EVALUATE.
              
           GOBACK.
