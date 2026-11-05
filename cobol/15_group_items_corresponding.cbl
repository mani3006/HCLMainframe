      *****************************************************************
      * PROGRAM  : GRUP15                                             *
      * LEVEL    : 3/10                                               *
      * TOPIC    : Group items, MOVE CORRESPONDING, REDEFINES         *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. GRUP15.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-EMP-IN.
          05 EMP-ID       PIC 9(5)  VALUE 10234.
          05 EMP-NAME     PIC X(15) VALUE "RAJESH KUMAR".
          05 EMP-DEPT     PIC X(10) VALUE "FINANCE".
          05 EMP-SALARY   PIC 9(6)  VALUE 55000.
       01 WS-EMP-OUT.
          05 EMP-NAME     PIC X(15).
          05 EMP-ID       PIC 9(5).
          05 EMP-SALARY   PIC $ZZZ,ZZ9.
       01 WS-DOB-NUM      PIC 9(8)  VALUE 19950815.
       01 WS-DOB REDEFINES WS-DOB-NUM.
          05 DOB-YYYY     PIC 9(4).
          05 DOB-MM       PIC 9(2).
          05 DOB-DD       PIC 9(2).
       PROCEDURE DIVISION.
           DISPLAY "FIELDS OF THE INPUT GROUP"
           DISPLAY "WHOLE GROUP : [" WS-EMP-IN "]"
           DISPLAY "DEPARTMENT  : " EMP-DEPT

           MOVE CORRESPONDING WS-EMP-IN TO WS-EMP-OUT
           DISPLAY " "
           DISPLAY "AFTER MOVE CORRESPONDING"
           DISPLAY "ID     : " EMP-ID OF WS-EMP-OUT
           DISPLAY "NAME   : " EMP-NAME OF WS-EMP-OUT
           DISPLAY "SALARY : " EMP-SALARY OF WS-EMP-OUT

           DISPLAY " "
           DISPLAY "REDEFINES: ONE DATE, TWO VIEWS"
           DISPLAY "AS A NUMBER : " WS-DOB-NUM
           DISPLAY "DAY/MONTH/YEAR : " DOB-DD "/" DOB-MM "/" DOB-YYYY
           STOP RUN.
