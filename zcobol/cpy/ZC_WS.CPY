.*********************************************************************
.* z390 - Mainframe assembler emulator and run-time engine
.* Copyright (C) 2021 z390 Assembler LLC
.*
.* This file is part of z390.
.*
.* z390 is free software; you can redistribute it and/or modify
.* it under the terms of the GNU General Public License as published by
.* the Free Software Foundation; either version 2 of the License, or
.* (at your option) any later version.
.* z390 is distributed in the hope that it will be useful,
.* but WITHOUT ANY WARRANTY; without even the implied warranty of
.* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
.* GNU General Public License for more details.
.*
.* You should have received a copy of the GNU General Public License 
.* along with this program; if not, see https://www.gnu.org/licenses.
.*********************************************************************
.* Author - Don Higgins                                              *
.* Date   - 04/07/08                                                 *
.*********************************************************************
.* 04/08/08 initial coding to define global WS variables 
.* 04/30/08 add 88 definitions for use in literal compares/moves etc.
.* 06/10/08 add LINKAGE SECTION support                                   
.* 07/26/08 add zcob_sym_find hash table                                  
.* 11/26/08 add IE_TYPE 4 FOR PERFORM n TIMES stmt, UNTIL stmt       
.* 12/21/08 add SYM_FILLER_VAL_CNT for use by GEN_INIT_WS          
.* 12/22/08 add SYM_SUB_CNT for use by ZCGETFLD.CPY subscript parser          
.* 02/05/09 add TOT_SIX and SIX_NAME,SIX_OFF,SIX_OCCURS for subscripts
.* 02/08/09 add FIELD_RMD to indicate (off:len) reference modification 
.* 02/23/09 RPI 1001 add &FIELD_88_IX set by ZCGETFLD.CPY
.* 02/25/09 RPI 1004 add &ZC_FLOAT SET TO DEFUALT DFP           
.* 02/26/09 RPI 1012 add &SYM_VAL_ALL FLAG           
.* 03/10/09 RPI 1013 add &ZC_FLOAT_SHORT/LONG/EXTENDED_TYPE
.* 04/24/09 RPI 1003 add &TMP_NAME/TYPE/LEN/SIGN for ZC_CALC,GEN_???
.* 07/09/09 RPI 1065 move &FILE_IX from SYM_REF to SYM_FD 
.* 07/17/09 RPI 1065 add &QNAME(50) &QNAME_LEN &QNAME_TOT 
.*          for ZC_GET_QNAME used by ZCGETFLD and ZC_SYM_INDEX  
.* 08/03/09 RPI 1065 add &ZC_DEC_IS_COMMA special name support
.* 08/04/09 RPI 1065 support qualified paragraph names SN_NAME/PG_NAME             
.* 08/09/09 RPI 1065 add ZC_ERROR to skip GEN_BC after GEN_COMP error      
.* 08/09/09 RPI 1065 use FXT for head of dup sym, NXT for next dup.     
.* 08/18/09 RPI 1065 add SYM_OPT for options R=JUST,                    
.* 09/08/09 RPI 1065 replace SYM_DEP_IX with SYM_DEPEND name                    
.* 09/09/09 RPI 1065 replace FILE_TYPE with FILE_ORG,FILE_MODE,FILE_KEY                    
.* 05/25/10 RPI 1118 ZC_MAXDISPLAY with default 80                                   
.* 04/05/11 RPI 1139 FIX ARRAY DIM FOR HLASM COMP, REMOVE DUP ZC_LIST
.* 03/24/12 RPI 1182 CORRECT SETC FOR &BASE_WS (WAS &BASE_SYS)
.* 03/27/12 RPI 1182 add &RMD_VLEN flag and &RMD_REG for len if vlen
.* 04/25/12 RPI 1211 add TMP_PIC_DEC for scaling ZC_CALC 
.* 05/05/12 RPI 1211 add &BASE_MIN_RANGE to ensure block base coverage
.*********************************************************************
.*
.* PGM NAME AND ZCOBOL VERSION CHECKED BY ZC390NUC IN ZC390LIB.390
.*
         GBLC  &ZC_PGM       NAME FROM FIRST CMD PARM (IGNORE PGM-ID)
         GBLC  &ZC_VER       CURRENT Z390 VERSION FROM TZ390.VER
         GBLC  &ZC_CDATE     COMPILE DATE OR MM/DD/YY IF NOTIMING
         GBLC  &ZC_CTIME     COMPILE START TIME IF TIMING ELSE ''
         GBLC  &ZC_LIST      LISTING OPTION FOR INTERNAL CODE GEN
         GBLC  &ZC_OPTIONS   ALL OPTIONS FOLLOWING PGM NAME        
