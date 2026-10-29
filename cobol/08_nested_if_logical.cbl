      *****************************************************************
      * PROGRAM  : NEST08                                             *
      * LEVEL    : 2/10                                               *
      * TOPIC    : Nested IF, AND / OR / NOT, grade calculation       *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. NEST08.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-MARKS.
          05 WS-M1     PIC 9(3) VALUE 78.
          05 WS-M2     PIC 9(3) VALUE 85.
          05 WS-M3     PIC 9(3) VALUE 92.
       01 WS-TOTAL     PIC 9(3).
       01 WS-AVG       PIC 9(3)V99.
       01 WS-AVG-ED    PIC ZZ9.99.
       PROCEDURE DIVISION.
           COMPUTE WS-TOTAL = WS-M1 + WS-M2 + WS-M3
           COMPUTE WS-AVG   = WS-TOTAL / 3
           MOVE WS-AVG TO WS-AVG-ED
           DISPLAY "TOTAL   : " WS-TOTAL
           DISPLAY "AVERAGE : " WS-AVG-ED

           IF WS-M1 >= 35 AND WS-M2 >= 35 AND WS-M3 >= 35
              DISPLAY "RESULT  : PASS"
              IF WS-AVG >= 90
                 DISPLAY "GRADE   : A+ (DISTINCTION)"
              ELSE
                 IF WS-AVG >= 75
                    DISPLAY "GRADE   : A"
                 ELSE
                    IF WS-AVG >= 60
                       DISPLAY "GRADE   : B"
                    ELSE
                       DISPLAY "GRADE   : C"
                    END-IF
                 END-IF
              END-IF
           ELSE
              DISPLAY "RESULT  : FAIL"
           END-IF

           IF WS-M1 > 90 OR WS-M2 > 90 OR WS-M3 > 90
              DISPLAY "AT LEAST ONE SUBJECT ABOVE 90"
           END-IF

           IF NOT WS-M3 < 50
              DISPLAY "SUBJECT 3 IS NOT BELOW 50"
           END-IF
           STOP RUN.
