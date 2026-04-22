       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOGIN.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 LOGIN.
         05 USUARIO  PIC X(10) VALUES SPACES.
         05 SENHA    PIC X(06) VALUES SPACES.
          
       PROCEDURE DIVISION.
       DISPLAY  "Digite o seu usuario: ".
       ACCEPT USUARIO.
       DISPLAY "Digite a sua senha: ".
       ACCEPT SENHA.
       CALL "VALIDALOGIN" USING LOGIN.
       STOP RUN.
       