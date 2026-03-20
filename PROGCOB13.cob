       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOB013.
      *********************************
      *AREA DE COMENTARIOS - REMARKS***
      *AUTHOR = VINICIUS(ALTAFINI)*****
      *OBJETIVO: RECEBER UM NUMERO E GERAR UMA TABUADA DE 1 A 10
      *UTILIZAR PERFORM
      *DATA   = 11/03/2026 
      *********************************
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.  
       77 WRK-NUMERO   PIC 9(02) VALUES ZEROS.
       77 WRK-CONTADOR PIC 9(02) VALUES 1.
       77 WRK-RESUL    PIC 9(02) VALUES ZEROS.
       PROCEDURE  DIVISION.
       0001-PRINCIPAL.
            PERFORM 0100-INICIALIZAR.
            IF WRK-NUMERO > 0
              PERFORM 0200-PROCESSAR
            END-IF.
            PERFORM 0300-FINALIZAR.
            STOP RUN.
       0100-INICIALIZAR.
           ACCEPT WRK-NUMERO.
       0200-PROCESSAR.
           PERFORM 10 TIMES
                 COMPUTE WRK-RESUL = WRK-NUMERO * WRK-CONTADOR
              DISPLAY WRK-NUMERO ' X ' WRK-CONTADOR ' = ' WRK-RESUL
              ADD 1 TO WRK-CONTADOR
           END-PERFORM.               
       0300-FINALIZAR.
              DISPLAY  '-----------------'.
              DISPLAY 'FINAL DE PROCESSAMENTO'.