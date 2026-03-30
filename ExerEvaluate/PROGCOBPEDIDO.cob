       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PROGCOBPEDIDO.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       77 MASSA   PIC X(15).
       77 TAMANHO PIC X(2).

       PROCEDURE DIVISION.

       DISPLAY "Digite o tipo de massa".
       DISPLAY "(INTEGRAL, TRADICIONAL OU FININHA)".
       ACCEPT MASSA.
       DISPLAY "Digite o tamanho (P, M, G)".
       ACCEPT TAMANHO.

       EVALUATE  TRUE
           WHEN MASSA = "INTEGRAL" AND TAMANHO = "P"
              DISPLAY "Pedido: INTEGRAL-P"
           WHEN MASSA = "INTEGRAL" AND TAMANHO = "M"
              DISPLAY "Pedido: INTEGRAL-M"
           WHEN MASSA = "INTEGRAL" AND TAMANHO = "G"
              DISPLAY "Pedido: INTEGRAL-G"
           WHEN MASSA = "TRADICIONAL" AND TAMANHO = "P"
              DISPLAY "Pedido: TRADICIONAL-P"
           WHEN MASSA = "TRADICIONAL" AND TAMANHO = "M"
              DISPLAY "Pedido: TRADICIONAL-M"
           WHEN MASSA = "TRADICIONAL" AND TAMANHO = "G"
              DISPLAY "Pedido: TRADICIONAL-G"
            WHEN MASSA = "FININHA" AND TAMANHO = "P"
              DISPLAY "Pedido: FININHA-P"
           WHEN MASSA = "FININHA" AND TAMANHO = "M"
              DISPLAY "Pedido: TRADICIONAL-M"
           WHEN MASSA = "FININHA" AND TAMANHO = "G"
              DISPLAY "Pedido: FININHA-G"
           WHEN OTHER   
              DISPLAY "Massa e tamanho não disponivel"   
       
       END-EVALUATE.

       STOP RUN.
             


