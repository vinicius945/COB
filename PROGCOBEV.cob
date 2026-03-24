       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOBEV.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 NOTA1  PIC 99V99 VALUE 0.
       01 NOTA2  PIC 99V99 VALUE 0.
       01 MEDIA  PIC 99V99 VALUE 0.

       PROCEDURE DIVISION.
       INICIO. 
           DISPLAY "Digite a primeira nota: ".
           ACCEPT NOTA1.
           DISPLAY "Digite a segunda nota: ".
           ACCEPT NOTA2.


           COMPUTE MEDIA = (NOTA1 + NOTA2) / 2.

           DISPLAY "A media das notas  e: " MEDIA.

           EVALUATE TRUE
              WHEN  MEDIA = 10
                 DISPLAY "Parabéns você foi aprovado com louvor!"
              WHEN MEDIA >= 7 AND MEDIA < 10
                 DISPLAY  "Aprovado"
              WHEN MEDIA >= 2 AND MEDIA < 7
                 DISPLAY "Recuperacao"
              WHEN MEDIA < 2
                 DISPLAY " Reprovado com nota menor que 2"
           END-EVALUATE.

           STOP RUN.     

