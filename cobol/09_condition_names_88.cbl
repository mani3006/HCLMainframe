      *****************************************************************
      * PROGRAM  : COND09                                             *
      * LEVEL    : 2/10                                               *
      * TOPIC    : Level-88 condition names, SET ... TO TRUE          *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COND09.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-STATUS     PIC X VALUE "A".
          88 STATUS-ACTIVE    VALUE "A".
          88 STATUS-INACTIVE  VALUE "I".
          88 STATUS-VALID     VALUE "A" "I" "S".
       01 WS-MONTH      PIC 99 VALUE 7.
          88 SUMMER-MONTH     VALUE 6 THRU 8.
          88 WINTER-MONTH     VALUE 12 1 2.
       01 WS-GENDER     PIC X VALUE "F".
          88 IS-MALE          VALUE "M".
          88 IS-FEMALE        VALUE "F".
       PROCEDURE DIVISION.
           IF STATUS-ACTIVE
              DISPLAY "ACCOUNT IS ACTIVE"
           END-IF

           SET STATUS-INACTIVE TO TRUE
           DISPLAY "STATUS NOW HOLDS : " WS-STATUS
           IF STATUS-INACTIVE
              DISPLAY "ACCOUNT IS NOW INACTIVE"
           END-IF

           IF STATUS-VALID
              DISPLAY "STATUS CODE IS VALID"
           END-IF

           IF SUMMER-MONTH
              DISPLAY "MONTH " WS-MONTH " IS IN SUMMER"
           END-IF
           IF NOT WINTER-MONTH
              DISPLAY "MONTH " WS-MONTH " IS NOT IN WINTER"
           END-IF

           IF IS-FEMALE
              DISPLAY "GENDER: FEMALE"
           ELSE
              DISPLAY "GENDER: MALE"
           END-IF
           STOP RUN.