.*
.* ZCOBOL OPTIONS
.*
         GBLB  &ZC_PROC_DIV  SET AT START OF PROCEDURE DIVISION
         GBLB  &ZC_CICS      CICS COBOL PROGRAM WITH DFHEISTG WS CSECT
         GBLB  &ZC_CICS_DSA_VALUE IGNORE VALUES AND ISSUE 1 WARNING
         GBLB  &ZC_COMMENT   LIST SOURCE AS COMMENTS IN MLC FOR PRN
         GBLB  &ZC_EXTEND    COMP S9(39) TYPE G, COMP-3 S9(31) TYPE P
         GBLB  &ZC_R64       USE 64 BIT REGS FOR G TYPE S9(18) DSG ETC.  
         GBLB  &ZC_TRACE     DISPLAY PARAGRAPH LABEL TRACE DURING EXEC
         GBLB  &ZC_TRUNC     TRUNCATE NUM DATA TO PIC SIZE (NOT YET)
         GBLB  &ZC_WARN      GENERATE WARNING LEVEL 4 M NOTES
         GBLC  &ZC_FLOAT     FLOATING POINT TYPE (DECIMAL,HEX,BINARY)
         GBLC  &ZC_FLOAT_SHORT_TYPE    1/4/7 SET FROM FLOAT(???)
         GBLC  &ZC_FLOAT_LONG_TYPE     2/5/8 SET FROM FLOAT(???)
         GBLC  &ZC_FLOAT_EXTENDED_TYPE 3/7/9 SET FROM FLOAT(???)
         GBLB  &ZC_DEC_IS_COMMA        SPEC NAMES OPTION
         GBLB  &ZC_ERROR               FLAG TO INDICATE STMT ERROR
         GBLA  &ZC_MAXDISPLAY          MAXIMUM DISPLAY LINE LENGTH
.*
.* GLOBAL LIMITS
.*
&MAX_PM     SETA 20    MAXIMUM NESTED PERFORMS (CAN BE SET HIGHER)
&MAX_IE     SETA 100   MAXIMUM NEXTED IF, EVALUATE, READ END-READ
&MAX_WS_LVL SETA 50 MAXIMUM WS LEVELS          
&MAX_SYM    SETA 20000 MAXIMUM WS SYMBOLS 
&MAX_FILE   SETA  100
.*
.* FILE TABLE DEFINED FROM SELECT AND FD STATEMENTS
.*
         GBLA  &FILE_TOT               TOTAL FILES DEFINED
         GBLA  &FILE_IX                FILE INDEX ELSE 0 FOR NOT FOUND
         GBLC  &FILE_NAME(100)   FILE NAME FROM SELECT
         GBLC  &FILE_ORG(100)    FILE TYPE (QSAM,LSEQ,KSDS,RRDS)
         GBLC  &FILE_MODE(100)   FILE MODE (SEQ,RAN,DYN)         
         GBLC  &FILE_KEY(100)    FILE INDEXED RECORD KEY FIELD          
         GBLC  &FILE_XRBA(100)   FILE RELATIVE XRBA FIELD
         GBLC  &FILE_DDNAME(100) FILE DDNAME OR DSN IN QUOTES
         GBLC  &FILE_RECORD(100) FILE RECORD FOR READ
         GBLC  &FILE_STATUS(100) FILE STATUS FIELD NAME
         GBLC  &FILE_BLKSI1(100) MIN BLOCK SIZE (DEF CHAR)
         GBLC  &FILE_BLKSI2(100) MAX BLOCK SIZE (DEF CHAR)
         GBLB  &FILE_BLKSI_RCDS(100) MIN/MAX BLKSI IN RECORDS 
         GBLC  &FILE_LRECL1(100) MIN REC SIZE (DEF CHAR)
         GBLC  &FILE_LRECL2(100) MAX REC SIZE (DEF CHAR)
         GBLC  &FILE_DEPENDING(100) VAR LRECL FLD FOR FILE 
