       IDENTIFICATION DIVISION.

       PROGRAM-ID. DLLCONS.

       DATA DIVISION.
       LINKAGE   SECTION.
       01 LNK-DADOS.
           05 LNK-ID      PIC 9(003) VALUE 0.
           05 LNK-NOME    PIC X(020) VALUE SPACES.
           05 LNK-EMAIL   PIC X(030) VALUE SPACES.

       PROCEDURE DIVISION USING LNK-DADOS.
           EVALUATE LNK-ID
              WHEN 1
                 MOVE "MARIA EDUARDA "       TO LNK-NOME
                 MOVE "MARIA@GMAIL.COM"      TO LNK-EMAIL
               WHEN 2
                 MOVE "CARLOS AGUIAR"        TO LNK-NOME
                 MOVE "CARLOS@GMAIL.COM"     TO LNK-EMAIL
               WHEN OTHER 
                 MOVE "NOME NAO ENCONTRADO"  TO LNK-NOME
                 MOVE "EMAIL NAO ENCONTRADO" TO LNK-EMAIL
           END-EVALUATE.



       GOBACK.
