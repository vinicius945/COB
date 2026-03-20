       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOB015.
      *********************************
      *AREA DE COMENTARIOS - REMARKS***
      *AUTHOR = VINICIUS(ALTAFINI)*****
      *OBJETIVO: RECEBER UM NUMERO E GERAR UMA TABUADA DE 1 A 10
      *UTILIZAR PEERFORM - VARYING
      *DATA   = 11/03/2026 
      *********************************
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.  
           COPY 'BOOK.cob'.
       PROCEDURE  DIVISION.
       0001-PRINCIPAL.
            PERFORM 0100-INICIALIZAR.
            IF WRK-VENDAS > 0
              PERFORM 0200-PROCESSAR UNTIL WRK-VENDAS = 0
            END-IF.
            PERFORM 0300-FINALIZAR
            STOP RUN.
       0100-INICIALIZAR.
           ACCEPT WRK-VENDAS.
       0200-PROCESSAR.
           ADD 1 TO WRK-QT.
           ADD WRK-VENDAS TO WRK-ACUM.
           ACCEPT WRK-VENDAS.

       0300-FINALIZAR.
              DISPLAY  '-----------------'.
              DISPLAY 'ACUMULADO :' WRK-ACUM.
              DISPLAY 'ACUMULADO: ' WRK-QT.
              DISPLAY 'FINAL DE PROCESSAMENTO'.