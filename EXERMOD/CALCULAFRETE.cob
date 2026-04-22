       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULAFRETE.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       77 VALORUF         PIC 9(02)V99  VALUES ZEROS.
       77 VALORBRUTO      PIC 9(04)V99  VALUES ZEROS.
       77 VALORDESCONTO   PIC 9(04)V99  VALUES ZEROS.
       77 VALORFINAL      PIC 9(04)V99  VALUES ZEROS.

       LINKAGE SECTION.
       01 LNK-ENTREGA.
         05 REGIAO PIC X(02) VALUES SPACES.
         05 PESO   PIC 9(04)V99 VALUES ZEROS.
       

       PROCEDURE DIVISION USING LNK-ENTREGA.
           EVALUATE REGIAO
              WHEN "N"
                 MOVE 14.00 TO VALORUF
               WHEN "S"
                 MOVE 16.00 TO VALORUF
               WHEN "L"
                 MOVE 12.00 TO VALORUF
               WHEN "O"
                 MOVE 18.00 TO VALORUF
               WHEN OTHER
                 DISPLAY "REGIAO INVALIDA"
           END-EVALUATE.

           COMPUTE VALORBRUTO = PESO * VALORUF.
              DISPLAY  "Valor bruto: R$" VALORBRUTO.
           IF PESO > 100
              COMPUTE VALORDESCONTO = (VALORBRUTO * 10) / 100
                 DISPLAY  "DESCONTO: R$" VALORDESCONTO
           ELSE 
              DISPLAY  "SEM DESCONTO"
           END-IF.
           COMPUTE VALORFINAL = VALORBRUTO - VALORDESCONTO.
              DISPLAY "Valor final: R$" VALORFINAL.
           STOP RUN.

           
