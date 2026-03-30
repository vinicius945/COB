       IDENTIFICATION DIVISION.  
       PROGRAM-ID. PROGCOBIDADE.  
       
       DATA DIVISION.  
       WORKING-STORAGE SECTION.  
       01 IDADE        PIC 99.  
       
       PROCEDURE DIVISION.  
           DISPLAY "Digite sua idade: "  
           ACCEPT IDADE  
       
           EVALUATE TRUE  
               WHEN IDADE < 12  
                   DISPLAY "Categoria: Crianca"  
               WHEN IDADE >= 12 AND IDADE <= 17  
                   DISPLAY "Categoria: Adolescente"  
               WHEN IDADE >= 18 AND IDADE <= 59  
                   DISPLAY "Categoria: Adulto"  
               WHEN IDADE >= 60  
                   DISPLAY "Categoria: Idoso"  
           END-EVALUATE.  
       
           STOP RUN.  