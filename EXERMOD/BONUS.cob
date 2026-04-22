       IDENTIFICATION DIVISION.
       PROGRAM-ID. BONUS.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       LINKAGE SECTION.
       01  SALARIO  PIC 9(5)V99.
       
       PROCEDURE DIVISION USING SALARIO.   
           
           COMPUTE SALARIO = SALARIO * 1.10.
           DISPLAY "Salario com bonus:  R$" SALARIO.
           GOBACK.

