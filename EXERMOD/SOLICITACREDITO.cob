       IDENTIFICATION DIVISION.
       PROGRAM-ID. SOLICITACREDITO.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 EMPRESTIMO.
           05 RENDA PIC 9(04)V99 VALUES ZEROS.
           05 VALOR PIC 9(04)V99 VALUES ZEROS.

          
       PROCEDURE DIVISION.
           DISPLAY "Digite a sua renda: ".
           ACCEPT RENDA.
           DISPLAY "Digite o valor de emprestimo desejado: "
           ACCEPT VALOR.
           CALL "AVALIACREDITO" USING EMPRESTIMO.
           STOP RUN.
