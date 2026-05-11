       IDENTIFICATION                            DIVISION.              
       PROGRAM-ID. RELATORIO.                                           
       ENVIRONMENT                               DIVISION.              
       CONFIGURATION                             SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *
       INPUT-OUTPUT                              SECTION.
       FILE-CONTROL.
               SELECT CLIENTES ASSIGN TO "..\DADOS\CLIENTES.TXT"
                     FILE STATUS IS FS-CLIENTES
                     ORGANIZATION IS LINE SEQUENTIAL
                     ACCESS MODE  IS SEQUENTIAL.
               SELECT RELSAIDA ASSIGN TO "..\DADOS\RELSAIDA.TXT"
                     FILE STATUS IS FS-RELSAIDA.
      *                                                                 
       DATA                                      DIVISION.              
       FILE SECTION.
       FD CLIENTES.
       01 REG-CLIENTES.
            05 REG-AGENC            PIC 9(04).
            05 REG-CONTA            PIC 9(05).
            05 REG-NOME             PIC X(30).
            05 REG-SALDO            PIC 9(06)V99.

       FD RELSAIDA.   
       01 REG-RELSAIDA              PIC X(80).

       WORKING-STORAGE                           SECTION.  
      *------------------------ LAYOUT DO RELATORIO ------
       01 WRK-DADOS.
           05  WRK-AGENCIA          PIC 9(04).
           05  FILLER               PIC X(03) VALUES SPACES.
           05  WRK-CONTA            PIC 9(05).
           05  FILLER               PIC X(03) VALUES SPACES.   
           05  WRK-NOME             PIC X(30).
           05  FILLER               PIC X(03) VALUES SPACES. 
           05  WRK-SALDO            PIC 9(06)V99.     


       01 WRK-TITULO.
           05 FILLER                PIC X(60) VALUE
           "---- RELATORIO DE CLIIENTES --- PAG:  ".
           05 WRK-PAGINA            PIC 9(03).

       01 WRK-CAMPOS.
           05 FILLER                PIC X(60) VALUE
           "AGEN    CONTA   NOME                    SALDO".
       
       01 WRK-SALDO-PAG.
           05 FILLER                PIC X(40) VALUE
           "- SALDO DA PAGINA ".
           05 WRK-SALDO-PAGINA-ED   PIC  ZZ.ZZZ.ZZ9,99.

        01 WRK-SALDO-RELAT.
           05 FILLER                PIC X(40) VALUE
           "- SALDO DO RELATORIO ".
           05 WRK-SALDO-RELATORIO-ED   PIC  ZZ.ZZZ.ZZ9,99.    

       01 FS-CLIENTES              PIC 9(02) VALUE ZEROS.    
       01 FS-RELSAIDA              PIC 9(02) VALUE ZEROS.
       01 WRK-CONT-LIN             PIC 9(02) VALUE 0.
       01 WRK-CONT-LIDOS           PIC 9(06) VALUE 0.
      *---------------- VARIAVEIS ACUMULADORAS

       01  WRK-SALDO-PAGINA        PIC 9(08)V99 VALUE 0.
       01  WRK-SALDO-RELATORIO     PIC 9(08)V99 VALUE 0.

       PROCEDURE                                 DIVISION.              
       0001-PRINCIPAL                            SECTION.               
           PERFORM 0100-INICIALIZAR.
           PERFORM 0200-PROCESSAR UNTIL FS-CLIENTES  EQUAL 10.
           PERFORM 0300-FINALIZAR.
           GOBACK.
  
       0100-INICIALIZAR                           SECTION.
           OPEN INPUT CLIENTES
                OUTPUT RELSAIDA.
            IF FS-CLIENTES NOT EQUAL "00" OR  
               FS-RELSAIDA NOT EQUAL "00"
               DISPLAY "ERRO NA ABERTURA"
               GOBACK
            END-IF.

           READ CLIENTES 
            IF FS-CLIENTES EQUAL "10"
              DISPLAY "ARQUIVO VAZIO"
            END-IF.

       0200-PROCESSAR                             SECTION.
             ADD 1 TO WRK-CONT-LIDOS.
              
             IF WRK-CONT-LIN = 0 OR WRK-CONT-LIN >= 6
                PERFORM 0210-CABECALHO
             END-IF.
             
             MOVE REG-AGENC  TO WRK-AGENCIA.
             MOVE REG-CONTA  TO WRK-CONTA.
             MOVE REG-NOME   TO WRK-NOME.
             MOVE REG-SALDO  TO WRK-SALDO.

             ADD REG-SALDO TO WRK-SALDO-PAGINA.
      *-----------------GRAVACAO-------------------------

              WRITE REG-RELSAIDA FROM WRK-DADOS AFTER 1.
      *-----------------GRAVACAO------------------------- 

             ADD 1 TO WRK-CONT-LIN.
             IF WRK-CONT-LIN EQUAL 6 
               PERFORM 0220-SUBTOTAL
             END-IF.

             READ CLIENTES.

             IF FS-CLIENTES EQUAL 10
                 PERFORM  0220-SUBTOTAL
                 PERFORM  0230-SALDOFINAL
             END-IF.


       0210-CABECALHO                             SECTION.

           ADD 1  TO WRK-PAGINA.
           IF WRK-PAGINA EQUAL 1
              WRITE REG-RELSAIDA FROM WRK-TITULO AFTER 1
           ELSE
              WRITE REG-RELSAIDA FROM WRK-TITULO AFTER PAGE
           END-IF.
           WRITE REG-RELSAIDA FROM WRK-CAMPOS AFTER 1.  
           MOVE 1 TO WRK-CONT-LIN.
       
       0220-SUBTOTAL                              SECTION.
              ADD  WRK-SALDO-PAGINA TO WRK-SALDO-RELATORIO.
              MOVE WRK-SALDO-PAGINA TO WRK-SALDO-PAGINA-ED.

              WRITE REG-RELSAIDA FROM WRK-SALDO-PAG AFTER 1.
              MOVE 0 TO WRK-SALDO.

       0230-SALDOFINAL                            SECTION. 
           MOVE WRK-SALDO-RELATORIO TO WRK-SALDO-RELATORIO-ED.
           WRITE REG-RELSAIDA FROM WRK-SALDO-RELAT  AFTER 1.
              

       0300-FINALIZAR                             SECTION.
              DISPLAY " REG LIDOS" WRK-CONT-LIDOS.
           CLOSE CLIENTES RELSAIDA.
           IF FS-CLIENTES NOT EQUAL "00" OR 
               FS-RELSAIDA NOT EQUAL "00"     
               DISPLAY "ERRO AO FECHAR ARQUIVO"
           END-IF.

