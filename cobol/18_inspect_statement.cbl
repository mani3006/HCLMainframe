      *****************************************************************
      * PROGRAM  : INSP18                                             *
      * LEVEL    : 3/10                                               *
      * TOPIC    : INSPECT TALLYING / REPLACING / CONVERTING,         *
      *            reference modification, intrinsic functions        *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. INSP18.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-TEXT       PIC X(30) VALUE "MAINFRAME COBOL PROGRAMMING".
       01 WS-LOWER      PIC X(20) VALUE "hcl mainframe course".
       01 WS-PHONE      PIC X(12) VALUE "98-765-43210".
       01 WS-COUNT      PIC 99    VALUE 0.
       01 WS-LEADING    PIC 99    VALUE 0.
       01 WS-ZEROS      PIC X(8)  VALUE "0000425A".
       PROCEDURE DIVISION.
           INSPECT WS-TEXT TALLYING WS-COUNT FOR ALL "M"
           DISPLAY "LETTER M APPEARS : " WS-COUNT " TIMES"

           INSPECT WS-TEXT REPLACING ALL "O" BY "0"
           DISPLAY "REPLACE O WITH 0 : " WS-TEXT

           INSPECT WS-LOWER CONVERTING
              "abcdefghijklmnopqrstuvwxyz" TO
              "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
           DISPLAY "CONVERTING       : " WS-LOWER

           INSPECT WS-PHONE REPLACING ALL "-" BY SPACE
           DISPLAY "DASHES REMOVED   : " WS-PHONE

           INSPECT WS-ZEROS TALLYING WS-LEADING FOR LEADING "0"
           DISPLAY "LEADING ZEROS    : " WS-LEADING
           INSPECT WS-ZEROS REPLACING LEADING "0" BY SPACE
           DISPLAY "ZEROS BLANKED    : [" WS-ZEROS "]"

           DISPLAY "FIRST 9 CHARS    : " WS-LOWER(1:9)
           DISPLAY "LENGTH FUNCTION  : " FUNCTION LENGTH(WS-TEXT)
           DISPLAY "REVERSED         : "
                   FUNCTION REVERSE(FUNCTION TRIM(WS-LOWER))
           STOP RUN.
