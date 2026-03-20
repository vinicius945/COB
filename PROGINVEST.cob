       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOBINVEST.
      *********************************
      *AREA DE COMENTARIOS - REMARKS***
      *AUTHOR = VINICIUS(ALTAFINI)*****
      *OBJETIVO: EXERCICIO DO INVESTIMENTO
      *UTILIZAR PEERFORM - VARYING
      *DATA   = 12/03/2026 
      *********************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.  
           COPY 'BOOKV.cob'.
       PROCEDURE  DIVISION.
      ******************INICIO DO PROGRAMA DEFINICAO DOS PARAGRAFOS**** 
       0001-PRINCIPAL.
            PERFORM 0100-INICIALIZAR UNTIL WRK-DADO-OK = 'SIM'.
            PERFORM 0200-PROCESSAR.
            PERFORM 0300-FINALIZAR
            STOP RUN.
      ************ENTRADA**********************************************      
       0100-INICIALIZAR.
           DISPLAY 'DIGITE O VALOR INICIAL '.
           ACCEPT WRK-VALOR.
           DISPLAY 'DIGITE O TEMPO: '.
           ACCEPT WRK-MES.
           DISPLAY 'DIGITE A TAXA DE JUROS: '.
           ACCEPT WRK-JUROS.
           MOVE WRK-VALOR TO WRK-VALOR-DEC.
      ************************REGRA DE USO******************************     
           IF WRK-JUROS > 50,00 OR WRK-MES > 60
              DISPLAY '==================================='
              DISPLAY 'ERRO: VALORES EXORBITANTES'
              DISPLAY 'LIMITE: JUROS 50% OU 60 MESES'
              DISPLAY '==================================='
              DISPLAY 'TENTE NOVAMENTE'
              MOVE 'NAO' TO WRK-DADO-OK
           ELSE
              MOVE 'SIM' TO WRK-DADO-OK
           END-IF.
      *********************REGRAS DE NEGÓCIOS***************************
       0200-PROCESSAR.
         PERFORM WRK-MES  TIMES
           COMPUTE WRK-VALOR-DEC = 
               WRK-VALOR-DEC * (WRK-JUROS / 100 + 1)
         END-PERFORM
         MOVE WRK-VALOR-DEC TO WRK-VALOR.
      *************************SAIDA DE ARQUIVOS - FINALIZACAO**********           
       0300-FINALIZAR.
              DISPLAY  '-----------------'.
              MOVE WRK-VALOR TO WRK-TOTAL-ED
              DISPLAY 'VALOR: R' WRK-TOTAL-ED.
              DISPLAY 'TEMPO: ' WRK-MES.
              DISPLAY 'FINAL DE PROCESSAMENTO'.

