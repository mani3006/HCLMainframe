      *****************************************************************
      * PROGRAM  : UNTL13                                             *
      * LEVEL    : 3/10                                               *
      * TOPIC    : PERFORM UNTIL, WITH TEST AFTER, digit extraction   *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. UNTL13.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-I          PIC 9(3) VALUE 1.
       01 WS-SUM        PIC 9(5) VALUE 0.
       01 WS-FACT       PIC 9(8) VALUE 1.
       01 WS-N          PIC 9    VALUE 5.
       01 WS-NUM        PIC 9(5) VALUE 12345.
       01 WS-QUOT       PIC 9(5).
       01 WS-DIGIT      PIC 9.
       01 WS-DIGIT-SUM  PIC 99   VALUE 0.
       PROCEDURE DIVISION.
           PERFORM UNTIL WS-I > 10
              ADD WS-I TO WS-SUM
              ADD 1 TO WS-I
           END-PERFORM
           DISPLAY "SUM OF 1 TO 10 = " WS-SUM

           MOVE 1 TO WS-I
           PERFORM UNTIL WS-I > 8
              MULTIPLY WS-I BY WS-FACT
              ADD 1 TO WS-I
           END-PERFORM
           DISPLAY "FACTORIAL OF 8 = " WS-FACT

           PERFORM WITH TEST AFTER UNTIL WS-N = 0
              DISPLAY "COUNTDOWN: " WS-N
              SUBTRACT 1 FROM WS-N
           END-PERFORM
           DISPLAY "LIFT OFF!"

           PERFORM UNTIL WS-NUM = 0
              DIVIDE WS-NUM BY 10 GIVING WS-QUOT REMAINDER WS-DIGIT
              ADD WS-DIGIT TO WS-DIGIT-SUM
              MOVE WS-QUOT TO WS-NUM
           END-PERFORM
           DISPLAY "SUM OF DIGITS OF 12345 = " WS-DIGIT-SUM
           STOP RUN.
