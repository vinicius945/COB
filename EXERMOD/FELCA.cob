       IDENTIFICATION DIVISION.
       PROGRAM-ID. FELCA.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  IDADE  PIC 9(2).
          
       PROCEDURE DIVISION.
           DISPLAY "Digite a sua idade: ".
           ACCEPT IDADE.
           CALL "FELCACHAMADO" USING IDADE
           STOP RUN.
           