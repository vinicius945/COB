       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOB07.
      *********************************
      *AREA DE COMENTARIOS - REMARKS***
      *AUTHOR = VINICIUS(ALTAFINI)*****
      *OBJETIVO: RECEBER DUAS NOTAS, MEDIA E IMPRIMIR
      *UTILIZAR COMANDOS IF/ELSE/ENDIF
      *DATA   = 09/03/2026 
      *********************************
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.  
       01 WRK-DATA.
           02 WRK-NOTA1 PIC 9(02) VALUES ZEROS.
           02 WRK-NOTA2 PIC 9(02) VALUES ZEROS.
           02 WRK-MEDIA PIC 9(02) VALUES ZEROS.
       PROCEDURE  DIVISION.
           ACCEPT WRK-NOTA1.
           ACCEPT WRK-NOTA2.
              COMPUTE WRK-MEDIA = (WRK-NOTA1 +WRK-NOTA2) / 2.
              DISPLAY 'MEDIA: ' WRK-MEDIA.
                 IF WRK-MEDIA >= 6
                    DISPLAY 'APROVADO'
                  ELSE
                    IF WRK-MEDIA >= 2
                       DISPLAY 'RECUPERACAO'
                     ELSE
                        DISPLAY 'REPROVADO'
                     END-IF
                  END-IF. 
           STOP RUN.