.*
.* WS BASE REGISTERS (GEN_ID sys init, GEN_BASE dynamic,PERIOD reset)
.*
.*   1.  Cnrrent preset WS base regs  = R13
.*   2.  Currnet dynamic WS base regs = R6, R7
.*
         GBLC &BASE_WS
&BASE_WS SETC 'ZC_R13'            FIRST WS SYSTEM BASE
         GBLA &BASE_WS_HIGH
&BASE_WS_HIGH SETA 4096-16        MAX WS SYSTEM BASE OFFSET RPI 1065
         GBLC &BASE_B1,&BASE_B2
         GBLB &BASE_B1_USED,&BASE_B2_USED  FOR DROP AT PERIOD
&BASE_B1 SETC 'ZC_R6'                FIRST  DYNAMIC WS BASE REG
&BASE_B2 SETC 'ZC_R7'                SECOND DYNAMIC WS BASE REG
         GBLA &BASE_B1_LOW,&BASE_B1_HIGH          
         GBLA &BASE_B2_LOW,&BASE_B2_HIGH          
         GBLA &BASE_LRU           LEAST RECENTLY USED WS DYNAMIC BASE
         GBLA &BASE_MIN_RANGE
&BASE_MIN_RANGE SETA 256         RPI 1211 MIN BASE COVERAGE FOR BLK
.*
.* LK BASE REGISTERS (GEN_BASE for dynamic,PERIOD for reset)
.*
.*   1.  Currnet dynamic WS base regs = R4 and R5
.*
         GBLC &LBASE_B1,&LBASE_B2
         GBLB &LBASE_B1_USED,&LBASE_B2_USED FOR DROP AT PERIOD
&LBASE_B1 SETC 'ZC_R4'               FIRST  DYNAMIC LK BASE REG
&LBASE_B2 SETC 'ZC_R5'               SECOND DYNAMIC LK BASE REG
         GBLA &LBASE_B1_LOW,&LBASE_B1_HIGH LOW HIGH BASE OFFSETS
         GBLA &LBASE_B2_LOW,&LBASE_B2_HIGH LOW HIGH BASE OFFSETS
         GBLA &LBASE_B1_IX        SYM IX OF BASE VAR IN WS
         GBLA &LBASE_B2_IX        SYM IX OF BASE VAR IN WS
         GBLA &LBASE_LRU          LEAST RECENTLY USED LK DYNAMIC BASE
.*
.* GET PARM FIELD (ZCGETFLD.CPY) TO GET QUAL. SUBSC. FIELD NAME/ADDR
.*  
         GBLA  &PARM_IX                INPUT/UPDATE PARM INDEX
         GBLC  &FIELD_REG              INPUT REG FOR SUBSC/RMOD FLD ADR
         GBLB  &FIELD_SS1              INPUT SS1 FIELD OFF(LEN,REG) 
         GBLB  &FIELD_SIX              OUTPUT REG USED FOR SUB/IDX/RMOD 
         GBLB  &FIELD_RMD              OUTPUT REF MODS (OFF:LEN)
         GBLB  &RMD_VLEN_ALLOW         INPUT SET BY MOVE IF VLEN OK
         GBLB  &RMD_VLEN               OUTPUT SET IF RMD_REG=VLEN OK
         GBLB  &RMD_VLEN_SRC           OUTPUT SET IF SOURCE VLEN
         GBLB  &RMD_VLEN_TAR           OUTPUT SET IF TARGET VLEN
         GBLC  &RMD_REG                INPUT RMD ADDR/LENGTH REG     
         GBLA  &FIELD_IX               OUTPUT SYM_IX OF FIELD
         GBLA  &FIELD_88_IX            OUTPUT SYM_IX OF 88 FIELD           
         GBLC  &FIELD_NAME             OUTPUT SOURCE/TARGET NAME
