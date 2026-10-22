# HCL Mainframe - COBOL Practice Programs

Thirty COBOL programs that start with a one-line "Hello, World" (difficulty 1/10)
and build up step by step to a small payroll system (difficulty 5/10).
One program was added per day from 22 Oct 2026 to 20 Nov 2026.

All programs use fixed-format source (columns 8-72) and were compiled and run
with GnuCOBOL.

## Running a program

```bash
cobc -x -fixed -o hello cobol/01_hello_world.cbl
./hello
```

Programs 22 and 23 go together: run 22 first to create `EMPLOYEE.DAT`, then 23
to read it back. Programs 28, 29 and 30 create their own data files.

## Programs

| #  | File                              | Level | Topic |
|----|-----------------------------------|-------|-------|
| 01 | 01_hello_world.cbl                | 1/10  | Smallest program, DISPLAY |
| 02 | 02_data_types.cbl                 | 1/10  | PIC X / 9 / A / S / V |
| 03 | 03_move_statement.cbl             | 1/10  | MOVE, padding, truncation |
| 04 | 04_arithmetic_verbs.cbl           | 1/10  | ADD, SUBTRACT, MULTIPLY, DIVIDE |
| 05 | 05_compute_statement.cbl          | 1/10  | COMPUTE, ROUNDED, SIZE ERROR |
| 06 | 06_accept_input.cbl               | 1/10  | ACCEPT, DATE, TIME |
| 07 | 07_if_else.cbl                    | 2/10  | IF / ELSE |
| 08 | 08_nested_if_logical.cbl          | 2/10  | Nested IF, AND / OR / NOT |
| 09 | 09_condition_names_88.cbl         | 2/10  | Level-88 condition names |
| 10 | 10_evaluate_statement.cbl         | 2/10  | EVALUATE |
| 11 | 11_perform_paragraphs.cbl         | 2/10  | Paragraphs, PERFORM, THRU |
| 12 | 12_perform_times.cbl              | 3/10  | PERFORM n TIMES |
| 13 | 13_perform_until.cbl              | 3/10  | PERFORM UNTIL, TEST AFTER |
| 14 | 14_perform_varying.cbl            | 3/10  | PERFORM VARYING, nested loops |
| 15 | 15_group_items_corresponding.cbl  | 3/10  | Group items, MOVE CORRESPONDING, REDEFINES |
| 16 | 16_string_statement.cbl           | 3/10  | STRING |
| 17 | 17_unstring_statement.cbl         | 3/10  | UNSTRING |
| 18 | 18_inspect_statement.cbl          | 3/10  | INSPECT, reference modification |
| 19 | 19_tables_occurs.cbl              | 4/10  | OCCURS tables |
| 20 | 20_table_search.cbl               | 4/10  | SEARCH, SEARCH ALL |
| 21 | 21_two_dimensional_table.cbl      | 4/10  | Two-dimensional tables |
| 22 | 22_sequential_file_write.cbl      | 4/10  | Sequential file output |
| 23 | 23_sequential_file_read.cbl       | 4/10  | Sequential file input |
| 24 | 24_edited_pictures_report.cbl     | 4/10  | Numeric-edited pictures |
| 25 | 25_call_subprogram.cbl            | 4/10  | CALL, LINKAGE SECTION |
| 26 | 26_loan_emi_schedule.cbl          | 4/10  | EMI formula, repayment schedule |
| 27 | 27_student_grade_report.cbl       | 5/10  | Table processing, grading |
| 28 | 28_control_break_report.cbl       | 5/10  | Control break, subtotals |
| 29 | 29_sort_verb.cbl                  | 5/10  | SORT with multiple keys |
| 30 | 30_payroll_processing.cbl         | 5/10  | Payroll with file I/O and report |
