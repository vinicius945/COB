       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOBEV4.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 WS-TEMPO-TRABALHO   PIC 99.
       01 WS-CARGO            PIC X(20).
       01 WS-SALARIO          PIC 9(5).
       01 WS-SALARIO-AJUSTADO PIC 9(5).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           
           DISPLAY "Cargo: ".
           ACCEPT WS-CARGO.

           DISPLAY "Salario  atual: ".
           ACCEPT  WS-SALARIO.

           DISPLAY "Tempo de trabalho: ".
           ACCEPT WS-TEMPO-TRABALHO.

           EVALUATE  WS-CARGO  ALSO WS-TEMPO-TRABALHO

                 WHEN "DIRETOR" ALSO >= 5
                    COMPUTE WS-SALARIO-AJUSTADO = WS-SALARIO * 1.15
                 WHEN "GERENTE" ALSO >=  3
                    COMPUTE WS-SALARIO-AJUSTADO = WS-SALARIO * 1.10
                 WHEN ANY ALSO >= 2
                    COMPUTE WS-SALARIO-AJUSTADO = WS-SALARIO * 1.05
           END-EVALUATE.

           DISPLAY " ".
           DISPLAY "---------------".
           DISPLAY "Cargo:      : " WS-CARGO.
           DISPLAY "Tempo de trabalho: " WS-TEMPO-TRABALHO.
           DISPLAY "Salario Original: " WS-SALARIO.
              IF WS-SALARIO > 0
                 DISPLAY "Salario Ajustado: " WS-SALARIO-AJUSTADO
              ELSE
                 DISPLAY "SEM BONUS !! Sorry"
              END-IF.
           STOP RUN.
