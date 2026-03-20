       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOBFUNCIONARIO.
      *********************************
      *AREA DE COMENTARIOS - REMARKS***
      *AUTHOR = VINICIUS(ALTAFINI)*****
      *OBJETIVO: CALCULAR O AUMENTO DE SALARIO COM BASE NO ANO DE ENTRADA
      *DATA   = 10/03/2026 
      *********************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 WRK-NOME        PIC X(20) VALUES SPACES. 
       77 WRK-ANOENTRADA  PIC 9(04) VALUES ZEROS.   
       77 WRK-SALARIO     PIC 9(06)V99 VALUES ZEROS.
       77 WRK-AUMENTO     PIC 9(06)V99 VALUES ZEROS.
       77 WRK-TEMPODECASA PIC 9(02) VALUE ZEROS.
       01 WRK-DATASISTEMA.
           02 WRK-DATAANO PIC 9(04).
           02 WRK-DATAMES PIC 9(02).
           02 WRK-DATADIA PIC 9(02).
       PROCEDURE  DIVISION.
       0001-PRINCIPAL.
             PERFORM 0100-INICIALIZAR.
             PERFORM 0200-PROCESSAR.
              IF WRK-TEMPODECASA >= 2
                 PERFORM 0300-FINALIZAR
                ELSE
                    DISPLAY 'VOCE NAO POSSUI TEMPO DE CASA SUFICIENTE'
               END-IF.

             STOP RUN.

       0100-INICIALIZAR.
           DISPLAY 'DIGITE O SEU NOME: '.
           ACCEPT  WRK-NOME.
           DISPLAY 'DIGITE O ANO QUE VOCE INICIOU NA EMPRESA: '.
           ACCEPT  WRK-ANOENTRADA.
           DISPLAY 'DIGITE O SEU SALARIO INICIAL: '.
           ACCEPT  WRK-SALARIO.
           ACCEPT WRK-DATASISTEMA FROM DATE YYYYMMDD.      
              
       0200-PROCESSAR.
              COMPUTE WRK-TEMPODECASA = (WRK-DATAANO - WRK-ANOENTRADA).
              DISPLAY 'TEMPO DE CASA: ' WRK-TEMPODECASA.
                 EVALUATE WRK-TEMPODECASA
                    WHEN 2 THRU 5
                       COMPUTE WRK-AUMENTO = WRK-SALARIO * 1,05
                    WHEN 6 THRU 15
                       COMPUTE WRK-AUMENTO = WRK-SALARIO * 1,10
                    WHEN OTHER
                       COMPUTE WRK-AUMENTO = WRK-SALARIO * 1,15
                    END-EVALUATE.
       0300-FINALIZAR.        
              DISPLAY '====================='.
              DISPLAY 'SEU SALÁRIO COM O AUMENTO E DE: R$ ' WRK-AUMENTO.
              

              STOP RUN.