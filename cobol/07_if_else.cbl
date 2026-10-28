      *****************************************************************
      * PROGRAM  : IFEL07                                             *
      * LEVEL    : 2/10                                               *
      * TOPIC    : IF / ELSE, relational conditions, FUNCTION MOD     *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IFEL07.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUMBER    PIC S9(3) VALUE 42.
       01 WS-TEMP      PIC S9(3) VALUE -7.
       01 WS-AGE       PIC 9(2)  VALUE 17.
       01 WS-NUM-ED    PIC -ZZ9.
       PROCEDURE DIVISION.
           MOVE WS-NUMBER TO WS-NUM-ED
           IF FUNCTION MOD(WS-NUMBER, 2) = 0
              DISPLAY WS-NUM-ED " IS EVEN"
           ELSE
              DISPLAY WS-NUM-ED " IS ODD"
           END-IF

           MOVE WS-TEMP TO WS-NUM-ED
           IF WS-TEMP > 0
              DISPLAY WS-NUM-ED " IS POSITIVE"
           ELSE
              IF WS-TEMP < 0
                 DISPLAY WS-NUM-ED " IS NEGATIVE"
              ELSE
                 DISPLAY "THE NUMBER IS ZERO"
              END-IF
           END-IF

           IF WS-AGE >= 18
              DISPLAY "ELIGIBLE TO VOTE"
           ELSE
              DISPLAY "NOT ELIGIBLE TO VOTE YET"
           END-IF

           IF WS-NUMBER = 42
              DISPLAY "THE ANSWER TO EVERYTHING"
           END-IF
           STOP RUN.
