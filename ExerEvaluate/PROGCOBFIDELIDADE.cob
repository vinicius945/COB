       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROCOBFIDELIDADE.
 
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 IDADE         PIC 9(3).
       01 TEMPO         PIC 9(2).
       01 FIDELIZACAO   PIC X(30).
 
       PROCEDURE DIVISION.
           DISPLAY "Digite a idade do cliente:".
           ACCEPT IDADE.
 
           DISPLAY "Digite o tempo de cadastro (em anos):".
           ACCEPT TEMPO.
 
           EVALUATE IDADE ALSO TEMPO
               WHEN 0 THRU 25 ALSO 0 THRU 1
                   MOVE "Cliente novo" TO FIDELIZACAO
               WHEN 0 THRU 25 ALSO 2 THRU 99
                   MOVE "Cliente em crescimento" TO FIDELIZACAO
               WHEN 26 THRU 100 ALSO 0 THRU 1
                   MOVE "Cliente recente" TO FIDELIZACAO
               WHEN 26 THRU 100 ALSO 2 THRU 99
                   MOVE "Cliente fidelizado" TO FIDELIZACAO
               WHEN OTHER
                   MOVE "Informações inválidas" TO FIDELIZACAO
           END-EVALUATE.
 
           DISPLAY "Status: " FIDELIZACAO.
 
           STOP RUN.