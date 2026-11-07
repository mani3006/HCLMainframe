      *****************************************************************
      * PROGRAM  : UNST17                                             *
      * LEVEL    : 3/10                                               *
      * TOPIC    : UNSTRING to split a CSV record, TALLYING           *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. UNST17.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-RECORD     PIC X(40)
                        VALUE "1001,ARUN KUMAR,CHENNAI,45000".
       01 WS-ID         PIC X(5).
       01 WS-NAME       PIC X(15).
       01 WS-CITY       PIC X(10).
       01 WS-SALARY-X   PIC X(6).
       01 WS-SALARY     PIC 9(6).
       01 WS-FIELDS     PIC 9     VALUE 0.
       01 WS-PATH       PIC X(30) VALUE "HOME/USER/DOCS/REPORT".
       01 WS-DIR1       PIC X(10).
       01 WS-DIR2       PIC X(10).
       01 WS-REST       PIC X(20).
       PROCEDURE DIVISION.
           UNSTRING WS-RECORD DELIMITED BY ","
              INTO WS-ID WS-NAME WS-CITY WS-SALARY-X
              TALLYING IN WS-FIELDS
           END-UNSTRING
           DISPLAY "FIELDS FOUND : " WS-FIELDS
           DISPLAY "ID           : " WS-ID
           DISPLAY "NAME         : " WS-NAME
           DISPLAY "CITY         : " WS-CITY
           MOVE FUNCTION NUMVAL(WS-SALARY-X) TO WS-SALARY
           ADD 5000 TO WS-SALARY
           DISPLAY "SALARY + 5000: " WS-SALARY

           UNSTRING WS-PATH DELIMITED BY "/"
              INTO WS-DIR1 WS-DIR2 WS-REST
           END-UNSTRING
           DISPLAY " "
           DISPLAY "FIRST LEVEL  : " WS-DIR1
           DISPLAY "SECOND LEVEL : " WS-DIR2
           DISPLAY "REMAINDER    : " WS-REST
           STOP RUN.
