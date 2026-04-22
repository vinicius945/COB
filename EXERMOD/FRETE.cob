       IDENTIFICATION DIVISION.
       PROGRAM-ID. FRETE.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ENTREGA.
         05 REGIAO PIC X(02) VALUES SPACES.
         05 PESO   PIC 9(04)V99 VALUES ZEROS.
          
       PROCEDURE DIVISION.
           DISPLAY "Digite a sua regiao: ".
           ACCEPT  REGIAO.
           DISPLAY "Digite o peso: "
           ACCEPT PESO
           CALL "CALCULAFRETE" USING ENTREGA.
           STOP RUN.
