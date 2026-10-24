      *****************************************************************
      * PROGRAM  : MOVE03                                             *
      * LEVEL    : 1/10                                               *
      * TOPIC    : MOVE, padding, truncation, figurative constants    *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MOVE03.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-SOURCE     PIC X(10)   VALUE "MAINFRAME".
       01 WS-TARGET     PIC X(15).
       01 WS-SHORT      PIC X(5).
       01 WS-NUM-IN     PIC 9(5)    VALUE 12345.
       01 WS-NUM-WIDE   PIC 9(8).
       01 WS-NUM-NARROW PIC 9(3).
       01 WS-DEC-IN     PIC 9(3)V99 VALUE 123.45.
       01 WS-DEC-OUT    PIC 9(3).
       01 WS-A          PIC X(6).
       01 WS-B          PIC X(6).
       PROCEDURE DIVISION.
           MOVE WS-SOURCE TO WS-TARGET
           DISPLAY "ALPHANUMERIC PADS RIGHT : [" WS-TARGET "]"

           MOVE WS-SOURCE TO WS-SHORT
           DISPLAY "ALPHANUMERIC TRUNCATES  : [" WS-SHORT "]"

           MOVE WS-NUM-IN TO WS-NUM-WIDE
           DISPLAY "NUMERIC PADS ZEROS LEFT : " WS-NUM-WIDE

           MOVE WS-NUM-IN TO WS-NUM-NARROW
           DISPLAY "NUMERIC TRUNCATES LEFT  : " WS-NUM-NARROW

           MOVE WS-DEC-IN TO WS-DEC-OUT
           DISPLAY "DECIMALS ARE DROPPED    : " WS-DEC-OUT

           MOVE SPACES TO WS-TARGET
           DISPLAY "SPACES                  : [" WS-TARGET "]"
           MOVE ALL "*" TO WS-TARGET
           DISPLAY "ALL '*'                 : [" WS-TARGET "]"
           MOVE ZEROS TO WS-NUM-WIDE
           DISPLAY "ZEROS                   : " WS-NUM-WIDE

           MOVE "COBOL" TO WS-A WS-B
           DISPLAY "ONE MOVE, TWO TARGETS   : " WS-A "/" WS-B
           STOP RUN.
