       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOB08.
      *********************************
      *AREA DE COMENTARIOS - REMARKS***
      *AUTHOR = VINICIUS(ALTAFINI)*****
      *OBJETIVO: RECEBER DUAS NOTAS, MEDIA E IMPRIMIR
      *UTILIZAR EVALUATE
      *DATA   = 09/03/2026 
      *********************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.  
       01 WRK-DATA.
           02 WRK-NOTA1 PIC 9(02) VALUES ZEROS.
           02 WRK-NOTA2 PIC 9(02) VALUES ZEROS.
           02 WRK-MEDIA PIC 9(02)V9 VALUES ZEROS.
       PROCEDURE  DIVISION.
           ACCEPT WRK-NOTA1.
           ACCEPT WRK-NOTA2.
              COMPUTE WRK-MEDIA = (WRK-NOTA1 +WRK-NOTA2) / 2.
              DISPLAY 'MEDIA: ' WRK-MEDIA.
                 EVALUATE WRK-MEDIA
                    WHEN 6 THRU 9,9
                       DISPLAY 'APROVADO'
                    WHEN 2 THRU 5,9
                       DISPLAY 'RECUPERACAO'
                    WHEN OTHER 
                        DISPLAY 'REPROVADO'
                  END-EVALUATE.
           STOP RUN.