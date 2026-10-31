      *****************************************************************
      * PROGRAM  : EVAL10                                             *
      * LEVEL    : 2/10                                               *
      * TOPIC    : EVALUATE (COBOL's switch / case)                   *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVAL10.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-DAY       PIC 9    VALUE 3.
       01 WS-MARKS     PIC 9(3) VALUE 82.
       01 WS-GRADE     PIC X.
       01 WS-CHOICE    PIC X    VALUE "D".
       PROCEDURE DIVISION.
           EVALUATE WS-DAY
              WHEN 1  DISPLAY "MONDAY"
              WHEN 2  DISPLAY "TUESDAY"
              WHEN 3  DISPLAY "WEDNESDAY"
              WHEN 4  DISPLAY "THURSDAY"
              WHEN 5  DISPLAY "FRIDAY"
              WHEN 6 THRU 7
                      DISPLAY "WEEKEND"
              WHEN OTHER
                      DISPLAY "INVALID DAY NUMBER"
           END-EVALUATE

           EVALUATE TRUE
              WHEN WS-MARKS >= 90  MOVE "A" TO WS-GRADE
              WHEN WS-MARKS >= 75  MOVE "B" TO WS-GRADE
              WHEN WS-MARKS >= 60  MOVE "C" TO WS-GRADE
              WHEN WS-MARKS >= 35  MOVE "D" TO WS-GRADE
              WHEN OTHER           MOVE "F" TO WS-GRADE
           END-EVALUATE
           DISPLAY "MARKS " WS-MARKS " GIVE GRADE " WS-GRADE

           EVALUATE WS-CHOICE
              WHEN "A"  DISPLAY "MENU: ADD A RECORD"
              WHEN "D"  DISPLAY "MENU: DELETE A RECORD"
              WHEN "U"  DISPLAY "MENU: UPDATE A RECORD"
              WHEN "Q"  DISPLAY "MENU: QUIT"
              WHEN OTHER DISPLAY "MENU: UNKNOWN OPTION"
           END-EVALUATE
           STOP RUN.
