       IDENTIFICATION DIVISION.                                   
       PROGRAM-ID. LECSV.                                         

       ENVIRONMENT DIVISION.                                      
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
           SELECT ARQCSV ASSIGN TO "..\DADOS\ARQCSV.DAT"
           ACCESS MODE IS SEQUENTIAL  
           ORGANIZATION IS LINE SEQUENTIAL 
           FILE STATUS IS FS-ARQCSV.

           SELECT SAIDA ASSIGN TO "..\DADOS\SAIDA.DAT"
           ACCESS MODE IS SEQUENTIAL  
           ORGANIZATION IS LINE SEQUENTIAL 
           FILE STATUS IS FS-SAIDA.
       


       DATA DIVISION.      
       FILE SECTION.
       FD  SAIDA.
       01  REG-SAIDA.
           05 REG-AGENCIA    PIC X(04).
           05 REG-CONTA      PIC X(05).
           05 REG-NOME       PIC X(30).
           05 REG-SALDO      PIC X(08).
           
       FD  ARQCSV.
       01  REG-CSV           PIC X(80).

       WORKING-STORAGE SECTION.  
                                   
       01  FS-SAIDA          PIC 9(002) VALUE ZEROS.
       01  FS-ARQCSV         PIC 9(002) VALUE ZEROS.

      *----------------------VARIAVEIS DE APOIO

       01 WRK-LINHASCSV      PIC X(80)  VALUE SPACES.
       01 WRK-LIDOS          PIC 9(02)  VALUE ZEROS.        


       PROCEDURE DIVISION.  
       0001-PRINCIPAL                            SECTION.               
           PERFORM 0100-INICIALIZAR.
           PERFORM 0200-PROCESSAR UNTIL FS-ARQCSV EQUAL 10.
           PERFORM 0300-FINALIZAR.
           GOBACK.

       0100-INICIALIZAR                           SECTION.    
       OPEN INPUT   ARQCSV.
       OPEN OUTPUT  SAIDA.
      *-------------------------LEITURA DO CABECALHO - DESPREZAR
       READ ARQCSV.

      *-------------------------LEITURA DO PRIMEIRO REGISTRO

       READ ARQCSV.


       0200-PROCESSAR                             SECTION.  

           PERFORM 0210-LER-CSV.
           WRITE REG-SAIDA.

           READ  ARQCSV.
              IF FS-ARQCSV EQUAL 0 
                 ADD 1 TO WRK-LIDOS
              END-IF.  
              
 

       0210-LER-CSV                                SECTION.

           UNSTRING REG-CSV DELIMITED BY ","
           INTO REG-AGENCIA, REG-CONTA, REG-NOME, REG-SALDO.
             


       0300-FINALIZAR                             SECTION. 
            DISPLAY "LIDOS..... " WRK-LIDOS.       
            CLOSE ARQCSV.
            CLOSE SAIDA.

