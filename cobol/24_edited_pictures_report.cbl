      *****************************************************************
      * PROGRAM  : EDIT24                                             *
      * LEVEL    : 4/10                                               *
      * TOPIC    : Numeric-edited pictures for report formatting      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EDIT24.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-AMOUNT     PIC 9(7)V99  VALUE 1234567.89.
       01 WS-SMALL      PIC 9(5)V99  VALUE 4521.75.
       01 WS-ZERO-AMT   PIC 9(5)V99  VALUE 0.
       01 WS-DEBIT      PIC S9(5)V99 VALUE -1234.50.
       01 WS-CREDIT     PIC S9(5)V99 VALUE 980.25.
       01 WS-PHONE      PIC 9(10)    VALUE 9876543210.
       01 WS-DATE-NUM   PIC 9(8)     VALUE 20261123.
       01 WS-PERCENT    PIC 9(3)V99  VALUE 18.50.
       01 ED-COMMA      PIC Z,ZZZ,ZZ9.99.
       01 ED-DOLLAR     PIC $$,$$$,$$9.99.
       01 ED-STARS      PIC ***,**9.99.
       01 ED-ZERO       PIC ZZ,ZZ9.99.
       01 ED-MINUS      PIC -ZZ,ZZ9.99.
       01 ED-CR         PIC ZZ,ZZ9.99CR.
       01 ED-DB         PIC ZZ,ZZ9.99DB.
       01 ED-PLUS       PIC +ZZ,ZZ9.99.
       01 ED-PHONE      PIC 99999B99999.
       01 ED-DATE       PIC 9999/99/99.
       01 ED-PCT        PIC ZZ9.99.
       PROCEDURE DIVISION.
           MOVE WS-AMOUNT TO ED-COMMA
           DISPLAY "COMMA + ZERO SUPPRESS : " ED-COMMA

           MOVE WS-SMALL TO ED-DOLLAR
           DISPLAY "FLOATING DOLLAR SIGN  : " ED-DOLLAR

           MOVE WS-SMALL TO ED-STARS
           DISPLAY "CHEQUE PROTECTION     : " ED-STARS

           MOVE WS-ZERO-AMT TO ED-ZERO
           DISPLAY "ZERO VALUE            : " ED-ZERO

           MOVE WS-DEBIT TO ED-MINUS
           DISPLAY "NEGATIVE WITH MINUS   : " ED-MINUS

           MOVE WS-CREDIT TO ED-CR
           DISPLAY "POSITIVE WITH CR      : " ED-CR
           MOVE WS-DEBIT TO ED-DB
           DISPLAY "NEGATIVE WITH DB      : " ED-DB

           MOVE WS-CREDIT TO ED-PLUS
           DISPLAY "EXPLICIT PLUS SIGN    : " ED-PLUS

           MOVE WS-PHONE TO ED-PHONE
           DISPLAY "BLANK INSERTION       : " ED-PHONE

           MOVE WS-DATE-NUM TO ED-DATE
           DISPLAY "SLASH INSERTION       : " ED-DATE

           MOVE WS-PERCENT TO ED-PCT
           DISPLAY "PERCENTAGE            : " ED-PCT "%"
           STOP RUN.
