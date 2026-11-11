      *****************************************************************
      * PROGRAM  : TABL21                                             *
      * LEVEL    : 4/10                                               *
      * TOPIC    : Two-dimensional tables, row and column totals      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TABL21.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-MARKS-DATA.
          05 FILLER PIC 9(12) VALUE 078085092088.
          05 FILLER PIC 9(12) VALUE 066072058081.
          05 FILLER PIC 9(12) VALUE 091095089097.
       01 WS-MARKS-TABLE REDEFINES WS-MARKS-DATA.
          05 WS-STUDENT OCCURS 3 TIMES.
             10 WS-MARK    PIC 9(3) OCCURS 4 TIMES.
       01 WS-COL-TOTALS.
          05 WS-COL-TOTAL  PIC 9(4) OCCURS 4 TIMES.
       01 WS-I             PIC 9.
       01 WS-J             PIC 9.
       01 WS-ROW-TOTAL     PIC 9(4).
       01 WS-ROW-ED        PIC ZZZ9.
       01 WS-MARK-ED       PIC ZZ9.
       01 WS-COL-ED        PIC ZZZ9.
       01 WS-LINE          PIC X(40).
       01 WS-PTR           PIC 99.
       PROCEDURE DIVISION.
           INITIALIZE WS-COL-TOTALS
           DISPLAY "STUDENT   SUB1 SUB2 SUB3 SUB4  TOTAL"
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 3
              MOVE 0 TO WS-ROW-TOTAL
              MOVE SPACES TO WS-LINE
              MOVE 1 TO WS-PTR
              STRING "   " WS-I "     " DELIMITED BY SIZE
                 INTO WS-LINE WITH POINTER WS-PTR
              END-STRING
              PERFORM VARYING WS-J FROM 1 BY 1 UNTIL WS-J > 4
                 ADD WS-MARK(WS-I, WS-J) TO WS-ROW-TOTAL
                 ADD WS-MARK(WS-I, WS-J) TO WS-COL-TOTAL(WS-J)
                 MOVE WS-MARK(WS-I, WS-J) TO WS-MARK-ED
                 STRING "  " WS-MARK-ED DELIMITED BY SIZE
                    INTO WS-LINE WITH POINTER WS-PTR
                 END-STRING
              END-PERFORM
              MOVE WS-ROW-TOTAL TO WS-ROW-ED
              STRING "   " WS-ROW-ED DELIMITED BY SIZE
                 INTO WS-LINE WITH POINTER WS-PTR
              END-STRING
              DISPLAY WS-LINE
           END-PERFORM

           MOVE SPACES TO WS-LINE
           MOVE 1 TO WS-PTR
           STRING "TOTAL    " DELIMITED BY SIZE
              INTO WS-LINE WITH POINTER WS-PTR
           END-STRING
           PERFORM VARYING WS-J FROM 1 BY 1 UNTIL WS-J > 4
              MOVE WS-COL-TOTAL(WS-J) TO WS-COL-ED
              STRING " " WS-COL-ED DELIMITED BY SIZE
                 INTO WS-LINE WITH POINTER WS-PTR
              END-STRING
           END-PERFORM
           DISPLAY WS-LINE
           STOP RUN.
