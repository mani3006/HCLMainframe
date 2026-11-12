      *****************************************************************
      * PROGRAM  : FWRT22                                             *
      * LEVEL    : 4/10                                               *
      * TOPIC    : Sequential file - OPEN OUTPUT, WRITE, FILE STATUS  *
      * OUTPUT   : EMPLOYEE.DAT (used by program 23)                  *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FWRT22.
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
       01 WS-COUNT         PIC 99 VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PARA.
           OPEN OUTPUT EMP-FILE
           IF WS-FS NOT = "00"
              DISPLAY "OPEN FAILED, FILE STATUS = " WS-FS
              STOP RUN
           END-IF

           MOVE 10001 TO EMP-ID
           MOVE "ARUN KUMAR" TO EMP-NAME
           MOVE "IT" TO EMP-DEPT
           MOVE 45000 TO EMP-SALARY
           PERFORM WRITE-RECORD

           MOVE 10002 TO EMP-ID
           MOVE "BALA MURUGAN" TO EMP-NAME
           MOVE "HR" TO EMP-DEPT
           MOVE 38000 TO EMP-SALARY
           PERFORM WRITE-RECORD

           MOVE 10003 TO EMP-ID
           MOVE "CHITRA DEVI" TO EMP-NAME
           MOVE "FINANCE" TO EMP-DEPT
           MOVE 52000 TO EMP-SALARY
           PERFORM WRITE-RECORD

           MOVE 10004 TO EMP-ID
           MOVE "DINESH RAJ" TO EMP-NAME
           MOVE "SALES" TO EMP-DEPT
           MOVE 33500 TO EMP-SALARY
           PERFORM WRITE-RECORD

           MOVE 10005 TO EMP-ID
           MOVE "EZHIL ARASI" TO EMP-NAME
           MOVE "IT" TO EMP-DEPT
           MOVE 61000 TO EMP-SALARY
           PERFORM WRITE-RECORD

           CLOSE EMP-FILE
           DISPLAY WS-COUNT " RECORDS WRITTEN TO EMPLOYEE.DAT"
           STOP RUN.

       WRITE-RECORD.
           WRITE EMP-REC
           IF WS-FS = "00"
              ADD 1 TO WS-COUNT
           ELSE
              DISPLAY "WRITE ERROR, FILE STATUS = " WS-FS
           END-IF.
