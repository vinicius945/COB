       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGLACOS.
      *********************************
      *AREA DE COMENTARIOS - REMARKS***
      *AUTHOR = VINICIUS(ALTAFINI)*****
      *OBJETIVO: TESTANDO LACOS 
      *DATA   = 16/03/2026 
      *********************************
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 WRK-QUANTOS   PIC 9(002) VALUES 3.


       01 FILLER.
           05 WRK-DADOS PIC X(020) OCCURS 1 TO 1000
               DEPENDING ON WRK-QUANTOS.


      ***************************APOIO**************************

       01 WRK-TEMP     PIC X(020).
       01 WRK-CONTA    PIC 9(001) VALUE 1.
       01 WRK-POSICAO  PIC 9(002) VALUE 0.     

       PROCEDURE  DIVISION.
       
           PERFORM VARYING WRK-CONTA FROM 1 BY 1
                       UNTIL WRK-CONTA > WRK-QUANTOS
               ACCEPT WRK-DADOS(WRK-CONTA)

           END-PERFORM.

           PERFORM VARYING WRK-CONTA FROM 1 BY 1
                   UNTIL WRK-CONTA > WRK-QUANTOS
              MOVE WRK-DADOS(WRK-CONTA) TO WRK-TEMP
              PERFORM VARYING WRK-POSICAO FROM 20 BY -1 
                      UNTIL WRK-POSICAO = 0
                IF WRK-TEMP(WRK-POSICAO:1) NOT EQUAL SPACES
                   DISPLAY "Nome...." WRK-TEMP(1:WRK-POSICAO) ";"
                   EXIT PERFORM
                END-IF
              END-PERFORM
           END-PERFORM.   



         GOBACK.