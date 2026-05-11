       IDENTIFICATION DIVISION.                                   
       PROGRAM-ID. CRIACSV.

       ENVIRONMENT DIVISION.                                      
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO "..\DADOS\CLIENTES.TXT"
           ACCESS MODE IS SEQUENTIAL  
           ORGANIZATION IS LINE SEQUENTIAL 
           FILE STATUS IS FS-CLIENTES.
       
           SELECT ARQCSV ASSIGN TO "..\DADOS\ARQCSV.DAT"
           ACCESS MODE IS SEQUENTIAL  
           ORGANIZATION IS LINE SEQUENTIAL 
           FILE STATUS IS FS-ARQCSV.

       DATA DIVISION.      
       FILE SECTION.
       FD  CLIENTES.
       01  REG-CLIENTES.
           05 REG-AGENCIA    PIC X(04).
           05 REG-CONTA      PIC X(05).
           05 REG-NOME       PIC X(30).
           05 REG-SALDO      PIC X(08).
           
       FD  ARQCSV.
       01  REG-CSV     PIC X(80).

       WORKING-STORAGE SECTION.                                   
       01  FS-CLIENTES     PIC 9(002) VALUE ZEROS.
       01  FS-ARQCSV       PIC 9(002) VALUE ZEROS.

      *---------------------VARIAVEIS DE  APOIO

       01 WRK-LINHACSV      PIC X(80) VALUE SPACES.
       01 WRK-LIDOS         PIC 9(02) VALUES ZEROS. 
       

       PROCEDURE DIVISION.  
       0001-PRINCIPAL                            SECTION.               
           PERFORM 0100-INICIALIZAR.
           PERFORM 0200-PROCESSAR UNTIL FS-CLIENTES EQUAL 10.
           PERFORM 0300-FINALIZAR.
           GOBACK.

       0100-INICIALIZAR                           SECTION.    
       OPEN INPUT CLIENTES.
       OPEN OUTPUT ARQCSV.

       READ CLIENTES.
           
           MOVE REG-CLIENTES  TO WRK-LINHACSV.
           WRITE REG-CSV FROM  WRK-LINHACSV.

       READ CLIENTES.
           ADD 1 TO WRK-LIDOS.    

       0200-PROCESSAR                             SECTION.
           
           PERFORM 0210-POPULAR-CSV.
              WRITE REG-CSV FROM WRK-LINHACSV.           
           
           
           READ CLIENTES.    
           IF FS-CLIENTES  EQUAL 0   
              ADD 1 TO WRK-LIDOS
           END-IF.

       0210-POPULAR-CSV                           SECTION.       
                 MOVE SPACES TO WRK-LINHACSV.
         
                 STRING REG-AGENCIA                DELIMITED BY SIZE
                        ","                        DELIMITED BY SIZE
                        REG-CONTA                  DELIMITED BY SIZE
                        ","                        DELIMITED BY SIZE
                        FUNCTION TRIM(REG-NOME)    DELIMITED BY SIZE
                        ","                        DELIMITED BY SIZE
                        REG-SALDO                  DELIMITED BY SIZE
                        INTO WRK-LINHACSV.

       0300-FINALIZAR                             SECTION.
            DISPLAY "LIDOS.. " WRK-LIDOS.              
            CLOSE CLIENTES.
            CLOSE ARQCSV.

