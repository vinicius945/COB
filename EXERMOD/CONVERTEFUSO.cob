       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONVERTEFUSO.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 NOVAYORK    PIC S99  VALUES ZEROS.
       77 LONDRES     PIC 9(02) VALUES ZEROS.
       77 TOQUIO      PIC 9(02) VALUES ZEROS.
     
       LINKAGE SECTION.
       01 LNK-BRASILIA PIC 9(02) VALUES ZEROS.

       PROCEDURE DIVISION USING LNK-BRASILIA.
           COMPUTE NOVAYORK = LNK-BRASILIA - 2.
             IF NOVAYORK < 0
               ADD 24 TO NOVAYORK
             END-IF.
           COMPUTE LONDRES = LNK-BRASILIA + 3.
              IF LONDRES >= 24
                 SUBTRACT 24 FROM LONDRES
              END-IF.
           COMPUTE TOQUIO = LNK-BRASILIA + 12.
              IF TOQUIO >= 24
                 SUBTRACT 24 FROM TOQUIO
              END-IF.



           DISPLAY "Nova York: " NOVAYORK.
           DISPLAY "Londres: " LONDRES.
           DISPLAY "Tóquio: " TOQUIO.
           GOBACK.
