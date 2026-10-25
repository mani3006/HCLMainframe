      *****************************************************************
      * PROGRAM  : ARITH04                                            *
      * LEVEL    : 1/10                                               *
      * TOPIC    : ADD, SUBTRACT, MULTIPLY, DIVIDE (GIVING/REMAINDER) *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARITH04.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1       PIC 9(3)  VALUE 125.
       01 WS-NUM2       PIC 9(3)  VALUE 25.
       01 WS-NUM3       PIC 9(3)  VALUE 10.
       01 WS-RESULT     PIC 9(6)  VALUE 0.
       01 WS-REMAINDER  PIC 9(3)  VALUE 0.
       01 WS-COUNTER    PIC 9(3)  VALUE 0.
       01 WS-OUT        PIC ZZZ,ZZ9.
       PROCEDURE DIVISION.
           ADD WS-NUM1 TO WS-NUM2 GIVING WS-RESULT
           MOVE WS-RESULT TO WS-OUT
           DISPLAY "125 + 25      = " WS-OUT

           ADD WS-NUM1 WS-NUM2 WS-NUM3 GIVING WS-RESULT
           MOVE WS-RESULT TO WS-OUT
           DISPLAY "125 + 25 + 10 = " WS-OUT

           SUBTRACT WS-NUM2 FROM WS-NUM1 GIVING WS-RESULT
           MOVE WS-RESULT TO WS-OUT
           DISPLAY "125 - 25      = " WS-OUT

           MULTIPLY WS-NUM1 BY WS-NUM2 GIVING WS-RESULT
           MOVE WS-RESULT TO WS-OUT
           DISPLAY "125 * 25      = " WS-OUT

           DIVIDE WS-NUM1 BY WS-NUM2 GIVING WS-RESULT
           MOVE WS-RESULT TO WS-OUT
           DISPLAY "125 / 25      = " WS-OUT

           DIVIDE WS-NUM1 BY WS-NUM3 GIVING WS-RESULT
                  REMAINDER WS-REMAINDER
           DISPLAY "125 / 10      = " WS-RESULT " REMAINDER "
                   WS-REMAINDER

           ADD 1 TO WS-COUNTER
           ADD 1 TO WS-COUNTER
           ADD 1 TO WS-COUNTER
           DISPLAY "COUNTER AFTER THREE ADDS = " WS-COUNTER
           STOP RUN.
