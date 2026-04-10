       IDENTIFICATION DIVISION.
       PROGRAM-ID. CRM.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE      SECTION.
       01 WRK-OPCAO PIC 9(01) VALUES ZEROS.
       
       
       SCREEN SECTION.
       01 TELA.
           05 BLANK SCREEN.      

       PROCEDURE DIVISION.
       PRINCPAL  SECTION.
           PERFORM PROCESSAR UNTIL WRK-OPCAO EQUAL 8.   
           DISPLAY "FIM DO PROGRAMA"          LINE 22 COLUMN 01.
           STOP RUN. 
           
       PROCESSAR SECTION.
           DISPLAY TELA.
           
           DISPLAY "     ___  ____  __  __  " LINE 01 COLUMN 01.
           DISPLAY "    / __)(  _ \(  \/  ) " LINE 02 COLUMN 01.
           DISPLAY "   ( (__  )   / )    (  " LINE 03 COLUMN 01.
           DISPLAY "    \___)(_)\_)(_/\/\_) " LINE 04 COLUMN 01.





           DISPLAY "1-CADASTRO       " LINE 06 COLUMN 01.
           DISPLAY "2-CONSULTA       " LINE 07 COLUMN 01.
           DISPLAY "3-ALTERACAO      " LINE 08 COLUMN 01.
           DISPLAY "4-EXCLUSAO       " LINE 09 COLUMN 01.
           DISPLAY "5-INATIVAR/ATIVAR" LINE 10 COLUMN 01.
           DISPLAY "6-RELATORIOS     " LINE 11 COLUMN 01.
           DISPLAY "7-SETUP SISTEMA  " LINE 12 COLUMN 01.
           DISPLAY "8-ENCERRAR       " LINE 13 COLUMN 01.
           DISPLAY "QUAL OPCAO       " LINE 20 COLUMN 01.
               ACCEPT WRK-OPCAO        LINE 20 COLUMN 15.

           DISPLAY TELA
           
           EVALUATE WRK-OPCAO
              WHEN 1
                 CALL "CADASTRO"
               WHEN 2 
                 CALL "CONSULTA"
               WHEN 3
                 CALL "ALTERA"
               WHEN 4 
                 CALL "EXCLUI"
               WHEN 5
                 CALL "STATUS"
               WHEN 6 
                 CALL "RELAT"
               WHEN 7 
                 CALL "MANUT"
           END-EVALUATE. 

