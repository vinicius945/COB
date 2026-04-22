       IDENTIFICATION DIVISION.
       PROGRAM-ID. VALIDALOGIN.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       LINKAGE SECTION.

       01 LNK-LOGIN.
         05 USUARIO  PIC X(10) VALUES SPACES.
         05 SENHA    PIC X(06) VALUES SPACES.

       PROCEDURE DIVISION USING LNK-LOGIN.
           EVALUATE TRUE
              WHEN USUARIO = "ADMIN" AND SENHA = "123456"
                 DISPLAY "Acesso autorizado"
              WHEN OTHER
                 DISPLAY "Acesso Restrito"
           END-EVALUATE.
           