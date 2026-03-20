       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOB16.
      *********************************
      *AREA DE COMENTARIOS - REMARKS***
      *AUTHOR = VINICIUS(ALTAFINI)*****
      *OBJETIVO: RECEBER E IMPRIMIR A DATA DO SISTEMA
      *UTILIZAR VARIAVEL TIPO TABELA - OCCURS
      *DATA   = 13/03/2026 
      *********************************
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.  
       01 WRK-MESES.
           03 WRK-MES PIC X(09) OCCURS 12 TIMES.
       01 DATASYS.
          02 WRK-ANOSYS PIC 9(04) VALUES ZEROS.
          02 WRK-MESSYS PIC 9(02) VALUES ZEROS.
          02 WRK-DIASYS PIC 9(02) VALUES ZEROS.    
       PROCEDURE  DIVISION.
           ACCEPT DATASYS FROM DATE YYYYMMDD.
              PERFORM 04000-MONTAMES.
           DISPLAY 'DATA ' WRK-DIASYS ' DE ' WRK-MES(WRK-MESSYS) 
                    ' DE ' WRK-ANOSYS.
           STOP RUN.
       
       04000-MONTAMES.
           MOVE 'JANEIRO   '   TO WRK-MES(01).
           MOVE 'FEVEREIRO '   TO WRK-MES(02).
           MOVE 'MARÇO     '   TO WRK-MES(03).
           MOVE 'ABRIL     '   TO WRK-MES(04).
           MOVE 'MAIO      '   TO WRK-MES(05).
           MOVE 'JUNHO     '   TO WRK-MES(06).
           MOVE 'JULHO     '   TO WRK-MES(07).
           MOVE 'AGOSTO    '   TO WRK-MES(08).
           MOVE 'SETEMBRO  '   TO WRK-MES(09).
           MOVE 'OUTUBRO   '   TO WRK-MES(10).
           MOVE 'NOVEMBRO  '   TO WRK-MES(11).
           MOVE 'DEZEMBRO  '   TO WRK-MES(12).

      
