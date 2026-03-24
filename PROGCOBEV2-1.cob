       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOBEV2-1.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 DIA-SEMANA PIC 9 VALUE 0.

       PROCEDURE DIVISION.
       INICIO.
           ACCEPT DIA-SEMANA FROM DAY-OF-WEEK.
           DISPLAY "Dia da Semana " DIA-SEMANA.

           EVALUATE DIA-SEMANA
                 WHEN DIA-SEMANA
                    WHEN 1 THRU 5
                       DISPLAY "DIA DE TRABALHO"
                    WHEN 6 THRU 7
                       DISPLAY "DIA DE FOLGA"
           END-EVALUATE.

           STOP RUN.            