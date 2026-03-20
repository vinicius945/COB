       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOB02.
      *********************************
      *AREA DE COMENTARIOS - REMARKS***
      *AUTHOR = VINICIUS(ALTAFINI)*****
      *OBJETIVO: RECEBER E IMPRIMIR UMA STRING
      *DATA   = 03/03/2026 
      *********************************
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.  
       77 WRK-NOME PIC X(20) VALUE SPACES.   
       PROCEDURE  DIVISION.
           ACCEPT WRK-NOME FROM CONSOLE.
           DISPLAY WRK-NOME.
           STOP RUN.