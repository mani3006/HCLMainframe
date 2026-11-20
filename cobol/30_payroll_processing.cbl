      *****************************************************************
      * PROGRAM  : PAYR30                                             *
      * LEVEL    : 5/10                                               *
      * TOPIC    : Mini payroll - file in, report file out, tax       *
      *            slabs, totals, edited report lines, paragraphs     *
      * NOTE     : builds PAYIN.DAT, writes PAYROLL.RPT               *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PAYR30.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PAY-IN  ASSIGN TO "PAYIN.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PAY-RPT ASSIGN TO "PAYROLL.RPT"
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD PAY-IN.
       01 PAY-IN-REC.
          05 PI-ID          PIC 9(4).
          05 PI-NAME        PIC X(12).
          05 PI-BASIC       PIC 9(6).
       FD PAY-RPT.
       01 RPT-LINE          PIC X(70).
       WORKING-STORAGE SECTION.
       01 WS-SRC-DATA.
          05 FILLER PIC 9(4)  VALUE 2001.
          05 FILLER PIC X(12) VALUE "ARUN KUMAR".
          05 FILLER PIC 9(6)  VALUE 25000.
          05 FILLER PIC 9(4)  VALUE 2002.
          05 FILLER PIC X(12) VALUE "BALA MURUGAN".
          05 FILLER PIC 9(6)  VALUE 32000.
          05 FILLER PIC 9(4)  VALUE 2003.
          05 FILLER PIC X(12) VALUE "CHITRA DEVI".
          05 FILLER PIC 9(6)  VALUE 41000.
          05 FILLER PIC 9(4)  VALUE 2004.
          05 FILLER PIC X(12) VALUE "DINESH RAJ".
          05 FILLER PIC 9(6)  VALUE 18500.
          05 FILLER PIC 9(4)  VALUE 2005.
          05 FILLER PIC X(12) VALUE "EZHIL ARASI".
          05 FILLER PIC 9(6)  VALUE 60000.
          05 FILLER PIC 9(4)  VALUE 2006.
          05 FILLER PIC X(12) VALUE "FAROOK ALI".
          05 FILLER PIC 9(6)  VALUE 28000.
       01 WS-SRC-TABLE REDEFINES WS-SRC-DATA.
          05 WS-SRC OCCURS 6 TIMES.
             10 WS-SRC-ID      PIC 9(4).
             10 WS-SRC-NAME    PIC X(12).
             10 WS-SRC-BASIC   PIC 9(6).
       01 WS-I              PIC 9.
       01 WS-EOF            PIC X VALUE "N".
          88 END-OF-FILE    VALUE "Y".
       01 WS-RATES.
          05 WS-HRA-PCT     PIC 99 VALUE 20.
          05 WS-DA-PCT      PIC 99 VALUE 10.
          05 WS-PF-PCT      PIC 99 VALUE 12.
       01 WS-CALC.
          05 WS-HRA         PIC 9(6)V99.
          05 WS-DA          PIC 9(6)V99.
          05 WS-GROSS       PIC 9(7)V99.
          05 WS-PF          PIC 9(6)V99.
          05 WS-TAX         PIC 9(6)V99.
          05 WS-NET         PIC 9(7)V99.
       01 WS-TOTALS.
          05 WS-TOT-GROSS   PIC 9(8)V99 VALUE 0.
          05 WS-TOT-PF      PIC 9(8)V99 VALUE 0.
          05 WS-TOT-TAX     PIC 9(8)V99 VALUE 0.
          05 WS-TOT-NET     PIC 9(8)V99 VALUE 0.
          05 WS-EMP-COUNT   PIC 99      VALUE 0.
       01 WS-HIGH-NET       PIC 9(7)V99 VALUE 0.
       01 WS-HIGH-NAME      PIC X(12).
       01 WS-HEADING        PIC X(70) VALUE
          "ID    NAME            GROSS       PF       TAX        NET".
       01 WS-DASHES         PIC X(70) VALUE ALL "-".
       01 WS-DETAIL.
          05 WD-ID          PIC 9(4).
          05 FILLER         PIC XX VALUE SPACES.
          05 WD-NAME        PIC X(12).
          05 FILLER         PIC X  VALUE SPACE.
          05 WD-GROSS       PIC ZZ,ZZ9.99.
          05 FILLER         PIC X  VALUE SPACE.
          05 WD-PF          PIC Z,ZZ9.99.
          05 FILLER         PIC X  VALUE SPACE.
          05 WD-TAX         PIC Z,ZZ9.99.
          05 FILLER         PIC X  VALUE SPACE.
          05 WD-NET         PIC ZZ,ZZ9.99.
       01 WS-TOTAL-LINE.
          05 FILLER         PIC X(19) VALUE "TOTALS".
          05 WT-GROSS       PIC ZZZ,ZZ9.99.
          05 FILLER         PIC X VALUE SPACE.
          05 WT-PF          PIC ZZ,ZZ9.99.
          05 FILLER         PIC X VALUE SPACE.
          05 WT-TAX         PIC ZZ,ZZ9.99.
          05 FILLER         PIC X VALUE SPACE.
          05 WT-NET         PIC ZZZ,ZZ9.99.
       01 WS-NET-ED         PIC ZZ,ZZ9.99.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM BUILD-INPUT-FILE
           OPEN INPUT PAY-IN
           OPEN OUTPUT PAY-RPT
           PERFORM PRINT-HEADINGS
           PERFORM UNTIL END-OF-FILE
              READ PAY-IN
                 AT END SET END-OF-FILE TO TRUE
                 NOT AT END PERFORM PROCESS-EMPLOYEE
              END-READ
           END-PERFORM
           PERFORM PRINT-TOTALS
           CLOSE PAY-IN PAY-RPT
           DISPLAY " "
           DISPLAY "REPORT ALSO SAVED TO PAYROLL.RPT"
           STOP RUN.

       BUILD-INPUT-FILE.
           OPEN OUTPUT PAY-IN
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 6
              MOVE WS-SRC-ID(WS-I)    TO PI-ID
              MOVE WS-SRC-NAME(WS-I)  TO PI-NAME
              MOVE WS-SRC-BASIC(WS-I) TO PI-BASIC
              WRITE PAY-IN-REC
           END-PERFORM
           CLOSE PAY-IN.

       PROCESS-EMPLOYEE.
           COMPUTE WS-HRA = PI-BASIC * WS-HRA-PCT / 100
           COMPUTE WS-DA  = PI-BASIC * WS-DA-PCT  / 100
           COMPUTE WS-GROSS = PI-BASIC + WS-HRA + WS-DA
           COMPUTE WS-PF  = PI-BASIC * WS-PF-PCT  / 100
           PERFORM COMPUTE-TAX
           COMPUTE WS-NET = WS-GROSS - WS-PF - WS-TAX

           ADD 1 TO WS-EMP-COUNT
           ADD WS-GROSS TO WS-TOT-GROSS
           ADD WS-PF    TO WS-TOT-PF
           ADD WS-TAX   TO WS-TOT-TAX
           ADD WS-NET   TO WS-TOT-NET
           IF WS-NET > WS-HIGH-NET
              MOVE WS-NET TO WS-HIGH-NET
              MOVE PI-NAME TO WS-HIGH-NAME
           END-IF

           MOVE PI-ID    TO WD-ID
           MOVE PI-NAME  TO WD-NAME
           MOVE WS-GROSS TO WD-GROSS
           MOVE WS-PF    TO WD-PF
           MOVE WS-TAX   TO WD-TAX
           MOVE WS-NET   TO WD-NET
           MOVE WS-DETAIL TO RPT-LINE
           PERFORM WRITE-LINE.

       COMPUTE-TAX.
           EVALUATE TRUE
              WHEN WS-GROSS <= 30000
                 MOVE 0 TO WS-TAX
              WHEN WS-GROSS <= 50000
                 COMPUTE WS-TAX ROUNDED = WS-GROSS * 5 / 100
              WHEN OTHER
                 COMPUTE WS-TAX ROUNDED = WS-GROSS * 10 / 100
           END-EVALUATE.

       PRINT-HEADINGS.
           MOVE "MONTHLY PAYROLL REPORT" TO RPT-LINE
           PERFORM WRITE-LINE
           MOVE WS-DASHES TO RPT-LINE
           PERFORM WRITE-LINE
           MOVE WS-HEADING TO RPT-LINE
           PERFORM WRITE-LINE
           MOVE WS-DASHES TO RPT-LINE
           PERFORM WRITE-LINE.

       PRINT-TOTALS.
           MOVE WS-DASHES TO RPT-LINE
           PERFORM WRITE-LINE
           MOVE WS-TOT-GROSS TO WT-GROSS
           MOVE WS-TOT-PF    TO WT-PF
           MOVE WS-TOT-TAX   TO WT-TAX
           MOVE WS-TOT-NET   TO WT-NET
           MOVE WS-TOTAL-LINE TO RPT-LINE
           PERFORM WRITE-LINE
           MOVE WS-HIGH-NET TO WS-NET-ED
           STRING "EMPLOYEES: " WS-EMP-COUNT
                  "   HIGHEST NET PAY: " WS-HIGH-NAME " " WS-NET-ED
                  DELIMITED BY SIZE INTO RPT-LINE
           END-STRING
           PERFORM WRITE-LINE.

       WRITE-LINE.
           WRITE RPT-LINE
           DISPLAY RPT-LINE
           MOVE SPACES TO RPT-LINE.
