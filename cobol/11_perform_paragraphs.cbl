      *****************************************************************
      * PROGRAM  : PARA11                                             *
      * LEVEL    : 2/10                                               *
      * TOPIC    : Paragraphs, PERFORM, PERFORM ... THRU              *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PARA11.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-AMOUNT     PIC 9(5)V99.
       01 WS-TAX-RATE   PIC 99.
       01 WS-TAX        PIC 9(5)V99.
       01 WS-TOTAL      PIC 9(6)V99.
       01 WS-AMT-ED     PIC ZZ,ZZ9.99.
       01 WS-TAX-ED     PIC ZZ,ZZ9.99.
       01 WS-TOT-ED     PIC ZZZ,ZZ9.99.
       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY "PROGRAM STARTED"
           PERFORM INIT-PARA
           PERFORM PROCESS-PARA
           PERFORM DISPLAY-PARA
           PERFORM STEP-A THRU STEP-C
           DISPLAY "PROGRAM ENDED"
           STOP RUN.

       INIT-PARA.
           MOVE 2500.00 TO WS-AMOUNT
           MOVE 18 TO WS-TAX-RATE.

       PROCESS-PARA.
           COMPUTE WS-TAX = WS-AMOUNT * WS-TAX-RATE / 100
           COMPUTE WS-TOTAL = WS-AMOUNT + WS-TAX.

       DISPLAY-PARA.
           MOVE WS-AMOUNT TO WS-AMT-ED
           MOVE WS-TAX TO WS-TAX-ED
           MOVE WS-TOTAL TO WS-TOT-ED
           DISPLAY "AMOUNT : " WS-AMT-ED
           DISPLAY "TAX    : " WS-TAX-ED
           DISPLAY "TOTAL  : " WS-TOT-ED.

       STEP-A.
           DISPLAY "THRU: STEP A".

       STEP-B.
           DISPLAY "THRU: STEP B".

       STEP-C.
           DISPLAY "THRU: STEP C".
