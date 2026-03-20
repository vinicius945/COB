       IDENTIFICATION DIVISION.
       PROGRAM-ID. CLIENTES.
       ENVIRONMENT        DIVISION.
       CONFIGURATION      SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT       SECTION.
       FILE-CONTROL..
           SELECT EARQCLI ASSIGN TO ".\EARQCLI.TXT"   
              FILE STATUS IS FS-EARQCLI.
           SELECT SARQCLI ASSIGN TO ".\SARQCLI.TXT"
              FILE STATUS IS FS-SARQCLI.
       DATA DIVISION.  
       FILE      SECTION.
       FD EARQCLI
           RECORDING MODE IS F.
           COPY "BOOKCLI".

      *    LAYOUT = 55 POSICOES    
       FD SARQCLI
           RECORDING MODE IS F. 
      *    LAYOUT = 22 POSICOES(AGENCIA, CONTA, TIPO E SALDO)
       01 REG-SARQCLI           PIC X(22).              
      
       WORKING-STORAGE    SECTION.
       01 FS-EARQCLI            PIC 9(02).
       01 FS-SARQCLI            PIC 9(02).
      *----------VARIÁVEIS ACUMULADORAS 
       01 WRK-CONTADOR          PIC 9(03) USAGE COMP.
       01 WRK-CONTADOR-VALIDO   PIC 9(03) USAGE COMP.
       01 WRK-CONTADOR-NVALIDO  PIC 9(03) USAGE COMP.
       PROCEDURE DIVISION.
           0100-PRINCIPAL SECTION.
               PERFORM 0200-INICIAR.
               PERFORM 0300-PROCESSAR UNTIL FS-EARQCLI EQUAL 10.
               PERFORM 0400-FINALIZAR.
               STOP RUN.
           0100-FIM. EXIT.



           
      *--------------------------------INICIAR     
           0200-INICIAR SECTION.
                 OPEN INPUT  EARQCLI.
                 OPEN OUTPUT SARQCLI.
                 IF FS-EARQCLI NOT  EQUAL ZEROS OR 
                    FS-SARQCLI NOT  EQUAL ZEROS
                    DISPLAY "ARQUIVO(S) NÃO ABERTO(S)"
                    GOBACK
                 END-IF.
                 PERFORM  0210-LEITURA.
           0200-FIM. EXIT.

           0210-LEITURA   SECTION.
              READ EARQCLI.
           0210-FIM. EXIT.
      *--------------------------------PROCESSAR 
           0300-PROCESSAR SECTION.
              
              ADD 1 TO WRK-CONTADOR.

              IF REG-SALDO GREATER THAN OR EQUAL 5000 AND
                 (REG-TIPO-CONTA EQUAL 1 OR REG-TIPO-CONTA EQUAL 2) 
                 
                 STRING REG-AGENCIA      DELIMITED BY SIZE
                        REG-CONTA        DELIMITED BY SIZE
                        REG-TIPO-CONTA   DELIMITED BY SIZE
                        REG-SALDO        DELIMITED BY SIZE
                   INTO REG-SARQCLI

                   WRITE REG-SARQCLI
                    IF FS-SARQCLI  NOT EQUAL ZEROS
                       DISPLAY "ERRO AO GRAVAR " REG-AGENCIA REG-CONTA
                    END-IF

                  ADD 1 TO WRK-CONTADOR-VALIDO
              ELSE
      *             EVALUATE TRUE                   
      *                 WHEN REG-SALDO LESS 5000                    
      *                    DISPLAY "SALDO INSUFICIENTE PARA O AUMENTO: R" 
      *                       REG-SALDO
      *                 WHEN REG-TIPO-CONTA NOT EQUAL 1 OR
      *                      REG-TIPO-CONTA NOT EQUAL 2
      *                    DISPLAY "TIPO DE CONTA NÃO EXISTE"
      *             END-EVALUATE
                   ADD 1 TO WRK-CONTADOR-NVALIDO
              END-IF. 

                 PERFORM 0210-LEITURA.       
                
              0300-FIM. EXIT.
      *--------------------------------FINALIZAR 
           0400-FINALIZAR SECTION.
               CLOSE EARQCLI
                     SARQCLI.
               DISPLAY "-----------------".
               DISPLAY "FIM DO PROGRAMA".
               DISPLAY  "CLIENTES LIDOS: " WRK-CONTADOR.
               DISPLAY  "VALIDOS: "        WRK-CONTADOR-VALIDO.
               DISPLAY  "NAO VALIDOS: "    WRK-CONTADOR-NVALIDO.

           0400-FIM. EXIT.

           


          