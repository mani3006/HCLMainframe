      *****************************************************************
      * PROGRAM  : TIME12                                             *
      * LEVEL    : 3/10                                               *
      * TOPIC    : PERFORM n TIMES, inline and out-of-line loops      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TIME12.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-COUNT     PIC 9     VALUE 3.
       01 WS-LINE      PIC X(10).
       01 WS-LEN       PIC 99    VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM 3 TIMES
              DISPLAY "COBOL IS FUN"
           END-PERFORM

           DISPLAY "--- COUNT FROM A VARIABLE ---"
           PERFORM WS-COUNT TIMES
              DISPLAY "*****"
           END-PERFORM

           DISPLAY "--- OUT-OF-LINE PARAGRAPH ---"
           PERFORM PRINT-LINE 2 TIMES

           DISPLAY "--- TRIANGLE ---"
           PERFORM 5 TIMES
              ADD 1 TO WS-LEN
              MOVE SPACES TO WS-LINE
              MOVE ALL "*" TO WS-LINE(1:WS-LEN)
              DISPLAY WS-LINE
           END-PERFORM
           STOP RUN.

       PRINT-LINE.
           DISPLAY "------------".