.*                                       SS1 AND     SIX > O(L,R)
.*                                       SS1 AND NOT SIX > N+O(L)
.*                                       NOT SS1 AND SIX > O(R)
.*                                       NOT SS1 NOT SIX > N+O
         GBLA  &FIELD_OFF              OUTPUT OFF IF RMOD ELSE 0
         GBLA  &FIELD_LEN              OUTPUT LEN IF RMOD ELSE 0
.*
.*
.* SYMBOL TABLE 
.*
         GBLA  &SYM_TOT                TOT FD AND WS SYMBOLS
         GBLA  &SYM_IX                 SYM INDEX IF FOUND ELSE 0
         GBLC  &SYM_RX                 SYM BDDD SET BY GEN_SYM_RX
         GBLA  &SYM_IX_LST             SYM LAST WS TYPE 1 SYM INDEX
         GBLA  &SYM_DUP_TOT            SYM TOTAL DUPLICATES 
         GBLA  &SYM_DUP_MAX            SYM MAX DUPLICATE CHAIN LENGTH 
         GBLA  &SYM_CUR_DUP            SYM CURRENT DUP CHAIN COUNT
         GBLA  &SYM_FILLER_VAL_CNT     FILLER WITH VALUE CNT IF CICS
         GBLA  &PIC_DIGITS             DIGITS IN PIC BY ZC_PIC_DIGITS
         GBLC  &SYM_NAME(20000)     SYM NAME
         GBLA  &SYM_FXT(20000)      SYM NAME FIRST DUPLICATE SYM_IX
         GBLA  &SYM_NXT(20000)      SYM NAME DUPLICATE NEXT SYM_IX
         GBLA  &SYM_LK(20000)       LINKAGE SECTION SYM_IX OF 01 LVL
         GBLA  &SYM_QIX(20000)  SYM QUALIFIER INDEX TO NEXT LVL NAME
         GBLA  &SYM_SIT(20000)  SYM SUBSCRIPT/INDEX TOTAL REQ'D
         GBLA  &SYM_LVL(20000)  SYM LEVEL 
         GBLA  &SYM_REF(20000)  SYM REF INDEX (88 SYM,RDEF,OR VAR)
         GBLA  &SYM_FD(20000)   SYM FD INDEX OR ZERO
         GBLA  &SYM_LOC(20000)  SYM WS OFFSET OR 88 VAL INDEX
         GBLA  &SYM_LEN(20000)  SYM LENGTH 
         GBLA  &SYM_DUP(20000)  SYM OCCURS N TIMES (MAX FOR DEPEND)                 
         GBLA  &SYM_DUP_MIN(20000)  SYM MIN OCCURS DEPENDING            
         GBLC  &SYM_DEPEND(20000)   SYM NAME FOR DEPENDING ON           
         GBLC  &SYM_VAL(20000)  SYM VALUE (0,SPACE,'...') T=1,2
         GBLB  &SYM_VAL_ALL(20000)  SYM VALUE ALL FLAG
         GBLC  &SYM_PIC(20000)  SYM PIC (999,X(3) ETC.)
         GBLC  &SYM_PIC_TYPE(20000)  SYM PIC TYPE A,D,E,F,H,P,X,Z
         GBLB  &SYM_PIC_SIGN(20000)  SYM PIC (S9...)
         GBLA  &SYM_PIC_DEC(20000)   SYM DECIMAL PLACES (999V99)
         GBLC  &SYM_OPT(20000)       SYM OPTIONS
