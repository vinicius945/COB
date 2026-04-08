       IDENTIFICATION DIVISION.
       PROGRAM-ID. STATUS.

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
       COPY  '#CRM-WRK'.
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
           DISPLAY "ATIVA/DESATIVA "             LINE 01 COLUMN 01.
           DISPLAY "----------"                  LINE 02 COLUMN 01.
           DISPLAY "ID DO CLIENTE "              LINE 03 COLUMN 01.
              ACCEPT WRK-ARQCRM-ID               LINE 03 COLUMN 25.
              MOVE   WRK-ARQCRM-ID TO ARQCRM-ID.

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

                 DISPLAY "STATUS "                 LINE 07 COLUMN 01
                 DISPLAY  ARQCRM-STATUS            LINE 07 COLUMN 15

                 DISPLAY "STATUS (0)ATIVA (1)INATIVA" LINE 12 COLUMN 01
                    ACCEPT  WRK-ARQCRM-STATUS         LINE 12 COLUMN 30
 


                DISPLAY "DESEJA ALTERAR (S/N)? "   LINE 13 COLUMN 01          
                   ACCEPT WRK-CONFIRMA             LINE 13 COLUMN 30 

                   IF WRK-CONFIRMA EQUAL "S"
                      MOVE WRK-ARQCRM-STATUS TO ARQCRM-STATUS                    
                      REWRITE ARQCRM-REGISTRO
                      DISPLAY "REGISTRO ALTERADO " LINE 15 COLUMN 01
                   END-IF
              WHEN 23
              DISPLAY "ID NAO ENCONTRADO"          LINE 15 COLUMN 01
          
              WHEN OTHER 
                 DISPLAY "ERRO "                   LINE 15 COLUMN 01
                 DISPLAY ARQCRM-FS
           END-EVALUATE.
              DISPLAY "VOLTANDO..."                LINE 20 COLUMN 01
              ACCEPT WRK-SEGURATELA                LINE 21 COLUMN 01.
            


       FINALIZAR SECTION.
           CLOSE ARQCRM. 
