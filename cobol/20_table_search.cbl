      *****************************************************************
      * PROGRAM  : SRCH20                                             *
      * LEVEL    : 4/10                                               *
      * TOPIC    : INDEXED BY, SEARCH (linear), SEARCH ALL (binary)   *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SRCH20.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-EMP-DATA.
          05 FILLER PIC 9(4)  VALUE 1001.
          05 FILLER PIC X(15) VALUE "ARUN KUMAR".
          05 FILLER PIC 9(4)  VALUE 1002.
          05 FILLER PIC X(15) VALUE "BALA MURUGAN".
          05 FILLER PIC 9(4)  VALUE 1003.
          05 FILLER PIC X(15) VALUE "CHITRA DEVI".
          05 FILLER PIC 9(4)  VALUE 1004.
          05 FILLER PIC X(15) VALUE "DINESH RAJ".
          05 FILLER PIC 9(4)  VALUE 1005.
          05 FILLER PIC X(15) VALUE "EZHIL ARASI".
       01 WS-EMP-TABLE REDEFINES WS-EMP-DATA.
          05 WS-EMP OCCURS 5 TIMES
                    ASCENDING KEY IS WS-EMP-ID
                    INDEXED BY EMP-IDX.
             10 WS-EMP-ID    PIC 9(4).
             10 WS-EMP-NAME  PIC X(15).
       01 WS-SEARCH-ID      PIC 9(4).
       PROCEDURE DIVISION.
           MOVE 1003 TO WS-SEARCH-ID
           SET EMP-IDX TO 1
           SEARCH WS-EMP
              AT END
                 DISPLAY "LINEAR SEARCH: " WS-SEARCH-ID " NOT FOUND"
              WHEN WS-EMP-ID(EMP-IDX) = WS-SEARCH-ID
                 DISPLAY "LINEAR SEARCH: " WS-SEARCH-ID " IS "
                         WS-EMP-NAME(EMP-IDX)
           END-SEARCH

           MOVE 1005 TO WS-SEARCH-ID
           SEARCH ALL WS-EMP
              AT END
                 DISPLAY "BINARY SEARCH: " WS-SEARCH-ID " NOT FOUND"
              WHEN WS-EMP-ID(EMP-IDX) = WS-SEARCH-ID
                 DISPLAY "BINARY SEARCH: " WS-SEARCH-ID " IS "
                         WS-EMP-NAME(EMP-IDX)
           END-SEARCH

           MOVE 9999 TO WS-SEARCH-ID
           SEARCH ALL WS-EMP
              AT END
                 DISPLAY "BINARY SEARCH: " WS-SEARCH-ID " NOT FOUND"
              WHEN WS-EMP-ID(EMP-IDX) = WS-SEARCH-ID
                 DISPLAY "BINARY SEARCH: " WS-SEARCH-ID " IS "
                         WS-EMP-NAME(EMP-IDX)
           END-SEARCH
           STOP RUN.
