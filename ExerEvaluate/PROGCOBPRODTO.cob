       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PROGCOBIDADE.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       77 LETRA-PRODUTO PIC X(2).

       PROCEDURE DIVISION.

       DISPLAY "Digite a letra da categoria: "
       ACCEPT LETRA-PRODUTO.

       EVALUATE LETRA-PRODUTO
           WHEN "A" 
              DISPLAY "Alimento"
           WHEN "V" 
              DISPLAY "Vestuario"
           WHEN "E" 
              DISPLAY "Eletronico"
           WHEN "M" 
              DISPLAY "Movel"
           WHEN OTHER   
              DISPLAY "Categoria desconhecida"
       END-EVALUATE.

       STOP RUN.
