       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOBEV3.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 PRODUTO   PIC X(02) VALUES SPACES.
       01 ESTADO    PIC X(30) VALUES SPACES.

       PROCEDURE DIVISION.
       INICIO.
           
           DISPLAY "Digite o nome do produto: ".
           ACCEPT PRODUTO.
           DISPLAY "Digite o estado onde sera entregue: "
           ACCEPT  ESTADO.


           EVALUATE ESTADO
              WHEN "SP"
              WHEN "RJ"
              WHEN "MG"
                 DISPLAY "FRETE DISPONIVEL"
              WHEN "ES"
                 DISPLAY "RETIRAR NA LOJA"
              WHEN OTHER
                 DISPLAY "NAO ATENDEMOS"
           END-EVALUATE.

           STOP RUN.