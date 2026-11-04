      *****************************************************************
      * PROGRAM  : VARY14                                             *
      * LEVEL    : 3/10                                               *
      * TOPIC    : PERFORM VARYING, nested loops, BY step values      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. VARY14.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-I          PIC 99.
       01 WS-J          PIC 99.
       01 WS-PROD       PIC 999.
       01 WS-I-ED       PIC Z9.
       01 WS-PROD-ED    PIC ZZ9.
       01 WS-EVEN-SUM   PIC 9(4) VALUE 0.
       01 WS-ROW        PIC X(30).
       01 WS-PTR        PIC 99.
       PROCEDURE DIVISION.
           DISPLAY "MULTIPLICATION TABLE OF 7"
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 10
              COMPUTE WS-PROD = 7 * WS-I
              MOVE WS-I TO WS-I-ED
              MOVE WS-PROD TO WS-PROD-ED
              DISPLAY "7 X " WS-I-ED " = " WS-PROD-ED
           END-PERFORM

           DISPLAY " "
           DISPLAY "SUM OF EVEN NUMBERS 2 TO 20 (BY 2)"
           PERFORM VARYING WS-I FROM 2 BY 2 UNTIL WS-I > 20
              ADD WS-I TO WS-EVEN-SUM
           END-PERFORM
           DISPLAY "RESULT = " WS-EVEN-SUM

           DISPLAY " "
           DISPLAY "4 X 4 MULTIPLICATION GRID"
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 4
              MOVE SPACES TO WS-ROW
              MOVE 1 TO WS-PTR
              PERFORM VARYING WS-J FROM 1 BY 1 UNTIL WS-J > 4
                 COMPUTE WS-PROD = WS-I * WS-J
                 MOVE WS-PROD TO WS-PROD-ED
                 STRING WS-PROD-ED " " DELIMITED BY SIZE
                    INTO WS-ROW WITH POINTER WS-PTR
                 END-STRING
              END-PERFORM
              DISPLAY WS-ROW
           END-PERFORM

           DISPLAY " "
           DISPLAY "COUNTING DOWN BY 3"
           PERFORM VARYING WS-I FROM 15 BY -3 UNTIL WS-I < 1
              MOVE WS-I TO WS-I-ED
              DISPLAY WS-I-ED
           END-PERFORM
           STOP RUN.
