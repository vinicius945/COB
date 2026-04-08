       IDENTIFICATION DIVISION.
       PROGRAM-ID. MANUT.

       ENVIRONMENT        DIVISION.
       INPUT-OUTPUT       SECTION.
       FILE-CONTROL.
           SELECT ARQCRM  ASSIGN TO "DADOS/ARQCRM.DAT"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM 
           FILE STATUS IS ARQCRM-FS
           RECORD KEY IS ARQCRM-CHAVE.


       DATA DIVISION.
       FILE SECTION.
       FD ARQCRM.
       COPY "#CRM".
       WORKING-STORAGE    SECTION.
       01 ARQCRM-FS          PIC 9(02) VALUES ZEROS.


      *---------------------Variaveis de apoio

       01 WRK-SEGURATELA PIC X(01) VALUES SPACES.
       
       

       SCREEN SECTION.
       01 TELA.
           05 BLANK SCREEN.      


       PROCEDURE DIVISION.
           PERFORM INICIAR.
           PERFORM FINALIZAR.
           
           GOBACK.


       INICIAR SECTION.  
           DISPLAY TELA.

           OPEN INPUT ARQCRM.
           DISPLAY "STATUS ABERTURA " ARQCRM-FS.
           EVALUATE  ARQCRM-FS
              WHEN 00
                DISPLAY "ARQUIVO JA EXISTE "         LINE 01 COLUMN 01
              WHEN 35
               OPEN OUTPUT ARQCRM
                 DISPLAY "ARQUIVO FOI CRIADO"        LINE 01 COLUMN 01
              WHEN OTHER
                 DISPLAY "ERRO   "                   LINE 01 COLUMN 01 
                 DISPLAY ARQCRM-FS                   LINE 02 COLUMN 01
                 ACCEPT WRK-SEGURATELA               LINE 20 COLUMN 01
                 DISPLAY "APERTE UMA TECLA"          LINE 21 COLUMN 01
                 GOBACK
           END-EVALUATE.
              
              DISPLAY "VOLTANDO. APERTE UMA TECLA"   LINE 21 COLUMN 01
              ACCEPT WRK-SEGURATELA                  LINE 20 COLUMN 01.

       FINALIZAR SECTION.
           CLOSE ARQCRM. 
