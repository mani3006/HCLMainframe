      *****************************************************************
      * PROGRAM  : ACPT06                                             *
      * LEVEL    : 1/10                                               *
      * TOPIC    : ACCEPT user input, system DATE and TIME            *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ACPT06.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NAME      PIC X(20).
       01 WS-CITY      PIC X(15).
       01 WS-TODAY.
          05 WS-YYYY   PIC 9(4).
          05 WS-MM     PIC 9(2).
          05 WS-DD     PIC 9(2).
       01 WS-NOW.
          05 WS-HH     PIC 9(2).
          05 WS-MIN    PIC 9(2).
          05 WS-SS     PIC 9(2).
          05 WS-HS     PIC 9(2).
       PROCEDURE DIVISION.
           DISPLAY "ENTER YOUR NAME : " WITH NO ADVANCING
           ACCEPT WS-NAME
           DISPLAY "ENTER YOUR CITY : " WITH NO ADVANCING
           ACCEPT WS-CITY

           ACCEPT WS-TODAY FROM DATE YYYYMMDD
           ACCEPT WS-NOW FROM TIME

           DISPLAY " "
           DISPLAY "HELLO " WS-NAME " FROM " WS-CITY
           DISPLAY "TODAY IS " WS-DD "/" WS-MM "/" WS-YYYY
           DISPLAY "TIME IS  " WS-HH ":" WS-MIN ":" WS-SS
           STOP RUN.
