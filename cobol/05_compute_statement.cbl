      *****************************************************************
      * PROGRAM  : COMP05                                             *
      * LEVEL    : 1/10                                               *
      * TOPIC    : COMPUTE, ROUNDED, exponent, ON SIZE ERROR          *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COMP05.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-PI        PIC 9V9(5)   VALUE 3.14159.
       01 WS-RADIUS    PIC 9(2)V99  VALUE 7.50.
       01 WS-AREA      PIC 9(5)V99.
       01 WS-AREA-ED   PIC ZZ,ZZ9.99.
       01 WS-CELSIUS   PIC S9(3)V99 VALUE 36.60.
       01 WS-FAHR      PIC S9(3)V99.
       01 WS-FAHR-ED   PIC -ZZ9.99.
       01 WS-PRICE     PIC 9(4)V99  VALUE 1499.99.
       01 WS-QTY       PIC 9(2)     VALUE 3.
       01 WS-GST-RATE  PIC 99       VALUE 18.
       01 WS-GST       PIC 9(5)V99.
       01 WS-BILL      PIC 9(6)V99.
       01 WS-BILL-ED   PIC ZZZ,ZZ9.99.
       01 WS-SMALL     PIC 9(3).
       PROCEDURE DIVISION.
           COMPUTE WS-AREA ROUNDED = WS-PI * WS-RADIUS ** 2
           MOVE WS-AREA TO WS-AREA-ED
           DISPLAY "CIRCLE AREA (R=7.50)      : " WS-AREA-ED

           COMPUTE WS-FAHR = (WS-CELSIUS * 9 / 5) + 32
           MOVE WS-FAHR TO WS-FAHR-ED
           DISPLAY "36.60 C IN FAHRENHEIT     : " WS-FAHR-ED

           COMPUTE WS-GST ROUNDED =
                   WS-PRICE * WS-QTY * WS-GST-RATE / 100
           COMPUTE WS-BILL = (WS-PRICE * WS-QTY) + WS-GST
           MOVE WS-BILL TO WS-BILL-ED
           DISPLAY "BILL WITH 18 PCT GST      : " WS-BILL-ED

           COMPUTE WS-SMALL = 500 * 3
               ON SIZE ERROR
                  DISPLAY "SIZE ERROR: 1500 DOES NOT FIT IN PIC 9(3)"
               NOT ON SIZE ERROR
                  DISPLAY "RESULT FITS: " WS-SMALL
           END-COMPUTE
           STOP RUN.
