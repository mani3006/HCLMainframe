      *****************************************************************
      * PROGRAM  : STRG16                                             *
      * LEVEL    : 3/10                                               *
      * TOPIC    : STRING with DELIMITED BY and POINTER               *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRG16.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-FIRST      PIC X(10) VALUE "ARUN".
       01 WS-LAST       PIC X(10) VALUE "KUMAR".
       01 WS-FULL       PIC X(25).
       01 WS-DOMAIN     PIC X(10) VALUE "HCL.COM".
       01 WS-EMAIL      PIC X(40).
       01 WS-PTR        PIC 99.
       01 WS-DAY        PIC 99    VALUE 23.
       01 WS-MONTH      PIC 99    VALUE 11.
       01 WS-YEAR       PIC 9(4)  VALUE 2026.
       01 WS-DATE-TXT   PIC X(10).
       PROCEDURE DIVISION.
           MOVE SPACES TO WS-FULL
           STRING WS-FIRST DELIMITED BY SPACE
                  " "      DELIMITED BY SIZE
                  WS-LAST  DELIMITED BY SPACE
              INTO WS-FULL
           END-STRING
           DISPLAY "FULL NAME : [" WS-FULL "]"

           MOVE SPACES TO WS-EMAIL
           STRING WS-FIRST  DELIMITED BY SPACE
                  "."       DELIMITED BY SIZE
                  WS-LAST   DELIMITED BY SPACE
                  "@"       DELIMITED BY SIZE
                  WS-DOMAIN DELIMITED BY SPACE
              INTO WS-EMAIL
           END-STRING
           DISPLAY "EMAIL     : [" WS-EMAIL "]"

           MOVE SPACES TO WS-DATE-TXT
           STRING WS-DAY   DELIMITED BY SIZE
                  "-"      DELIMITED BY SIZE
                  WS-MONTH DELIMITED BY SIZE
                  "-"      DELIMITED BY SIZE
                  WS-YEAR  DELIMITED BY SIZE
              INTO WS-DATE-TXT
           END-STRING
           DISPLAY "DATE      : [" WS-DATE-TXT "]"

           MOVE SPACES TO WS-FULL
           MOVE 1 TO WS-PTR
           STRING "COBOL" DELIMITED BY SIZE
              INTO WS-FULL WITH POINTER WS-PTR
           END-STRING
           STRING " ROCKS" DELIMITED BY SIZE
              INTO WS-FULL WITH POINTER WS-PTR
           END-STRING
           DISPLAY "POINTER   : [" WS-FULL "] NEXT POSITION = " WS-PTR
           STOP RUN.