.*               B = BLANK WHEN ZERO
.*               E = EXTERNAL
.*               G = GLOBAL
.*               L = LEADING       
.*               R = JUST/JUSTIFY RIGHT
.*               S = SYNC/SYNCHRONIZE (ALIGN TO OPTIMUM BOUNDARY)
.*
.* SECTION AND PARAGRAPH NAMES
.*
         GBLA &SN_TOT              TOTAL SECTIONS (SEE LABEL MACRO)
         GBLA &PG_TOT              TOTAL PARAGRAPH NAMES 
         GBLA &PG_DUP_TOT          TOTAL DUPLICATE PARAGRAH NAMES
.*
.* QNAME - QUALIFIED NAME LEVELS
.*
         GBLC &QNAME(50)           QUALIFEID BASE AND LEVEL NAMES
         GBLA &QNAME_LEN           TOT LEN OF QUAL NAME A_OF_B_OF_C ETC
         GBLA &QNAME_TOT           TOT NUMBER OF LEVELS INC 1=BASE NAME
.*
.* SYM 88 VALUES - SYM_LOC POINTS TO STARTING VALUE IF MORE THAN 1
.*
         GBLA &V88_TOT            TOTAL 88 LEVEL VALUES
         GBLC &V88_VAL(20000)  88 VALUE
         GBLA &V88_NEXT(20000) INDEX OF NEXT VALUE OR 0
         GBLC &V88(20000)
.*
.* SET POINTERS FOR ALL SYMBOLS WITH OCCURS
.*
         GBLA &CUR_SET_LVL    CURRENT SUBSCRIPT LEVEL RESET TO 1 AT 01
         GBLA &SET_TOT  TOTAL OCCURS AND SET POINTERS TO GENERATED
         GBLA &SET_SYM_IX(20000) INDEX TO SYM WITH OCCURS
         GBLA &SET_SYM_LVL(20000) SUBSCRIPT LEVEL 1-N 
         GBLC &SET_INDEX(20000)  INDEX BY ALIAS NAME IF ANY
.*
.* LK LINKAGE SECTION - SEE &SYM_LK AND SYM_REF FOR DSECT ALSO 
.*
         GBLB &LK_MODE            SET LK MODE ON AT LINKAGE SECTION
         GBLA &LK_SAVE_WS_LOC     SAVE LAST WS_LOC RESTORED AT DATA END
         GBLA &LAST_LK_DSECT_IX   SAVE IX OF LAST 01 DSECT IN LK SECT
         GBLA &LK_TOT             TOTAL LK 01 LEVEL DSECTS
.*
.* IF/ELSE, EVALUATE, READ, AND PERFORM - NESTED COMPARE/BRANCH DATA
.*
         GBLA &IF_CNT               UNIQUE IF COUNTER
         GBLA &MAX_IOP_TF           MAX IF_IOP_TF FIELDS REQUIRED
         GBLB &PERIOD_NEXT          REQ LABEL FOR NEXT SENTENCE AT .
         GBLA &PERIOD_NEXT_LAB      UNIQUE NEXT SENENCE LABEL COUNTER
         GBLA &EVAL_LAB             UNIQUE EVALUTE LABEL COUNTER
         GBLA &AT_END_LAB           UNIQUE READ AT END LABEL COUNTER
         GBLA &PM_LAB               UNIQUE PERFORM LABEL COUNTER
         GBLA &ADD_LAB               UNIQUE ADD      LABEL COUNTER
         GBLA &SUB_LAB               UNIQUE SUBTRACT LABEL COUNTER
         GBLA &MPY_LAB               UNIQUE MULTIPLY LABEL COUNTER
         GBLA &DIV_LAB               UNIQUE DIVIDE   LABEL COUNTER
         GBLC &LAST_PG_NAME         LAST PROC DIV PARAGRAPH NAME   
         GBLC &LAST_SN_NAME         LAST PROC DIV SECTION NAME  
         GBLA &IE_LVL               CURRENT LEVEL FOR IF OR EVALUATE
         GBLA &IE_TYPE(100)     1=IF, 2=EVALUATE, 3=END_READ 4=PM
