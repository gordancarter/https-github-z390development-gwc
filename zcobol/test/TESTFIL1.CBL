       IDENTIFICATION DIVISION.
       PROGRAM-ID.  TESTFIL1.
      * THIS FAILED WITHOUT RPI 1048 FIX TO ZCOBOL\WORKING_STORAGE.MAC
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT IN-FILE
               ASSIGN TO 'zcobol\test\TESTFIL1.IN'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUT-FILE
               ASSIGN TO 'zcobol\test\TESTFIL1.OUT'
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD  IN-FILE
           DATA RECORD IS IN-RECORD.
       01  IN-RECORD PIC X(80).
       FD  OUT-FILE
           DATA RECORD IS OUT-RECORD.
       01  OUT-RECORD PIC X(80).
       WORKING-STORAGE SECTION.
       01  WS-LINE PIC X(80).
       01  END-OF-FILE-FLAG PIC X.
       01  HELP-WHY.
           02  IS-IT-LIKE-THIS PIC X(10).
       77  COUNT COMP-3 PIC S9(4) VALUE 0.
       PROCEDURE DIVISION.
       MAINLINE.
           DISPLAY 'TESTFIL1 STARTED'
           PERFORM INITIALIZATION-ROUTINE.
           PERFORM THE-LOOP
                   UNTIL END-OF-FILE-FLAG = 'Y'.
           PERFORM EOJ-ROUTINE.
           DISPLAY 'TESTFIL1 ENDED OK'
           STOP RUN.
       INITIALIZATION-ROUTINE.
           OPEN INPUT IN-FILE.
           OPEN OUTPUT OUT-FILE.
           READ IN-FILE INTO OUT-RECORD
                AT END MOVE 'Y' TO END-OF-FILE-FLAG.
       THE-LOOP.
           WRITE OUT-RECORD.
           ADD 1 TO COUNT
           READ IN-FILE INTO OUT-RECORD
                AT END MOVE 'Y' TO END-OF-FILE-FLAG.
       EOJ-ROUTINE.
           CLOSE IN-FILE.
           CLOSE OUT-FILE.
           DISPLAY 'RECORDS COPIED = ' COUNT.
           STOP RUN.
