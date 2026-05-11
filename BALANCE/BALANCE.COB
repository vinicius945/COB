       IDENTIFICATION DIVISION.
       PROGRAM-ID. BALANCE.

      *=================================================
      *---- AUTHOR: ALURA
      *---- DATA  : XX/XX/XXXX
      *---- OBJETIVO: BALANCEAR ARQUIVOS
      *=================================================

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT ARQ-FUNC ASSIGN TO '..\DADOS\FUNC.TXT'
               FILE STATUS IS FS-FUNC.
               
               SELECT ARQ-PROJETO ASSIGN TO '..\DADOS\PROJETO.TXT'
               FILE STATUS IS FS-PROJETO.
               
               SELECT ARQ-RELAT ASSIGN TO '..\DADOS\RELAT.TXT'
               FILE STATUS IS FS-RELAT
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD ARQ-FUNC.
       01 REG-FUNC.
           05  FD-CHAVE-FUNC            PIC 9(03).
           05  FD-NOME-FUNC             PIC X(20).
           05  FD-STACK                 PIC X(10).
      
       FD ARQ-PROJETO.
       01 REG-PROJETO.
           05  FD-CHAVE-PROJETO         PIC 9(03).
           05  FD-PROJ-PROJETO          PIC X(20).
           05  FD-QTHORAS-PROJETO       PIC 9(03).
       
       FD ARQ-RELAT.
       01 REG-RELAT.
           05  FD-RELAT            PIC X(46).
        
       WORKING-STORAGE SECTION.
       01 FS-FUNC             PIC 99   VALUE ZEROS.
       01 FS-PROJETO          PIC 99   VALUE ZEROS.
       01 FS-RELAT            PIC 99   VALUE ZEROS.

       01 WRK-FUNC-LIDOS      PIC 999  VALUE ZEROS.
       01 WRK-PROJ-LIDOS      PIC 999  VALUE ZEROS.

       PROCEDURE DIVISION.
      
       000-PRINCIPAL SECTION.
       001-PRINCIPAL.
           PERFORM 100-INICIAR.
           PERFORM 200-PROCESSAR UNTIL FS-FUNC EQUAL 10 AND 
                                       FS-PROJETO EQUAL 10.
           PERFORM 300-FINALIZAR.
               GOBACK.

       100-INICIAR SECTION.
           OPEN INPUT ARQ-FUNC.
           OPEN INPUT ARQ-PROJETO.
           OPEN OUTPUT ARQ-RELAT.

           READ ARQ-FUNC.
           READ ARQ-PROJETO.


       200-PROCESSAR SECTION.
              EVALUATE TRUE
                 WHEN FD-CHAVE-FUNC LESS FD-CHAVE-PROJETO
                    READ ARQ-FUNC
                    ADD 1 TO WRK-FUNC-LIDOS
                    IF FS-FUNC EQUAL 10 
                       MOVE HIGH-VALUES TO FD-CHAVE-FUNC
                    END-IF

                 WHEN FD-CHAVE-FUNC EQUAL FD-CHAVE-PROJETO
                    PERFORM 250-GRAVAR-RELAT 
                       READ ARQ-PROJETO
                       ADD 1 TO WRK-PROJ-LIDOS
                       IF FS-PROJETO EQUAL 10
                          MOVE HIGH-VALUES TO FD-CHAVE-PROJETO
                       END-IF

                 WHEN OTHER 
                    DISPLAY "LANCAMENTO ERRO " FD-CHAVE-PROJETO
                    READ ARQ-PROJETO
                    ADD 1 TO WRK-PROJ-LIDOS

                 END-EVALUATE.
              
       250-GRAVAR-RELAT SECTION.
           STRING FD-CHAVE-FUNC       DELIMITED BY SIZE
                  FD-NOME-FUNC        DELIMITED BY SIZE
                  FD-PROJ-PROJETO     DELIMITED BY SIZE
                  FD-QTHORAS-PROJETO  DELIMITED BY SIZE
                  INTO FD-RELAT
                  WRITE REG-RELAT.


       300-FINALIZAR SECTION.
              DISPLAY "---- ESTATISTICA  ----".
              DISPLAY "FUNCIONARIOS LIDOS "  WRK-FUNC-LIDOS.
              DISPLAY "PROJETOS     LIDOS "  WRK-PROJ-LIDOS.
              DISPLAY "--------------------".


           CLOSE ARQ-FUNC ARQ-PROJETO ARQ-RELAT.
           DISPLAY "FIM DE PROCESSAMENTO".
