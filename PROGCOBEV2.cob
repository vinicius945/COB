       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOBEV2.
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


           EVALUATE MEDIA
              WHEN 10
                 DISPLAY "Parabéns você foi aprovado com louvor!"
              WHEN 7 THRU 9.99
                 DISPLAY  "Aprovado"
              WHEN 2 THRU 6.99
                 DISPLAY "Recuperacao"
              WHEN < 2
                 DISPLAY " Reprovado com nota menor que 2"
           END-EVALUATE.

           STOP RUN.   