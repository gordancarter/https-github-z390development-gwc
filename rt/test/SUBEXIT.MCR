         MACRO                                                          
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
.* Date   - 04/12/07                                                 *
.* 04/12/07 DSH RPI 590 COPIED FROM CBT SHARE SPLA TAPE 178 TO ADD
.*          SUPPORT FOR RENT, EXTRA BASES, ETC.
.* 04/24/07 RPI 601 CORRECT PLACEMENT OF LABEL
.* 07/11/07 RPI 654 REMOVE USED RWALNG= AND SP=
.* 08/21/07 RPI 670 CORRECT REG OPTIMIZATION TO HANDLE ANY REG SYMBOL
.* 04/19/08 RPI 833 ADD STRING QUOTES FOR HLASM COMPATIBILITY 
.*********************************************************************
.*             MACRO-ID. 'SUBEXIT'.                                     
.*             AUTHOR.   DON HIGGINS.                                   
.*             DATE WRITTEN.  07/28/70.                                 
.*             REMARKS.  THIS MACRO GENERATES THE CODE TO RESTORE       
.*                       REGISTERS AND RETURN FROM A CSECT.  A RETURN   
.*                       CODE OF ZERO IS RETURNED UNLESS A DIFFERENT    
.*                       CODE IS SPECIFIED USING THE KEY WORD RC=.      
.*             REV1 11/14/74 ADD REENTRANT OPTION. SEE SUBENTRY.        
.*             REV2 12/09/74 ADD REG OPTION FOR RC OPERAND.             
.*             REV3 02/10/76 DSH - ADD SUBPOOL OPTION                   
.*********************************************************************
&NAME    SUBEXIT &RC=0,&RENT=NO                         
         AIF   ('&NAME' EQ '').SKIPDS
&NAME    DS    0H
.SKIPDS  ANOP
         GBLB  &RENTOPT                                                 
         AIF   ('&RC'(1,1) EQ '(').RCREG                                
         LA    15,&RC                                                   
         AGO   .CHKRENT                                                 
.RCREG   ANOP   
         ZOPTLR 15,&RC                                                   
.CHKRENT ANOP                                                           
         AIF   (&RENTOPT EQ 0).NORENT                                   
         L     13,4(,13)                                                
         STM   15,1,16(13)                                              
         L     1,8(,13)                                                 
         LA    15,8                                                     
         SLR   1,15                                                     
         L     0,4(,1)                                                  
         FREEMAIN R,LV=(0),A=(1)                                        
         LM    14,12,12(13)                                             
         BR    14                                                       
         MEXIT                                                          
.NORENT  ANOP                                                           
         L     13,4(,13)                                                
         L     14,12(,13)                                               
         LM    2,12,28(13)                                              
         BR    14                                                       
         MEND                                                           
  
