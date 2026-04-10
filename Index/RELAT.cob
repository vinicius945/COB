       IDENTIFICATION DIVISION.
       PROGRAM-ID. RELAT.

       ENVIRONMENT        DIVISION.
       INPUT-OUTPUT       SECTION.
       FILE-CONTROL.
           SELECT ARQCRM  ASSIGN TO "DADOS/ARQCRM.DAT"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL 
           FILE STATUS IS ARQCRM-FS
           RECORD KEY IS ARQCRM-CHAVE.


       DATA DIVISION.
       FILE SECTION.
       FD ARQCRM.
       COPY "#CRM".

       WORKING-STORAGE    SECTION.
       COPY "#CRM-WRK2".

       
       01 ARQCRM-FS          PIC 9(02) VALUES ZEROS.


      *---------------------Variaveis de apoio

       01 WRK-SEGURATELA      PIC X(01) VALUES SPACES.
       01 WRK-LINHA           PIC 9(01) VALUE 1.
       01 WRK-TOTVALIDOS      PIC 9(03) VALUE 0.
       01 WRK-TOTLIDOS        PIC 9(03) VALUE 0.
       01  WRK-TIPOAI         PIC 9(01) VALUE 0.
       
       01 WRK-CABEC.
           05 FILLER                     PIC X(04) VALUE "ID".
           05 FILLER                     PIC X(01).
           05 FILLER                     PIC X(25) VALUE "NOME".
           05 FILLER                     PIC X(01).
           05 FILLER                     PIC X(30) VALUE "EMAIL".
           05 FILLER                     PIC X(01).
           05 FILLER                     PIC X(14) VALUE "TELEFONE".
           05 FILLER                     PIC X(01).
           05 FILLER                     PIC X(14) VALUE "STATUS".
       


       PROCEDURE DIVISION.
           PERFORM INICIAR.
           PERFORM PROCESSAR UNTIL ARQCRM-FS EQUAL 10.
           PERFORM FINALIZAR.
           
           GOBACK.


       INICIAR SECTION.
           OPEN INPUT ARQCRM.
      *     DISPLAY "STATUS ABERTURA " ARQCRM-FS.
           IF ARQCRM-FS NOT EQUAL ZEROS
             DISPLAY "ERRO ABERTURA "            LINE 01 COLUMN 01
                 ACCEPT WRK-SEGURATELA           LINE 02 COLUMN 01
             GOBACK
           END-IF.   

           DISPLAY "(0) ATIVO ou (1)INATIVO ? "  LINE 01 COLUMN 01.
            ACCEPT WRK-TIPOAI                    LINE 02 COLUMN 01.
      *---------- Mover 1 para garantir a posicao        
           MOVE 1 TO WRK-LINHA

           READ ARQCRM.
           DISPLAY WRK-CABEC            LINE WRK-LINHA COLUMN 01.
           ADD 1 TO WRK-LINHA.
       PROCESSAR SECTION.
      *----------EXIBE QUANDO O REGISTRO ESTA ATIVO  (VALIDO) 
           IF ARQCRM-STATUS EQUAL WRK-TIPOAI
              MOVE    ARQCRM-ID       TO WRK-ARQCRM-ID
              MOVE    ARQCRM-NOME     TO WRK-ARQCRM-NOME
              MOVE    ARQCRM-EMAIL    TO WRK-ARQCRM-EMAIL
              MOVE    ARQCRM-TELEFONE TO WRK-ARQCRM-TELEFONE
              MOVE    ARQCRM-STATUS   TO WRK-ARQCRM-STATUS
              DISPLAY WRK-ARQCRM-REGISTRO    LINE WRK-LINHA COLUMN 01
              ADD 1 TO WRK-LINHA
              ADD 1 TO WRK-TOTVALIDOS
              END-IF.
              READ ARQCRM.
              ADD 1 TO WRK-TOTLIDOS. 
              

       FINALIZAR SECTION.
           DISPLAY "TOTAL VALIDOS     "       LINE 18 COLUMN 01.
           DISPLAY WRK-TOTVALIDOS             LINE 18 COLUMN 25.

           DISPLAY "TOTAL DE REGISTROS"       LINE 19 COLUMN 01.
           DISPLAY WRK-TOTLIDOS               LINE 19 COLUMN 25.

           DISPLAY "VOLTANDO...."            LINE 21 COLUMN 01.
           ACCEPT WRK-SEGURATELA             LINE 22 COLUMN 01.
           CLOSE ARQCRM. 
