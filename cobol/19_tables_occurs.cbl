      *****************************************************************
      * PROGRAM  : TABL19                                             *
      * LEVEL    : 4/10                                               *
      * TOPIC    : One-dimensional tables (OCCURS), subscripts        *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TABL19.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-SALES-DATA.
          05 FILLER PIC 9(5) VALUE 12500.
          05 FILLER PIC 9(5) VALUE 13200.
          05 FILLER PIC 9(5) VALUE 11800.
          05 FILLER PIC 9(5) VALUE 14750.
          05 FILLER PIC 9(5) VALUE 15100.
          05 FILLER PIC 9(5) VALUE 16300.
          05 FILLER PIC 9(5) VALUE 14900.
          05 FILLER PIC 9(5) VALUE 13800.
          05 FILLER PIC 9(5) VALUE 12950.
          05 FILLER PIC 9(5) VALUE 17200.
          05 FILLER PIC 9(5) VALUE 18400.
          05 FILLER PIC 9(5) VALUE 19950.
       01 WS-SALES-TABLE REDEFINES WS-SALES-DATA.
          05 WS-SALES      PIC 9(5) OCCURS 12 TIMES.
       01 WS-I             PIC 99.
       01 WS-TOTAL         PIC 9(7) VALUE 0.
       01 WS-AVG           PIC 9(5)V99.
       01 WS-MAX           PIC 9(5) VALUE 0.
       01 WS-MIN           PIC 9(5) VALUE 99999.
       01 WS-MAX-MONTH     PIC 99.
       01 WS-MIN-MONTH     PIC 99.
       01 WS-ABOVE-AVG     PIC 99 VALUE 0.
       01 WS-MONTH-ED      PIC Z9.
       01 WS-AMT-ED        PIC ZZ,ZZ9.
       01 WS-AVG-ED        PIC ZZ,ZZ9.99.
       PROCEDURE DIVISION.
           DISPLAY "MONTH   SALES"
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 12
              MOVE WS-I TO WS-MONTH-ED
              MOVE WS-SALES(WS-I) TO WS-AMT-ED
              DISPLAY "  " WS-MONTH-ED "    " WS-AMT-ED
              ADD WS-SALES(WS-I) TO WS-TOTAL
              IF WS-SALES(WS-I) > WS-MAX
                 MOVE WS-SALES(WS-I) TO WS-MAX
                 MOVE WS-I TO WS-MAX-MONTH
              END-IF
              IF WS-SALES(WS-I) < WS-MIN
                 MOVE WS-SALES(WS-I) TO WS-MIN
                 MOVE WS-I TO WS-MIN-MONTH
              END-IF
           END-PERFORM

           COMPUTE WS-AVG = WS-TOTAL / 12
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 12
              IF WS-SALES(WS-I) > WS-AVG
                 ADD 1 TO WS-ABOVE-AVG
              END-IF
           END-PERFORM

           DISPLAY " "
           DISPLAY "TOTAL SALES      : " WS-TOTAL
           MOVE WS-AVG TO WS-AVG-ED
           DISPLAY "AVERAGE          : " WS-AVG-ED
           DISPLAY "BEST MONTH       : " WS-MAX-MONTH " (" WS-MAX ")"
           DISPLAY "WORST MONTH      : " WS-MIN-MONTH " (" WS-MIN ")"
           DISPLAY "MONTHS ABOVE AVG : " WS-ABOVE-AVG
           STOP RUN.
