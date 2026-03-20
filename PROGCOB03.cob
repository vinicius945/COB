       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOB03.
      *********************************
      *AREA DE COMENTARIOS - REMARKS***
      *AUTHOR = VINICIUS(ALTAFINI)*****
      *OBJETIVO: VARIAVEIS NIVEL 01.02...
      *DATA   = 04/03/2026 
      *********************************
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.  
       01 WRK-DATA.
           02 WRK-ANO PIC 9(04) VALUES ZEROS.
           02 WRK-MES PIC 9(02) VALUES ZEROS.
           02 WRK-DIA PIC 9(02) VALUES ZEROS.
       PROCEDURE  DIVISION.
           ACCEPT WRK-DATA FROM DATE YYYYMMDD.
           DISPLAY 'DATA ' WRK-DIA ' DE ' WRK-MES ' DE ' WRK-ANO.
           STOP RUN.