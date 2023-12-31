       IDENTIFICATION DIVISION.
       PROGRAM-ID.    TESTWS1.
       AUTHOR.        DON HIGGINS.
       DATE-WRITTEN.  05/01/08.
      ***************************************************************
      * REGRESSION TEST WORKING STORAGE DATA FIELD GENERATION
      ***************************************************************
      * 10/16/08 ADD TEST FOR OCCURS AT GROUP LEVEL
      * 01/01/09 ADD CONTINUATION TEST                  
      ***************************************************************
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 GOOD    PIC S9(4) VALUE 0.
       77 FIELD   PIC X(30) VALUE SPACES.
       77 P1      PIC 9 VALUE 1.
       77 P2      PIC 9 VALUE 2.
       01 G1.
          05 PP3   PIC 99 VALUE 3.
          05 X1    PIC X  VALUE '1'.
          05 XX02  PIC XX VALUE '02'.
          05 G2-TABLE-DATA.
             10 PIC X VALUE 'A'.
             10 PIC X VALUE 'B'.
          05 G2-TABLE REDEFINES G2-TABLE-DATA OCCURS 2.
             10 G2-TABLE-ENTRY PIC X.
       01 G1-REDEF REDEFINES G1.
          05 PP3C  PIC XX.
          05 X3    PIC XXX.
          05 G2V   PIC XX.
       01 G1V PIC X(7) VALUE '03102AB'.
       77 TF COMP  PIC S9(9)  VALUE X'ff'.
       77 TH COMP  PIC S9(4)  VALUE X'ff'.
       77 TX       PIC X(1)   VALUE X'c1'.
       77 TF2 COMP  PIC S9(9)  VALUE X"ff".
       77 TH2 COMP  PIC S9(4)  VALUE X"ff".
       77 TX2       PIC X(1)   VALUE X"c1".
       77 TPN       PIC S9     VALUE +1.
       77 TMN       PIC S9     VALUE -1.
       77 TX1       PIC X(1).
       77 TX3       PIC X(3).
        77 SPLIT-LIT  PIC X(79)
                VALUE 'TESTBEC6 TEST 5:PRESS AID KEY TO HANDLE AEI0 ABEN
      -               'D IN LINKED PROGRAM BY PROGRAM'.
       77 CP1-SRT COMP-1           VALUE 1234567.
       77 CP2-LNG COMP-2           VALUE 123456789012345.
       77 HFP-SRT FLOAT-HEX-7      VALUE 1234567.
       77 HFP-LNG FLOAT-HEX-15     VALUE 123456789012345.
       77 HFP-EXT FLOAT-HEX-30 
                  VALUE 123456789012345678901234567890.
       77 BFP-SRT FLOAT-BINARY-7   VALUE 1234567.
       77 BFP-LNG FLOAT-BINARY-16  VALUE 123456789012345.
       77 BFP-EXT FLOAT-BINARY-34
                  VALUE 1234567890123456789012345678901234.
       77 DFP-SRT FLOAT-DECIMAL-7  VALUE 1234567.
       77 DFP-LNG FLOAT-DECIMAL-16 VALUE 1234567890123456.
       77 DFP-EXT FLOAT-DECIMAL-34
                  VALUE 1234567890123456789012345678901234.
       77 FLT-SRT FLOAT-SHORT    VALUE 1234567.
       77 FLT-LNG FLOAT-LONG     VALUE 1234567890123456.
       77 FLT-EXT FLOAT-EXTENDED 
                  VALUE 1234567890123456789012345678901234.
       77 HW1     COMP PIC S9(4)   VALUE 1234.
       77 FW1     COMP PIC S9(9)   VALUE 123456789.
       77 GW1     COMP PIC S9(18)  VALUE 123456789012345678.
       77 QW1     COMP PIC S9(39) 
                  VALUE 123456789012345678901234567890123456789.
       77 PD1     COMP-3 PIC S9(31) 
                  VALUE 1234567890123456789012345678901.        
       77 ZD1     PIC S9(31) 
                  VALUE 1234567890123456789012345678901.
       PROCEDURE DIVISION.
       MAINLINE.
           DISPLAY 'TESTWS1 STARTING'
           IF P1 NOT = 1   MOVE 'P1' TO FIELD GO TO ABORT.
           IF PP3C NOT = '03' MOVE 'P1C' TO FIELD GO TO ABORT.
           IF X3 NOT = '102' MOVE 'X3' TO FIELD GO TO ABORT.
           IF P2 NOT = 2   MOVE 'P2' TO FIELD GO TO ABORT.
           IF G1 NOT = G1V MOVE 'G1' TO FIELD GO TO ABORT.
           IF G1-REDEF NOT = G1V MOVE 'G1-REDEF' TO FIELD GO TO ABORT.
           IF G2V      NOT = 'AB' MOVE 'G2-TABLE' TO FIELD GO TO ABORT.
           DISPLAY 'TF =' TF.
           IF TF NOT = 255 MOVE 'TF-HEX' TO FIELD GO TO ABORT.
           DISPLAY 'TH =' TH.
           IF TH NOT = 255 MOVE 'TH-HEX' TO FIELD GO TO ABORT.
           DISPLAY 'TX =' TX.
           IF TX NOT = 'A' MOVE 'TX-HEX' TO FIELD GO TO ABORT.
           DISPLAY 'TF =' TF.
           DISPLAY 'TH =' TH.
           DISPLAY 'TX =' TX.
           DISPLAY 'TF2=' TF2.
           DISPLAY 'TH2=' TH2.
           DISPLAY 'TX2=' TX2.
           IF TPN NOT = 1  MOVE 'TPN' TO FIELD GO TO ABORT.
           DISPLAY 'TX2=' TX2.
           IF TMN NOT = -1 MOVE 'TMN' TO FIELD GO TO ABORT.
           MOVE X'C1' TO TX1
           IF TX1 NOT = 'A' MOVE 'TX1' TO FIELD GO TO ABORT. 
           MOVE X'C1C2C3' TO TX3
           IF TX3 NOT = 'ABC' MOVE 'TX3' TO FIELD GO TO ABORT. 
           DISPLAY 'SPLIT-LIT=' SPLIT-LIT
           IF SPLIT-LIT NOT = 
                      'TESTBEC6 TEST 5:PRESS AID KEY TO HANDLE AEI0 ABEN
      -               'D IN LINKED PROGRAM BY PROGRAM' 
               MOVE 'SPLIT-LIT' TO FIELD GO TO ABORT.
           DISPLAY 'CP1-SRT=' CP1-SRT
           DISPLAY 'CP2-LNG=' CP2-LNG
           DISPLAY 'HFP-SRT=' HFP-SRT
           DISPLAY 'HFP-LNG=' HFP-LNG
           DISPLAY 'HFP-EXT=' HFP-EXT
           DISPLAY 'BFP-SRT=' BFP-SRT
           DISPLAY 'BFP-LNG=' BFP-LNG
           DISPLAY 'BFP-EXT=' BFP-EXT
           DISPLAY 'DFP-SRT=' DFP-SRT
           DISPLAY 'DFP-LNG=' DFP-LNG
           DISPLAY 'DFP-EXT=' DFP-EXT
           DISPLAY 'FLT-SRT=' FLT-SRT
           DISPLAY 'FLT-LNG=' FLT-LNG
           DISPLAY 'FLT-EXT=' FLT-EXT
           DISPLAY 'HW1=' HW1
           DISPLAY 'FW1=' FW1
           DISPLAY 'GW1=' GW1
           DISPLAY 'QW1=' QW1
           DISPLAY 'PD1=' PD1
           DISPLAY 'ZD1=' ZD1
           IF CP1-SRT = 1234567
              PERFORM GOOD ELSE PERFORM BAD.
           IF CP2-LNG = 123456789012345
              PERFORM GOOD ELSE PERFORM BAD.
           IF HFP-SRT = 1234567
              PERFORM GOOD ELSE PERFORM BAD.
           IF HFP-LNG = 123456789012345
              PERFORM GOOD ELSE PERFORM BAD.
           IF HFP-EXT = 123456789012345678901234567890
              PERFORM GOOD ELSE PERFORM BAD.
           IF BFP-SRT = 1234567
              PERFORM GOOD ELSE PERFORM BAD.
           IF BFP-LNG = 123456789012345
              PERFORM GOOD ELSE PERFORM BAD.
           IF BFP-EXT = 1234567890123456789012345678901234
              PERFORM GOOD ELSE PERFORM BAD.
           IF DFP-SRT = 1234567
              PERFORM GOOD ELSE PERFORM BAD.
           IF DFP-LNG = 1234567890123456
              PERFORM GOOD ELSE PERFORM BAD.
           IF DFP-EXT = 1234567890123456789012345678901234
              PERFORM GOOD ELSE PERFORM BAD.
           IF FLT-SRT = 1234567
              PERFORM GOOD ELSE PERFORM BAD.
           IF FLT-LNG = 1234567890123456
              PERFORM GOOD ELSE PERFORM BAD.
           IF FLT-EXT = 1234567890123456789012345678901234
              PERFORM GOOD ELSE PERFORM BAD.
           IF HW1     = 1234
              PERFORM GOOD ELSE PERFORM BAD.
           IF FW1     = 123456789
              PERFORM GOOD ELSE PERFORM BAD.
           IF GW1     = 123456789012345678
              PERFORM GOOD ELSE PERFORM BAD.
           IF QW1     = 123456789012345678901234567890123456789
              PERFORM GOOD ELSE PERFORM BAD.
           IF PD1     = 1234567890123456789012345678901
              PERFORM GOOD ELSE PERFORM BAD.
           IF PD1     = 1234567890123456789012345678901
              PERFORM GOOD ELSE PERFORM BAD.
           DISPLAY 'TESTWS1 GOOD TESTS = ' GOOD
           STOP RUN.        
       ABORT.
           DISPLAY 'TESTWS1 ERROR ON ' FIELD
           MOVE 16 TO RETURN-CODE
           STOP RUN.
       GOOD.
           ADD 1 TO GOOD.
       BAD.
           MOVE 16 TO RETURN-CODE 
           STOP RUN.
