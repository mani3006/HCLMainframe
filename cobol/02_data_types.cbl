      *****************************************************************
      * PROGRAM  : DTYPE02                                            *
      * LEVEL    : 1/10                                               *
      * TOPIC    : WORKING-STORAGE, PIC clauses (X, 9, A, S, V)       *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DTYPE02.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NAME      PIC X(20)    VALUE "ARUN KUMAR".
       01 WS-AGE       PIC 9(2)     VALUE 28.
       01 WS-SALARY    PIC 9(5)V99  VALUE 45000.50.
       01 WS-GRADE     PIC A        VALUE "B".
       01 WS-BALANCE   PIC S9(5)    VALUE -250.
       PROCEDURE DIVISION.
           DISPLAY "NAME    : " WS-NAME
           DISPLAY "AGE     : " WS-AGE
           DISPLAY "SALARY  : " WS-SALARY
           DISPLAY "GRADE   : " WS-GRADE
           DISPLAY "BALANCE : " WS-BALANCE
           STOP RUN.
