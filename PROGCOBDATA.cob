      *****************************************************************
      * Program name:    MYPROG                               
      * Original author: MYNAME                                
      *
      * Maintenence Log                                              
      * Date      Author        Maintenance Requirement               
      * --------- ------------  --------------------------------------- 
      * 01/01/08 MYNAME  Created for COBOL class         
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  VARIVEIS.
       AUTHOR. VINICIUS. 
       INSTALLATION. COBOL DEVELOPMENT CENTER. 
       DATE-WRITTEN. 23/03/2026. 
       DATE-COMPILED. 23/03/2026. 
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01 WRK-DATA. 
           05 WRK-ANO     PIC 9(04).
           05 WRK-MES     PIC 9(02).
           05 WRK-DIA     PIC 9(02).

       01 WRK-DATA-EDITADA.
           05 WRK-DIA     PIC 9(02).
           05 FILLER      PIC X VALUE "/".
           05 WRK-MES     PIC 9(02).
           05 FILLER      PIC X VALUE "/".
           05 WRK-ANO     PIC 9(04).
       
       01 WRK-HORARIO-E.
           05 WRK-HORA    PIC 9(02).
           05 WRK-MINUTO  PIC 9(02).
           05 WRK-SEGUNDO PIC 9(02).

       01 WRK-HORARIO-S.
           05 WRK-HORA    PIC 9(02).
           05 WRK-MINUTO  PIC 9(02).
           05 WRK-SEGUNDO PIC 9(02).

       01 WRK-TECLA       PIC X.
       01 WRK-TEMPO       PIC S9(02).

       PROCEDURE DIVISION.
           ACCEPT WRK-DATA FROM DATE YYYYMMDD.
           MOVE CORRESPONDING WRK-DATA TO WRK-DATA-EDITADA.
           
           ACCEPT WRK-HORARIO-E FROM TIME.
           ACCEPT WRK-TECLA.
           ACCEPT WRK-HORARIO-S FROM TIME.
       DISPLAY "DATA ATUAL " WRK-DATA-EDITADA.

           COMPUTE WRK-TEMPO = 
           WRK-HORA OF WRK-HORARIO-S -  WRK-HORA OF WRK-HORARIO-E.
           DISPLAY "TEMPO EM HORAS " WRK-TEMPO.

           COMPUTE WRK-TEMPO = 
           WRK-MINUTO OF WRK-HORARIO-S -  WRK-MINUTO OF WRK-HORARIO-E.
           DISPLAY "TEMPO EM MINUTOS " WRK-TEMPO.

          

           COMPUTE WRK-TEMPO = 
           WRK-SEGUNDO OF WRK-HORARIO-S -  WRK-SEGUNDO OF WRK-HORARIO-E.
           DISPLAY "TEMPO EM SEGUNDOS " WRK-TEMPO.


       DISPLAY "HORA E " WRK-HORARIO-E.
       DISPLAY "HORA S " WRK-HORARIO-S.
       GOBACK.


           