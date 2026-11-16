      *****************************************************************
      * PROGRAM  : LOAN26                                             *
      * LEVEL    : 4/10                                               *
      * TOPIC    : EMI formula with COMPUTE and a repayment schedule  *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOAN26.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-PRINCIPAL     PIC 9(7)V99  VALUE 100000.00.
       01 WS-ANNUAL-RATE   PIC 99V99    VALUE 10.50.
       01 WS-MONTHS        PIC 99       VALUE 12.
       01 WS-MRATE         PIC 9V9(8).
       01 WS-FACTOR        PIC 9(2)V9(8).
       01 WS-EMI           PIC 9(7)V99.
       01 WS-BALANCE       PIC 9(7)V99.
       01 WS-INTEREST      PIC 9(7)V99.
       01 WS-PRIN-PART     PIC 9(7)V99.
       01 WS-PAYMENT       PIC 9(7)V99.
       01 WS-TOTAL-INT     PIC 9(8)V99  VALUE 0.
       01 WS-TOTAL-PAID    PIC 9(8)V99  VALUE 0.
       01 WS-MONTH         PIC 99.
       01 WS-DETAIL.
          05 DL-MONTH      PIC Z9.
          05 FILLER        PIC X(3) VALUE SPACES.
          05 DL-PAYMENT    PIC Z,ZZZ,ZZ9.99.
          05 FILLER        PIC X(2) VALUE SPACES.
          05 DL-INTEREST   PIC Z,ZZZ,ZZ9.99.
          05 FILLER        PIC X(2) VALUE SPACES.
          05 DL-PRINCIPAL  PIC Z,ZZZ,ZZ9.99.
          05 FILLER        PIC X(2) VALUE SPACES.
          05 DL-BALANCE    PIC Z,ZZZ,ZZ9.99.
       01 WS-ED            PIC Z,ZZZ,ZZ9.99.
       PROCEDURE DIVISION.
       MAIN-PARA.
           COMPUTE WS-MRATE = WS-ANNUAL-RATE / 12 / 100
           COMPUTE WS-FACTOR = (1 + WS-MRATE) ** WS-MONTHS
           COMPUTE WS-EMI ROUNDED =
                   WS-PRINCIPAL * WS-MRATE * WS-FACTOR
                   / (WS-FACTOR - 1)

           MOVE WS-PRINCIPAL TO WS-ED
           DISPLAY "LOAN AMOUNT   : " WS-ED
           DISPLAY "ANNUAL RATE   : " WS-ANNUAL-RATE " PERCENT"
           DISPLAY "TENURE        : " WS-MONTHS " MONTHS"
           MOVE WS-EMI TO WS-ED
           DISPLAY "MONTHLY EMI   : " WS-ED
           DISPLAY " "
           DISPLAY "MTH     PAYMENT      INTEREST     PRINCIPAL"
                   "       BALANCE"

           MOVE WS-PRINCIPAL TO WS-BALANCE
           PERFORM VARYING WS-MONTH FROM 1 BY 1
                   UNTIL WS-MONTH > WS-MONTHS
              COMPUTE WS-INTEREST ROUNDED = WS-BALANCE * WS-MRATE
              COMPUTE WS-PRIN-PART = WS-EMI - WS-INTEREST
              IF WS-MONTH = WS-MONTHS
                 MOVE WS-BALANCE TO WS-PRIN-PART
              END-IF
              COMPUTE WS-PAYMENT = WS-PRIN-PART + WS-INTEREST
              SUBTRACT WS-PRIN-PART FROM WS-BALANCE
              ADD WS-INTEREST TO WS-TOTAL-INT
              ADD WS-PAYMENT TO WS-TOTAL-PAID

              MOVE WS-MONTH     TO DL-MONTH
              MOVE WS-PAYMENT   TO DL-PAYMENT
              MOVE WS-INTEREST  TO DL-INTEREST
              MOVE WS-PRIN-PART TO DL-PRINCIPAL
              MOVE WS-BALANCE   TO DL-BALANCE
              DISPLAY WS-DETAIL
           END-PERFORM

           DISPLAY " "
           MOVE WS-TOTAL-INT TO WS-ED
           DISPLAY "TOTAL INTEREST: " WS-ED
           MOVE WS-TOTAL-PAID TO WS-ED
           DISPLAY "TOTAL PAID    : " WS-ED
           STOP RUN.
