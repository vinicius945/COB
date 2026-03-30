       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOBTV.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 HORARIO          PIC X(5).
       01 DIA-SEMANA       PIC X(12).
       01 GENERO           PIC X(12).
       
       PROCEDURE DIVISION.
           DISPLAY "Digite a faixa horária (MANHÃ, TARDE ou NOITE):".
           ACCEPT HORARIO.
           
           DISPLAY "É dia de semana? (SEMANA ou FIM_DE_SEMANA):".
           ACCEPT DIA-SEMANA.
           
           DISPLAY "Qual seu gênero preferido?" 
           DISPLAY "(NOTICIAS, ENTRETENIMENTO ou FILMES):".
           ACCEPT GENERO.
           
           EVALUATE HORARIO ALSO DIA-SEMANA ALSO GENERO
               WHEN "NOITE" ALSO "SEMANA" ALSO "NOTICIAS"
               WHEN "MANHA" ALSO "FIM_DE_SEMANA" ALSO "NOTICIAS"
                   DISPLAY "Recomendação: Jornal Nacional"
                   
               WHEN "TARDE" ALSO "FIM_DE_SEMANA" ALSO "ENTRETENIMENTO"
               WHEN "NOITE" ALSO "SEMANA" ALSO "ENTRETENIMENTO"
                   DISPLAY "Recomendação: Reality Show"
                   
               WHEN "TARDE" ALSO ANY ALSO "FILMES"
                   DISPLAY "Recomendação: Sessão da Tarde"
                   
               WHEN "NOITE" ALSO "SEMANA" ALSO "ENTRETENIMENTO"
                   DISPLAY "Recomendação: Novela"
                   
               WHEN "MANHA" ALSO "FIM_DE_SEMANA" ALSO "ENTRETENIMENTO"
                   DISPLAY "Recomendação: Desenho Animado"
                   
               WHEN OTHER
                   DISPLAY "Recomendação: Programação Variada"
           END-EVALUATE.
           
           STOP RUN.
    