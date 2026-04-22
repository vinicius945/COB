       IDENTIFICATION DIVISION.
       PROGRAM-ID. FELCACHAMADO.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       LINKAGE SECTION.
       01  IDADE  PIC 9(2).
       
       PROCEDURE DIVISION USING IDADE.  
           IF IDADE >= 18
              DISPLAY "Maior de idade"
           ELSE
              DISPLAY "Menor de idade"
           END-IF.