.*                                  11=ADD,12=SUB,13=MPY,14=DIV
         GBLA &IE_TCNT(100)     IE TYPE  COUNT                  
         GBLA &IE_BCNT(100)     IE BLOCK COUNT WITHIN TYPE     
         GBLB &IE_ELSE(100)     CURRENT IF OR ELSE BLOCK FLAG
         GBLA &IE_EVAL(100)     CURRENT EVAL LABEL #
         GBLA &IE_EVAL_IX(100)  CURRENT EVAL SYM INDEX       
         GBLA &IE_WHEN(100)     CURRENT EVAL WHEN LABEL #
         GBLC &IE_PM_LAB(100)   CURRENT PM STMT LOOP LABEL
.*
.* GO TO DEPENDING ON LABEL 
.*
         GBLA &ZC_GO_DEP            COUNT OF GO TO DEPENDING ON  TABLES
.*
.* CURRENT WS LOC, LEVEL, AND PENDING LENGTH SYMBOL PTRS
.*
         GBLA  &WS_LOC            CURRENT WS LOC OFFSET (SEE GEN_ID)
         GBLA  &ZC_DCB_LEN        LENGTH OF DCB GEN'D BY GEN_FD IN WS
&ZC_DCB_LEN SETA X'68'
         GBLA  &WS_LVL            CURRENT WS INDENT LEVEL
         GBLA  &WS_LVL_NO(50)       CUR LV # 01-49 (77=01)
         GBLA  &WS_LVL_SYM_IX(50)   CUR WS ITEM SYMBOL INDEX
         GBLC  &WS_LVL_USE(50)      CUR WS LEVEL USAGE 
         GBLB  &WS_LVL_RDEF(50)     CUR WS ITEM IS  REDEFINE
         GBLA  &WS_LVL_RDEF_END(50) CUR WS ITEM RDEF END LOC
         GBLA  &WS_LVL_RDEF_IX(50)  CUR WS ITEM RDEF SYM IX
.*
.* VAR - GENERATED WS 77 ITEMS FOR USE BY GENERATED CODE
.*
         GBLA  &VAR_TOT     TOTAL VARS NAMED ZC_VAR_&VAR_TOT
.*
.* SIX SUBSCRIPT DATA PASSED BETWEEN ZCGETFLD AND GEN_SIX
.*
         GBLA &TOT_SIX       TOTAL SUBSCRIPTS
         GBLC &SIX_NAME(10)  SUBSCRIPT/INDEX/LIT FROM FIELD(PARMS)
         GBLC &SIX_OFF(10)   SUBSCRIPT OFFSETS +/-NUM ELSE ''
         GBLA &SIX_OCCUR(10) OCCURS SYM_IX (TO GET LENGTH, ETC.)
.*
.* TMP variables for ZC_CALC, GEN_ADD, GEN_SUB, GEN_MPY, GEN_DIV
.* wheb target index is negative (used to store and fetch temp values)
.*
         GBLC &TMP_NAME(100)    - NAME -  ZCVT_WORKAREA+16*(IX-1)
         GBLC &TMP_TYPE(100)    - TYPE OF TEMP VALUE '1-9FGHPQ' Z>P
         GBLA &TMP_LEN(100)     - LENGTH OF TEMP VALUE FOR P
         GBLB &TMP_SIGN(100)    - SIGNED OR UNSIGNED P OR Z FIELD
         GBLA &TMP_PIC_DEC(100) - DECIMAL PLACES FOR FGHPQ  RPI 1211
.*
.* END OF CBL_WS.CPY
.*
