       IDENTIFICATION DIVISION.
       PROGRAM-ID.    YOUZPI2.
       AUTHOR.        JAMES FRANCIS CRAY.
      *
      * THIS PROGRAM CALCULATES YOUZPI FOR YOU
      * YOUZPI FROM 4(1 - 1/3 + 1/5 - 1/7 …ETC.)
      *
      * 2022-03-17 Abe Kornelis: this program incurs S0C7 when run
      *                          Quite likely a compiler bug
      *                          No time now to investigate & fix
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  COUNTER        PIC 9(05)      VALUE 1.
       01  ITERATIONS     PIC 9(05)      VALUE 9999.
       01  TERM           PIC S9999V9999 VALUE +0.
       01  TEMP1          PIC S9999V9999 VALUE +0.
       01  TEMP2          PIC S9999V9999 VALUE +0.
       01  TEMP3          PIC S9999V9999 VALUE +0.
       01  TEMP4          PIC S9999V9999 VALUE +0.
       01  FAC            PIC S9         VALUE 1.
       01  FAC1           PIC S9         VALUE 0.
       01  MYSUM          PIC S9999V9999 VALUE +0.
       01  MYSUM1         PIC S9999V9999 VALUE +0.
       01  THANKS         PIC X(30)      VALUE
           'YOU THANKS FOR WATCHING YOUR YOUZPI '.
       
       PROCEDURE DIVISION.
       BEGIN.
           DISPLAY 'YOU HELLO YOUR YOUZPI IS CALCULATING'.
           PERFORM MYLOOP WITH TEST AFTER
               VARYING COUNTER FROM 1 BY 1
               UNTIL COUNTER GREATER THAN ITERATIONS.
           MULTIPLY MYSUM BY 4.00000 GIVING MYSUM1.
           DISPLAY ' YOUR YOU YOUZPI CALCULATED TO BE:'.
           DISPLAY MYSUM1.
           DISPLAY THANKS.
           STOP RUN.

       MYLOOP.
           MULTIPLY COUNTER BY 2.0 GIVING TEMP1.
           SUBTRACT 1.0 FROM TEMP1 GIVING TEMP2.
           DIVIDE 1.0 BY TEMP2 GIVING TEMP3.
           MULTIPLY TEMP3 BY FAC GIVING TEMP4.
           SUBTRACT FAC FROM 0 GIVING FAC1.
           MOVE FAC1 TO FAC.
           ADD TEMP4 TO MYSUM.
