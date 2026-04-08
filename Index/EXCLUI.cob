       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXCLUI.

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
       01 WRK-CONFIRMA   PIC X(01) VALUES SPACES.
      

       PROCEDURE DIVISION.
           PERFORM INICIAR.
           PERFORM PROCESSAR.
           PERFORM FINALIZAR.
           
           GOBACK.


       INICIAR SECTION.
           OPEN I-O ARQCRM.
      *     DISPLAY "STATUS ABERTURA " ARQCRM-FS.
           IF ARQCRM-FS NOT EQUAL ZEROS
             DISPLAY "ERRO ABERTURA "            LINE 01 COLUMN 01
                 ACCEPT WRK-SEGURATELA           LINE 20 COLUMN 01
             GOBACK
           END-IF.   
              
       PROCESSAR SECTION.
           DISPLAY "EXCLUSAO  "                  LINE 01 COLUMN 01.
           DISPLAY "----------"                  LINE 02 COLUMN 01.

           DISPLAY "ID DO CLIENTE "              LINE 03 COLUMN 01.
              ACCEPT ARQCRM-ID                   LINE 03 COLUMN 25.

           READ ARQCRM.

           EVALUATE ARQCRM-FS
      *--------------------- ENTRADA DE DADOS PARA A ALTERACAO
              WHEN 00   
                 DISPLAY "NOME "                   LINE 04 COLUMN 01
                 DISPLAY ARQCRM-NOME               LINE 04 COLUMN 15

                 DISPLAY "EMAIL "                  LINE 05 COLUMN 01
                 DISPLAY ARQCRM-EMAIL              LINE 05 COLUMN 15
                

                 DISPLAY "TELEFONE "               LINE 06 COLUMN 01
                 DISPLAY ARQCRM-TELEFONE           LINE 06 COLUMN 15
                


                DISPLAY "DESEJA EXCLUIR (S/N)? "   LINE 13 COLUMN 01          
                   ACCEPT WRK-CONFIRMA             LINE 13 COLUMN 25 

                   IF WRK-CONFIRMA EQUAL "S"

                      DELETE ARQCRM
                      DISPLAY "REGISTRO EXCLUIDO"  LINE 15 COLUMN 01
                   END-IF
              WHEN 23
              DISPLAY "ID NAO ENCONTRADO"          LINE 15 COLUMN 01
          
              WHEN OTHER 
                 DISPLAY "ERRO  "                  LINE 15 COLUMN 01
                 DISPLAY ARQCRM-FS
           END-EVALUATE.
              DISPLAY "VOLTANDO..."                LINE 20 COLUMN 01
              ACCEPT WRK-SEGURATELA                LINE 21 COLUMN 01.
            


       FINALIZAR SECTION.
           CLOSE ARQCRM. 
