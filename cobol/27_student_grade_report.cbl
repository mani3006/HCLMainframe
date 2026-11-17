      *****************************************************************
      * PROGRAM  : GRAD27                                             *
      * LEVEL    : 5/10                                               *
      * TOPIC    : Table processing, grading rules, class statistics  *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. GRAD27.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-STUDENT-DATA.
          05 FILLER PIC X(10) VALUE "ANITHA".
          05 FILLER PIC 9(9)  VALUE 085090078.
          05 FILLER PIC X(10) VALUE "BHARATH".
          05 FILLER PIC 9(9)  VALUE 060045052.
          05 FILLER PIC X(10) VALUE "CHANDRA".
          05 FILLER PIC 9(9)  VALUE 092096098.
          05 FILLER PIC X(10) VALUE "DIVYA".
          05 FILLER PIC 9(9)  VALUE 033070065.
          05 FILLER PIC X(10) VALUE "EZHIL".
          05 FILLER PIC 9(9)  VALUE 074068080.
       01 WS-STUDENT-TABLE REDEFINES WS-STUDENT-DATA.
          05 WS-STUDENT OCCURS 5 TIMES.
             10 WS-NAME       PIC X(10).
             10 WS-MARK       PIC 9(3) OCCURS 3 TIMES.
       01 WS-RESULT-TABLE.
          05 WS-RESULT OCCURS 5 TIMES.
             10 WS-TOTAL      PIC 9(3).
             10 WS-AVG        PIC 9(3)V99.
             10 WS-GRADE      PIC X.
             10 WS-STATUS     PIC X(4).
       01 WS-I                PIC 9.
       01 WS-J                PIC 9.
       01 WS-FAILED           PIC X.
          88 HAS-FAILED       VALUE "Y".
       01 WS-HIGH-IDX         PIC 9 VALUE 1.
       01 WS-PASS-COUNT       PIC 9 VALUE 0.
       01 WS-CLASS-TOTAL      PIC 9(4) VALUE 0.
       01 WS-CLASS-AVG        PIC 9(3)V99.
       01 WS-TOT-ED           PIC ZZ9.
       01 WS-AVG-ED           PIC ZZ9.99.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM CALCULATE-RESULTS
           PERFORM PRINT-REPORT
           PERFORM PRINT-SUMMARY
           STOP RUN.

       CALCULATE-RESULTS.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 5
              MOVE 0 TO WS-TOTAL(WS-I)
              MOVE "N" TO WS-FAILED
              PERFORM VARYING WS-J FROM 1 BY 1 UNTIL WS-J > 3
                 ADD WS-MARK(WS-I, WS-J) TO WS-TOTAL(WS-I)
                 IF WS-MARK(WS-I, WS-J) < 35
                    SET HAS-FAILED TO TRUE
                 END-IF
              END-PERFORM
              COMPUTE WS-AVG(WS-I) = WS-TOTAL(WS-I) / 3
              EVALUATE TRUE
                 WHEN HAS-FAILED
                    MOVE "F"    TO WS-GRADE(WS-I)
                    MOVE "FAIL" TO WS-STATUS(WS-I)
                 WHEN WS-AVG(WS-I) >= 90
                    MOVE "A"    TO WS-GRADE(WS-I)
                    MOVE "PASS" TO WS-STATUS(WS-I)
                 WHEN WS-AVG(WS-I) >= 75
                    MOVE "B"    TO WS-GRADE(WS-I)
                    MOVE "PASS" TO WS-STATUS(WS-I)
                 WHEN WS-AVG(WS-I) >= 60
                    MOVE "C"    TO WS-GRADE(WS-I)
                    MOVE "PASS" TO WS-STATUS(WS-I)
                 WHEN OTHER
                    MOVE "D"    TO WS-GRADE(WS-I)
                    MOVE "PASS" TO WS-STATUS(WS-I)
              END-EVALUATE
              ADD WS-TOTAL(WS-I) TO WS-CLASS-TOTAL
              IF WS-STATUS(WS-I) = "PASS"
                 ADD 1 TO WS-PASS-COUNT
              END-IF
              IF WS-TOTAL(WS-I) > WS-TOTAL(WS-HIGH-IDX)
                 MOVE WS-I TO WS-HIGH-IDX
              END-IF
           END-PERFORM.

       PRINT-REPORT.
           DISPLAY "NAME        M1  M2  M3  TOTAL  AVERAGE  GR  RESULT"
           DISPLAY "---------------------------------------------------"
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 5
              MOVE WS-TOTAL(WS-I) TO WS-TOT-ED
              MOVE WS-AVG(WS-I) TO WS-AVG-ED
              DISPLAY WS-NAME(WS-I) " "
                      WS-MARK(WS-I, 1) " "
                      WS-MARK(WS-I, 2) " "
                      WS-MARK(WS-I, 3) "  "
                      WS-TOT-ED "  "
                      WS-AVG-ED "   "
                      WS-GRADE(WS-I) "   "
                      WS-STATUS(WS-I)
           END-PERFORM.

       PRINT-SUMMARY.
           COMPUTE WS-CLASS-AVG = WS-CLASS-TOTAL / (5 * 3)
           MOVE WS-CLASS-AVG TO WS-AVG-ED
           DISPLAY " "
           DISPLAY "CLASS AVERAGE PER SUBJECT : " WS-AVG-ED
           DISPLAY "STUDENTS PASSED           : " WS-PASS-COUNT " OF 5"
           DISPLAY "TOPPER                    : " WS-NAME(WS-HIGH-IDX).
