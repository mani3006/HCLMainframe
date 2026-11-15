      *****************************************************************
      * PROGRAM  : CALL25 (calls CALCSUB)                             *
      * LEVEL    : 4/10                                               *
      * TOPIC    : CALL ... USING, LINKAGE SECTION, nested program    *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALL25.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A          PIC 9(4)  VALUE 120.
       01 WS-B          PIC 9(4)  VALUE 45.
       01 WS-OP         PIC X.
       01 WS-OPS        PIC X(5)  VALUE "+-*/%".
       01 WS-RESULT     PIC S9(8).
       01 WS-RC         PIC 9.
       01 WS-RES-ED     PIC -ZZ,ZZZ,ZZ9.
       01 WS-I          PIC 9.
       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 5
              MOVE WS-OPS(WS-I:1) TO WS-OP
              CALL "CALCSUB" USING WS-A WS-B WS-OP WS-RESULT WS-RC
              IF WS-RC = 0
                 MOVE WS-RESULT TO WS-RES-ED
                 DISPLAY WS-A " " WS-OP " " WS-B " = " WS-RES-ED
              ELSE
                 DISPLAY WS-A " " WS-OP " " WS-B
                         " -> UNSUPPORTED OPERATOR"
              END-IF
           END-PERFORM

           MOVE 0 TO WS-B
           MOVE "/" TO WS-OP
           CALL "CALCSUB" USING WS-A WS-B WS-OP WS-RESULT WS-RC
           IF WS-RC NOT = 0
              DISPLAY "DIVIDE BY ZERO WAS REJECTED BY THE SUBPROGRAM"
           END-IF
           STOP RUN.

      *---------------------------------------------------------------*
      * Subprogram: performs one arithmetic operation.                *
      * RC = 0 success, 1 bad operator, 2 divide by zero.             *
      *---------------------------------------------------------------*
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCSUB.
       DATA DIVISION.
       LINKAGE SECTION.
       01 LK-A          PIC 9(4).
       01 LK-B          PIC 9(4).
       01 LK-OP         PIC X.
       01 LK-RESULT     PIC S9(8).
       01 LK-RC         PIC 9.
       PROCEDURE DIVISION USING LK-A LK-B LK-OP LK-RESULT LK-RC.
       SUB-MAIN.
           MOVE 0 TO LK-RC
           MOVE 0 TO LK-RESULT
           EVALUATE LK-OP
              WHEN "+"
                 COMPUTE LK-RESULT = LK-A + LK-B
              WHEN "-"
                 COMPUTE LK-RESULT = LK-A - LK-B
              WHEN "*"
                 COMPUTE LK-RESULT = LK-A * LK-B
              WHEN "/"
                 IF LK-B = 0
                    MOVE 2 TO LK-RC
                 ELSE
                    COMPUTE LK-RESULT = LK-A / LK-B
                 END-IF
              WHEN OTHER
                 MOVE 1 TO LK-RC
           END-EVALUATE
           GOBACK.
       END PROGRAM CALCSUB.
       END PROGRAM CALL25.
