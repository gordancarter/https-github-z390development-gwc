       IDENTIFICATION DIVISION.
       PROGRAM-ID.    TESTDIV1.
       AUTHOR.        DON HIGGINS.
       DATE-WRITTEN.  04/25/12.
      * TEST DIVIDE WITH SCALING FOR IMPLIED DECIMAL                              
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 EH1 FLOAT-HEX-7       VALUE 6.0.
       77 DH1 FLOAT-HEX-15      VALUE 6.0.
       77 LH1 FLOAT-HEX-30      VALUE 6.0.
       77 EB1 FLOAT-BINARY-7    VALUE 6.0.
       77 DB1 FLOAT-BINARY-16   VALUE 6.0.
       77 LB1 FLOAT-BINARY-34   VALUE 6.0.
       77 ED1 FLOAT-DECIMAL-7   VALUE 6.0.
       77 DD1 FLOAT-DECIMAL-16  VALUE 6.0.
       77 LD1 FLOAT-DECIMAL-34  VALUE 6.0.
       77 H1      COMP PIC S9(3)V9    VALUE 6.0.
       77 F1      COMP PIC S9(8)V9    VALUE 6.0.
       77 G1      COMP PIC S9(17)V9   VALUE 6.0.
       77 Q1      COMP PIC S9(38)V9   VALUE 6.0.
       77 P1      COMP-3 PIC S9(30)V9 VALUE 6.0.
       77 Z1             PIC S9(30)V9 VALUE 6.0.
       77 EH2 FLOAT-HEX-7       VALUE 2.00.
       77 DH2 FLOAT-HEX-15      VALUE 2.00.
       77 LH2 FLOAT-HEX-30      VALUE 2.00.
       77 EB2 FLOAT-BINARY-7    VALUE 2.00.
       77 DB2 FLOAT-BINARY-16   VALUE 2.00.
       77 LB2 FLOAT-BINARY-34   VALUE 2.00.
       77 ED2 FLOAT-DECIMAL-7   VALUE 2.00.
       77 DD2 FLOAT-DECIMAL-16  VALUE 2.00.
       77 LD2 FLOAT-DECIMAL-34  VALUE 2.00.
       77 H2      COMP PIC S9(2)V99         VALUE 2.00.
       77 F2      COMP PIC S9(6)V999        VALUE 2.00.
       77 G2      COMP PIC S9(14)V9999      VALUE 2.00.
       77 Q2      COMP PIC S9(34)V99999     VALUE 2.00.
       77 P2      COMP-3 PIC S9(25)V999999  VALUE 2.00.
       77 Z2             PIC S9(24)V9999999 VALUE 2.00.
       77 EH3 FLOAT-HEX-7       VALUE 3.00.
       77 DH3 FLOAT-HEX-15      VALUE 3.00.
       77 LH3 FLOAT-HEX-30      VALUE 3.00.
       77 EB3 FLOAT-BINARY-7    VALUE 3.00.
       77 DB3 FLOAT-BINARY-16   VALUE 3.00.
       77 LB3 FLOAT-BINARY-34   VALUE 3.00.
       77 ED3 FLOAT-DECIMAL-7   VALUE 3.00.
       77 DD3 FLOAT-DECIMAL-16  VALUE 3.00.
       77 LD3 FLOAT-DECIMAL-34  VALUE 3.00.
       77 H3      COMP PIC S9(2)V99         VALUE 3.00.
       77 F3      COMP PIC S9(6)V999        VALUE 3.00.
       77 G3      COMP PIC S9(14)V9999      VALUE 3.00.
       77 Q3      COMP PIC S9(34)V99999     VALUE 3.00.
       77 P3      COMP-3 PIC S9(25)V999999  VALUE 3.00.
       77 Z3             PIC S9(24)V9999999 VALUE 3.00.
       77 G    COMP-3 PIC 9(4)   VALUE 0.
       77 B     COMP-3 PIC 9(4)   VALUE 0.
       PROCEDURE DIVISION.
       MAINLINE.
           DISPLAY 'TESTDIV1 TEST SCALED DIVIDE'
           DIVIDE EH2 INTO EH1 IF EH3 = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE EH2 INTO DH1 IF EH3 = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE EH2 INTO LH1 IF EH3 = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE EH2 INTO EB1 IF EH3 = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE EH2 INTO DB1 IF EH3 = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE EH2 INTO LB1 IF EH3 = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE EH2 INTO ED1 IF EH3 = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE EH2 INTO DD1 IF EH3 = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE EH2 INTO LD1 IF EH3 = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE EH2 INTO F1  IF EH3 = F1  PERFORM G ELSE PERFORM B.
           DIVIDE EH2 INTO G1  IF EH3 = G1  PERFORM G ELSE PERFORM B.
           DIVIDE EH2 INTO H1  IF EH3 = H1  PERFORM G ELSE PERFORM B.
           DIVIDE EH2 INTO P1  IF EH3 = P1  PERFORM G ELSE PERFORM B.
           DIVIDE EH2 INTO Q1  IF EH3 = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE EH2 INTO Z1  IF EH3 = Z1  PERFORM G ELSE PERFORM B.          
           PERFORM INIT.
           DIVIDE DH2 INTO EH1 IF DH3 = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE DH2 INTO DH1 IF DH3 = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE DH2 INTO LH1 IF DH3 = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE DH2 INTO EB1 IF DH3 = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE DH2 INTO DB1 IF DH3 = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE DH2 INTO LB1 IF DH3 = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE DH2 INTO ED1 IF DH3 = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE DH2 INTO DD1 IF DH3 = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE DH2 INTO LD1 IF DH3 = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE DH2 INTO F1  IF DH3 = F1  PERFORM G ELSE PERFORM B.
           DIVIDE DH2 INTO G1  IF DH3 = G1  PERFORM G ELSE PERFORM B.
           DIVIDE DH2 INTO H1  IF DH3 = H1  PERFORM G ELSE PERFORM B.
           DIVIDE DH2 INTO P1  IF DH3 = P1  PERFORM G ELSE PERFORM B.
           DIVIDE DH2 INTO Q1  IF DH3 = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE DH2 INTO Z1  IF DH3 = Z1  PERFORM G ELSE PERFORM B.          
           PERFORM INIT.
           DIVIDE LH2 INTO EH1 IF LH3 = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE LH2 INTO DH1 IF LH3 = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE LH2 INTO LH1 IF LH3 = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE LH2 INTO EB1 IF LH3 = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE LH2 INTO DB1 IF LH3 = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE LH2 INTO LB1 IF LH3 = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE LH2 INTO ED1 IF LH3 = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE LH2 INTO DD1 IF LH3 = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE LH2 INTO LD1 IF LH3 = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE LH2 INTO F1  IF LH3 = F1  PERFORM G ELSE PERFORM B.
           DIVIDE LH2 INTO G1  IF LH3 = G1  PERFORM G ELSE PERFORM B.
           DIVIDE LH2 INTO H1  IF LH3 = H1  PERFORM G ELSE PERFORM B.
           DIVIDE LH2 INTO P1  IF LH3 = P1  PERFORM G ELSE PERFORM B.
           DIVIDE LH2 INTO Q1  IF LH3 = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE LH2 INTO Z1  IF LH3 = Z1  PERFORM G ELSE PERFORM B.          
           PERFORM INIT.
           DIVIDE EB2 INTO EH1 IF EB3 = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE EB2 INTO DH1 IF EB3 = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE EB2 INTO LH1 IF EB3 = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE EB2 INTO EB1 IF EB3 = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE EB2 INTO DB1 IF EB3 = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE EB2 INTO LB1 IF EB3 = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE EB2 INTO ED1 IF EB3 = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE EB2 INTO DD1 IF EB3 = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE EB2 INTO LD1 IF EB3 = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE EB2 INTO F1  IF EB3 = F1  PERFORM G ELSE PERFORM B.
           DIVIDE EB2 INTO G1  IF EB3 = G1  PERFORM G ELSE PERFORM B.
           DIVIDE EB2 INTO H1  IF EB3 = H1  PERFORM G ELSE PERFORM B.
           DIVIDE EB2 INTO P1  IF EB3 = P1  PERFORM G ELSE PERFORM B.
           DIVIDE EB2 INTO Q1  IF EB3 = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE EB2 INTO Z1  IF EB3 = Z1  PERFORM G ELSE PERFORM B.          
           PERFORM INIT.
           DIVIDE DB2 INTO EH1 IF DB3 = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE DB2 INTO DH1 IF DB3 = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE DB2 INTO LH1 IF DB3 = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE DB2 INTO EB1 IF DB3 = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE DB2 INTO DB1 IF DB3 = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE DB2 INTO LB1 IF DB3 = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE DB2 INTO ED1 IF DB3 = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE DB2 INTO DD1 IF DB3 = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE DB2 INTO LD1 IF DB3 = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE DB2 INTO F1  IF DB3 = F1  PERFORM G ELSE PERFORM B.
           DIVIDE DB2 INTO G1  IF DB3 = G1  PERFORM G ELSE PERFORM B.
           DIVIDE DB2 INTO H1  IF DB3 = H1  PERFORM G ELSE PERFORM B.
           DIVIDE DB2 INTO P1  IF DB3 = P1  PERFORM G ELSE PERFORM B.
           DIVIDE DB2 INTO Q1  IF DB3 = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE DB2 INTO Z1  IF DB3 = Z1  PERFORM G ELSE PERFORM B.          
           PERFORM INIT.
           DIVIDE LB2 INTO EH1 IF LB3 = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE LB2 INTO DH1 IF LB3 = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE LB2 INTO LH1 IF LB3 = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE LB2 INTO EB1 IF LB3 = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE LB2 INTO DB1 IF LB3 = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE LB2 INTO LB1 IF LB3 = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE LB2 INTO ED1 IF LB3 = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE LB2 INTO DD1 IF LB3 = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE LB2 INTO LD1 IF LB3 = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE LB2 INTO F1  IF LB3 = F1  PERFORM G ELSE PERFORM B.
           DIVIDE LB2 INTO G1  IF LB3 = G1  PERFORM G ELSE PERFORM B.
           DIVIDE LB2 INTO H1  IF LB3 = H1  PERFORM G ELSE PERFORM B.
           DIVIDE LB2 INTO P1  IF LB3 = P1  PERFORM G ELSE PERFORM B.
           DIVIDE LB2 INTO Q1  IF LB3 = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE LB2 INTO Z1  IF LB3 = Z1  PERFORM G ELSE PERFORM B.          
           PERFORM INIT.       
           DIVIDE ED2 INTO EH1 IF ED3 = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE ED2 INTO DH1 IF ED3 = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE ED2 INTO LH1 IF ED3 = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE ED2 INTO EB1 IF ED3 = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE ED2 INTO DB1 IF ED3 = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE ED2 INTO LB1 IF ED3 = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE ED2 INTO ED1 IF ED3 = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE ED2 INTO DD1 IF ED3 = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE ED2 INTO LD1 IF ED3 = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE ED2 INTO F1  IF ED3 = F1  PERFORM G ELSE PERFORM B.
           DIVIDE ED2 INTO G1  IF ED3 = G1  PERFORM G ELSE PERFORM B.
           DIVIDE ED2 INTO H1  IF ED3 = H1  PERFORM G ELSE PERFORM B.
           DIVIDE ED2 INTO P1  IF ED3 = P1  PERFORM G ELSE PERFORM B.
           DIVIDE ED2 INTO Q1  IF ED3 = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE ED2 INTO Z1  IF ED3 = Z1  PERFORM G ELSE PERFORM B.          
           PERFORM INIT.
           DIVIDE DD2 INTO EH1 IF DD3 = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE DD2 INTO DH1 IF DD3 = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE DD2 INTO LH1 IF DD3 = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE DD2 INTO EB1 IF DD3 = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE DD2 INTO DB1 IF DD3 = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE DD2 INTO LB1 IF DD3 = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE DD2 INTO ED1 IF DD3 = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE DD2 INTO DD1 IF DD3 = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE DD2 INTO LD1 IF DD3 = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE DD2 INTO F1  IF DD3 = F1  PERFORM G ELSE PERFORM B.
           DIVIDE DD2 INTO G1  IF DD3 = G1  PERFORM G ELSE PERFORM B.
           DIVIDE DD2 INTO H1  IF DD3 = H1  PERFORM G ELSE PERFORM B.
           DIVIDE DD2 INTO P1  IF DD3 = P1  PERFORM G ELSE PERFORM B.
           DIVIDE DD2 INTO Q1  IF DD3 = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE DD2 INTO Z1  IF DD3 = Z1  PERFORM G ELSE PERFORM B.          
           PERFORM INIT.
           DIVIDE LD2 INTO EH1 IF LD3 = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE LD2 INTO DH1 IF LD3 = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE LD2 INTO LH1 IF LD3 = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE LD2 INTO EB1 IF LD3 = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE LD2 INTO DB1 IF LD3 = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE LD2 INTO LB1 IF LD3 = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE LD2 INTO ED1 IF LD3 = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE LD2 INTO DD1 IF LD3 = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE LD2 INTO LD1 IF LD3 = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE LD2 INTO F1  IF LD3 = F1  PERFORM G ELSE PERFORM B.
           DIVIDE LD2 INTO G1  IF LD3 = G1  PERFORM G ELSE PERFORM B.
           DIVIDE LD2 INTO H1  IF LD3 = H1  PERFORM G ELSE PERFORM B.
           DIVIDE LD2 INTO P1  IF LD3 = P1  PERFORM G ELSE PERFORM B.
           DIVIDE LD2 INTO Q1  IF LD3 = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE LD2 INTO Z1  IF LD3 = Z1  PERFORM G ELSE PERFORM B.          
           PERFORM INIT.
           DIVIDE F2  INTO EH1 IF F3  = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE F2  INTO DH1 IF F3  = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE F2  INTO LH1 IF F3  = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE F2  INTO EB1 IF F3  = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE F2  INTO DB1 IF F3  = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE F2  INTO LB1 IF F3  = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE F2  INTO ED1 IF F3  = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE F2  INTO DD1 IF EH3 = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE F2  INTO LD1 IF EH3 = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE F2  INTO F1  IF F3  = F1  PERFORM G ELSE PERFORM B.
           DIVIDE F2  INTO G1  IF F3  = G1  PERFORM G ELSE PERFORM B.
           DIVIDE F2  INTO H1  IF F3  = H1  PERFORM G ELSE PERFORM B.
           DIVIDE F2  INTO P1  IF F3  = P1  PERFORM G ELSE PERFORM B.
           DIVIDE F2  INTO Q1  IF F3  = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE F2  INTO Z1  IF F3  = Z1  PERFORM G ELSE PERFORM B.          
           PERFORM INIT.
           DIVIDE G2  INTO EH1 IF G3  = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE G2  INTO DH1 IF G3  = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE G2  INTO LH1 IF G3  = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE G2  INTO EB1 IF G3  = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE G2  INTO DB1 IF G3  = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE G2  INTO LB1 IF G3  = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE G2  INTO ED1 IF G3  = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE G2  INTO DD1 IF G3  = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE G2  INTO LD1 IF G3  = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE G2  INTO F1  IF G3  = F1  PERFORM G ELSE PERFORM B.
           DIVIDE G2  INTO G1  IF G3  = G1  PERFORM G ELSE PERFORM B.
           DIVIDE G2  INTO H1  IF G3  = H1  PERFORM G ELSE PERFORM B.
           DIVIDE G2  INTO P1  IF G3  = P1  PERFORM G ELSE PERFORM B.
           DIVIDE G2  INTO Q1  IF G3  = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE G2  INTO Z1  IF G3  = Z1  PERFORM G ELSE PERFORM B.          
           PERFORM INIT.
           DIVIDE H2  INTO EH1 IF H3  = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE H2  INTO DH1 IF H3  = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE H2  INTO LH1 IF H3  = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE H2  INTO EB1 IF H3  = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE H2  INTO DB1 IF H3  = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE H2  INTO LB1 IF H3  = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE H2  INTO ED1 IF H3  = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE H2  INTO DD1 IF H3  = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE H2  INTO LD1 IF H3  = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE H2  INTO F1  IF H3  = F1  PERFORM G ELSE PERFORM B.
           DIVIDE H2  INTO G1  IF H3  = G1  PERFORM G ELSE PERFORM B.
           DIVIDE H2  INTO H1  IF H3  = H1  PERFORM G ELSE PERFORM B.
           DIVIDE H2  INTO P1  IF H3  = P1  PERFORM G ELSE PERFORM B.
           DIVIDE H2  INTO Q1  IF H3  = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE H2  INTO Z1  IF H3  = Z1  PERFORM G ELSE PERFORM B.          
           PERFORM INIT.      
           DIVIDE P2  INTO EH1 IF P3  = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE P2  INTO DH1 IF P3  = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE P2  INTO LH1 IF P3  = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE P2  INTO EB1 IF P3  = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE P2  INTO DB1 IF P3  = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE P2  INTO LB1 IF P3  = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE P2  INTO ED1 IF P3  = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE P2  INTO DD1 IF P3  = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE P2  INTO LD1 IF P3  = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE P2  INTO F1  IF P3  = F1  PERFORM G ELSE PERFORM B.
           DIVIDE P2  INTO G1  IF P3  = G1  PERFORM G ELSE PERFORM B.
           DIVIDE P2  INTO H1  IF P3  = H1  PERFORM G ELSE PERFORM B.
           DIVIDE P2  INTO P1  IF P3  = P1  PERFORM G ELSE PERFORM B.
           DIVIDE P2  INTO Q1  IF P3  = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE P2  INTO Z1  IF P3  = Z1  PERFORM G ELSE PERFORM B.          
           PERFORM INIT.
           DIVIDE Q2  INTO EH1 IF Q3  = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE Q2  INTO DH1 IF Q3  = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE Q2  INTO LH1 IF Q3  = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE Q2  INTO EB1 IF Q3  = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE Q2  INTO DB1 IF Q3  = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE Q2  INTO LB1 IF Q3  = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE Q2  INTO ED1 IF Q3  = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE Q2  INTO DD1 IF Q3  = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE Q2  INTO LD1 IF Q3  = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE Q2  INTO F1  IF Q3  = F1  PERFORM G ELSE PERFORM B.
           DIVIDE Q2  INTO G1  IF Q3  = G1  PERFORM G ELSE PERFORM B.
           DIVIDE Q2  INTO H1  IF Q3  = H1  PERFORM G ELSE PERFORM B.
           DIVIDE Q2  INTO P1  IF Q3  = P1  PERFORM G ELSE PERFORM B.
           DIVIDE Q2  INTO Q1  IF Q3  = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE Q2  INTO Z1  IF Q3  = Z1  PERFORM G ELSE PERFORM B.          
           PERFORM INIT.       
           DIVIDE Z2  INTO EH1 IF Z3  = EH1 PERFORM G ELSE PERFORM B.
           DIVIDE Z2  INTO DH1 IF Z3  = DH1 PERFORM G ELSE PERFORM B.
           DIVIDE Z2  INTO LH1 IF Z3  = LH1 PERFORM G ELSE PERFORM B.
           DIVIDE Z2  INTO EB1 IF Z3  = EB1 PERFORM G ELSE PERFORM B.
           DIVIDE Z2  INTO DB1 IF Z3  = DB1 PERFORM G ELSE PERFORM B.
           DIVIDE Z2  INTO LB1 IF Z3  = LB1 PERFORM G ELSE PERFORM B.
           DIVIDE Z2  INTO ED1 IF Z3  = ED1 PERFORM G ELSE PERFORM B.
           DIVIDE Z2  INTO DD1 IF Z3  = DD1 PERFORM G ELSE PERFORM B.
           DIVIDE Z2  INTO LD1 IF Z3  = LD1 PERFORM G ELSE PERFORM B.
           DIVIDE Z2  INTO F1  IF Z3  = F1  PERFORM G ELSE PERFORM B.
           DIVIDE Z2  INTO G1  IF Z3  = G1  PERFORM G ELSE PERFORM B.
           DIVIDE Z2  INTO H1  IF Z3  = H1  PERFORM G ELSE PERFORM B.
           DIVIDE Z2  INTO P1  IF Z3  = P1  PERFORM G ELSE PERFORM B.
           DIVIDE Z2  INTO Q1  IF Z3  = Q1  PERFORM G ELSE PERFORM B.
           DIVIDE Z2  INTO Z1  IF Z3  = Z1  PERFORM G ELSE PERFORM B.          
           DISPLAY 'TOTAL G = ' G ' TOTAL B = ' B
           STOP RUN.
       INIT.
           DISPLAY 'INIT'
           MOVE 6.0 TO EH1.
           MOVE 6.0 TO DH1.
           MOVE 6.0 TO LH1.
           MOVE 6.0 TO EB1.
           MOVE 6.0 TO DB1.
           MOVE 6.0 TO LB1.
           MOVE 6.0 TO ED1.
           MOVE 6.0 TO DD1.
           MOVE 6.0 TO LD1.
           MOVE 6.0 TO F1.
           MOVE 6.0 TO G1.
           MOVE 6.0 TO H1.
           MOVE 6.0 TO P1.
           MOVE 6.0 TO Q1.
           MOVE 6.0 TO Z1.    
       G.
           ADD 1 TO G.
           DISPLAY 'GOOD-TEST'.
       B.
           ADD 1 TO B
           MOVE 16 TO RETURN-CODE..
           DISPLAY 'BAD-TEST'.
      *    STOP RUN.
      