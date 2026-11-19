      *****************************************************************
      * PROGRAM  : SORT29                                             *
      * LEVEL    : 5/10                                               *
      * TOPIC    : SORT verb with USING / GIVING and multiple keys    *
      * NOTE     : builds SORTIN.DAT, sorts to SORTOUT.DAT            *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SORT29.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT IN-FILE ASSIGN TO "SORTIN.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT SORT-FILE ASSIGN TO "SORTWORK.TMP".
           SELECT OUT-FILE ASSIGN TO "SORTOUT.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD IN-FILE.
       01 IN-REC.
          05 IN-ID          PIC 9(4).
          05 IN-NAME        PIC X(10).
          05 IN-DEPT        PIC X(6).
          05 IN-SALARY      PIC 9(6).
       SD SORT-FILE.
       01 SORT-REC.
          05 SORT-ID        PIC 9(4).
          05 SORT-NAME      PIC X(10).
          05 SORT-DEPT      PIC X(6).
          05 SORT-SALARY    PIC 9(6).
       FD OUT-FILE.
       01 OUT-REC.
          05 OUT-ID         PIC 9(4).
          05 OUT-NAME       PIC X(10).
          05 OUT-DEPT       PIC X(6).
          05 OUT-SALARY     PIC 9(6).
       WORKING-STORAGE SECTION.
       01 WS-SRC-DATA.
          05 FILLER PIC 9(4)  VALUE 1004.
          05 FILLER PIC X(10) VALUE "DINESH".
          05 FILLER PIC X(6)  VALUE "SALES".
          05 FILLER PIC 9(6)  VALUE 33500.
          05 FILLER PIC 9(4)  VALUE 1001.
          05 FILLER PIC X(10) VALUE "ARUN".
          05 FILLER PIC X(6)  VALUE "IT".
          05 FILLER PIC 9(6)  VALUE 45000.
          05 FILLER PIC 9(4)  VALUE 1006.
          05 FILLER PIC X(10) VALUE "FAROOK".
          05 FILLER PIC X(6)  VALUE "SALES".
          05 FILLER PIC 9(6)  VALUE 41000.
          05 FILLER PIC 9(4)  VALUE 1002.
          05 FILLER PIC X(10) VALUE "BALA".
          05 FILLER PIC X(6)  VALUE "HR".
          05 FILLER PIC 9(6)  VALUE 38000.
          05 FILLER PIC 9(4)  VALUE 1005.
          05 FILLER PIC X(10) VALUE "EZHIL".
          05 FILLER PIC X(6)  VALUE "IT".
          05 FILLER PIC 9(6)  VALUE 61000.
          05 FILLER PIC 9(4)  VALUE 1003.
          05 FILLER PIC X(10) VALUE "CHITRA".
          05 FILLER PIC X(6)  VALUE "HR".
          05 FILLER PIC 9(6)  VALUE 52000.
       01 WS-SRC-TABLE REDEFINES WS-SRC-DATA.
          05 WS-SRC OCCURS 6 TIMES.
             10 WS-SRC-ID      PIC 9(4).
             10 WS-SRC-NAME    PIC X(10).
             10 WS-SRC-DEPT    PIC X(6).
             10 WS-SRC-SALARY  PIC 9(6).
       01 WS-I              PIC 9.
       01 WS-EOF            PIC X VALUE "N".
          88 END-OF-FILE    VALUE "Y".
       01 WS-SAL-ED         PIC ZZZ,ZZ9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM BUILD-INPUT
           DISPLAY "BEFORE SORT (FILE ORDER)"
           PERFORM SHOW-INPUT

           SORT SORT-FILE
              ON ASCENDING KEY SORT-DEPT
              ON DESCENDING KEY SORT-SALARY
              USING IN-FILE
              GIVING OUT-FILE

           DISPLAY " "
           DISPLAY "AFTER SORT (DEPT ASC, SALARY DESC)"
           PERFORM SHOW-OUTPUT
           STOP RUN.

       BUILD-INPUT.
           OPEN OUTPUT IN-FILE
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 6
              MOVE WS-SRC-ID(WS-I)     TO IN-ID
              MOVE WS-SRC-NAME(WS-I)   TO IN-NAME
              MOVE WS-SRC-DEPT(WS-I)   TO IN-DEPT
              MOVE WS-SRC-SALARY(WS-I) TO IN-SALARY
              WRITE IN-REC
           END-PERFORM
           CLOSE IN-FILE.

       SHOW-INPUT.
           MOVE "N" TO WS-EOF
           OPEN INPUT IN-FILE
           PERFORM UNTIL END-OF-FILE
              READ IN-FILE
                 AT END SET END-OF-FILE TO TRUE
                 NOT AT END
                    MOVE IN-SALARY TO WS-SAL-ED
                    DISPLAY IN-ID " " IN-NAME " " IN-DEPT WS-SAL-ED
              END-READ
           END-PERFORM
           CLOSE IN-FILE.

       SHOW-OUTPUT.
           MOVE "N" TO WS-EOF
           OPEN INPUT OUT-FILE
           PERFORM UNTIL END-OF-FILE
              READ OUT-FILE
                 AT END SET END-OF-FILE TO TRUE
                 NOT AT END
                    MOVE OUT-SALARY TO WS-SAL-ED
                    DISPLAY OUT-ID " " OUT-NAME " " OUT-DEPT WS-SAL-ED
              END-READ
           END-PERFORM
           CLOSE OUT-FILE.
