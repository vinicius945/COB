       IDENTIFICATION DIVISION.  
       PROGRAM-ID. PROGCOBTRANS. 
       
       DATA DIVISION.  
       WORKING-STORAGE SECTION.  
       01 ORIGEM        PIC X(1).  
       01 VALOR         PIC 9(5).  
       01 CONDICAO        PIC X(30).  
       
       PROCEDURE DIVISION.  
           DISPLAY "Digite a origem da transação (I/E):".  
           ACCEPT ORIGEM.  
       
           DISPLAY "Digite o valor da transação:".  
           ACCEPT VALOR.  
       
           EVALUATE ORIGEM ALSO VALOR  
               WHEN "I" ALSO 0 THRU 1000  
                   MOVE "Segura" TO CONDICAO  
               WHEN "I" ALSO 1001 THRU 99999  
                   MOVE "Revisar valor elevado" TO CONDICAO  
               WHEN "E" ALSO 0 THRU 500  
                   MOVE "Segura com atenção" TO CONDICAO  
               WHEN "E" ALSO 501 THRU 99999  
                   MOVE "Alerta de segurança" TO CONDICAO  
               WHEN OTHER  
                   MOVE "Dados inválidos" TO CONDICAO  
           END-EVALUATE  
       
           DISPLAY "Status: " CONDICAO.  
       
           STOP RUN.  