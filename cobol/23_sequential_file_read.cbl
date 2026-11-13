      *****************************************************************
      * PROGRAM  : FRED23                                             *
      * LEVEL    : 4/10                                               *
      * TOPIC    : Sequential file - OPEN INPUT, READ ... AT END      *
      * INPUT    : EMPLOYEE.DAT (created by program 22)               *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FRED23.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMP-FILE ASSIGN TO "EMPLOYEE.DAT"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-FS.
       DATA DIVISION.
       FILE SECTION.
       FD EMP-FILE.
       01 EMP-REC.
          05 EMP-ID        PIC 9(5).
          05 EMP-NAME      PIC X(15).
          05 EMP-DEPT      PIC X(10).
          05 EMP-SALARY    PIC 9(6).
       WORKING-STORAGE SECTION.
       01 WS-FS            PIC XX.
       01 WS-EOF           PIC X VALUE "N".
          88 END-OF-FILE   VALUE "Y".
       01 WS-COUNT         PIC 99 VALUE 0.
       01 WS-TOTAL         PIC 9(7) VALUE 0.
       01 WS-HIGH-SAL      PIC 9(6) VALUE 0.
       01 WS-HIGH-NAME     PIC X(15).
       01 WS-SAL-ED        PIC ZZZ,ZZ9.
       01 WS-TOT-ED        PIC Z,ZZZ,ZZ9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           OPEN INPUT EMP-FILE
           IF WS-FS NOT = "00"
              DISPLAY "CANNOT OPEN EMPLOYEE.DAT, STATUS = " WS-FS
              DISPLAY "RUN PROGRAM 22 FIRST TO CREATE THE FILE"
              STOP RUN
           END-IF

           DISPLAY "ID     NAME            DEPT        SALARY"
           PERFORM UNTIL END-OF-FILE
              READ EMP-FILE
                 AT END
                    SET END-OF-FILE TO TRUE
                 NOT AT END
                    PERFORM PROCESS-RECORD
              END-READ
           END-PERFORM
           CLOSE EMP-FILE

           DISPLAY " "
           DISPLAY "RECORDS READ     : " WS-COUNT
           MOVE WS-TOTAL TO WS-TOT-ED
           DISPLAY "TOTAL SALARY     : " WS-TOT-ED
           MOVE WS-HIGH-SAL TO WS-SAL-ED
           DISPLAY "HIGHEST PAID     : " WS-HIGH-NAME WS-SAL-ED
           STOP RUN.

       PROCESS-RECORD.
           ADD 1 TO WS-COUNT
           ADD EMP-SALARY TO WS-TOTAL
           IF EMP-SALARY > WS-HIGH-SAL
              MOVE EMP-SALARY TO WS-HIGH-SAL
              MOVE EMP-NAME TO WS-HIGH-NAME
           END-IF
           MOVE EMP-SALARY TO WS-SAL-ED
           DISPLAY EMP-ID " " EMP-NAME " " EMP-DEPT WS-SAL-ED.
