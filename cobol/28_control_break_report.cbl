      *****************************************************************
      * PROGRAM  : CBRK28                                             *
      * LEVEL    : 5/10                                               *
      * TOPIC    : Control-break (department subtotals) on a file     *
      * NOTE     : builds its own DEPTSAL.DAT, sorted by department   *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CBRK28.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT DEPT-FILE ASSIGN TO "DEPTSAL.DAT"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-FS.
       DATA DIVISION.
       FILE SECTION.
       FD DEPT-FILE.
       01 DEPT-REC.
          05 DR-DEPT        PIC X(6).
          05 DR-NAME        PIC X(10).
          05 DR-SALARY      PIC 9(6).
       WORKING-STORAGE SECTION.
       01 WS-FS             PIC XX.
       01 WS-SRC-DATA.
          05 FILLER PIC X(6)  VALUE "HR".
          05 FILLER PIC X(10) VALUE "DEEPA".
          05 FILLER PIC 9(6)  VALUE 39000.
          05 FILLER PIC X(6)  VALUE "HR".
          05 FILLER PIC X(10) VALUE "EZHIL".
          05 FILLER PIC 9(6)  VALUE 41000.
          05 FILLER PIC X(6)  VALUE "IT".
          05 FILLER PIC X(10) VALUE "ARUN".
          05 FILLER PIC 9(6)  VALUE 45000.
          05 FILLER PIC X(6)  VALUE "IT".
          05 FILLER PIC X(10) VALUE "BALA".
          05 FILLER PIC 9(6)  VALUE 52000.
          05 FILLER PIC X(6)  VALUE "IT".
          05 FILLER PIC X(10) VALUE "CHITRA".
          05 FILLER PIC 9(6)  VALUE 48000.
          05 FILLER PIC X(6)  VALUE "SALES".
          05 FILLER PIC X(10) VALUE "FAROOK".
          05 FILLER PIC 9(6)  VALUE 35000.
          05 FILLER PIC X(6)  VALUE "SALES".
          05 FILLER PIC X(10) VALUE "GAYATHRI".
          05 FILLER PIC 9(6)  VALUE 37500.
          05 FILLER PIC X(6)  VALUE "SALES".
          05 FILLER PIC X(10) VALUE "HARI".
          05 FILLER PIC 9(6)  VALUE 33000.
       01 WS-SRC-TABLE REDEFINES WS-SRC-DATA.
          05 WS-SRC OCCURS 8 TIMES.
             10 WS-SRC-DEPT    PIC X(6).
             10 WS-SRC-NAME    PIC X(10).
             10 WS-SRC-SALARY  PIC 9(6).
       01 WS-I              PIC 9.
       01 WS-EOF            PIC X VALUE "N".
          88 END-OF-FILE    VALUE "Y".
       01 WS-PREV-DEPT      PIC X(6).
       01 WS-DEPT-TOTAL     PIC 9(7) VALUE 0.
       01 WS-DEPT-COUNT     PIC 99   VALUE 0.
       01 WS-GRAND-TOTAL    PIC 9(8) VALUE 0.
       01 WS-GRAND-COUNT    PIC 99   VALUE 0.
       01 WS-SAL-ED         PIC ZZZ,ZZ9.
       01 WS-TOT-ED         PIC Z,ZZZ,ZZ9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM BUILD-FILE
           PERFORM PRODUCE-REPORT
           STOP RUN.

       BUILD-FILE.
           OPEN OUTPUT DEPT-FILE
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 8
              MOVE WS-SRC-DEPT(WS-I)   TO DR-DEPT
              MOVE WS-SRC-NAME(WS-I)   TO DR-NAME
              MOVE WS-SRC-SALARY(WS-I) TO DR-SALARY
              WRITE DEPT-REC
           END-PERFORM
           CLOSE DEPT-FILE.

       PRODUCE-REPORT.
           OPEN INPUT DEPT-FILE
           READ DEPT-FILE
              AT END SET END-OF-FILE TO TRUE
           END-READ
           IF NOT END-OF-FILE
              MOVE DR-DEPT TO WS-PREV-DEPT
              PERFORM PRINT-DEPT-HEADER
           END-IF

           PERFORM UNTIL END-OF-FILE
              IF DR-DEPT NOT = WS-PREV-DEPT
                 PERFORM DEPT-BREAK
                 MOVE DR-DEPT TO WS-PREV-DEPT
                 PERFORM PRINT-DEPT-HEADER
              END-IF
              MOVE DR-SALARY TO WS-SAL-ED
              DISPLAY "    " DR-NAME WS-SAL-ED
              ADD DR-SALARY TO WS-DEPT-TOTAL
              ADD 1 TO WS-DEPT-COUNT
              READ DEPT-FILE
                 AT END SET END-OF-FILE TO TRUE
              END-READ
           END-PERFORM

           IF WS-DEPT-COUNT > 0
              PERFORM DEPT-BREAK
           END-IF
           CLOSE DEPT-FILE

           MOVE WS-GRAND-TOTAL TO WS-TOT-ED
           DISPLAY "=============================="
           DISPLAY "GRAND TOTAL (" WS-GRAND-COUNT " EMPLOYEES) "
                   WS-TOT-ED.

       PRINT-DEPT-HEADER.
           DISPLAY "DEPARTMENT: " WS-PREV-DEPT.

       DEPT-BREAK.
           MOVE WS-DEPT-TOTAL TO WS-TOT-ED
           DISPLAY "    SUBTOTAL (" WS-DEPT-COUNT ") " WS-TOT-ED
           DISPLAY " "
           ADD WS-DEPT-TOTAL TO WS-GRAND-TOTAL
           ADD WS-DEPT-COUNT TO WS-GRAND-COUNT
           MOVE 0 TO WS-DEPT-TOTAL
           MOVE 0 TO WS-DEPT-COUNT.
