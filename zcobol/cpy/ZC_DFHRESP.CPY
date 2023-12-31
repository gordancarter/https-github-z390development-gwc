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
.* 06/14/09 RPI 1057 sync with AZ390 DFHRESP and DFHVALUE support
.* 09/02/09 RPI 1079 add DFHRESP(NOTALLOC)=F'61'     
.*********************************************************************
               GBLC &(DFHRESP_NORMAL) 
               GBLC &(DFHRESP_ERROR)
               GBLC &(DFHRESP_TERMIDERR)
               GBLC &(DFHRESP_FILENOTFOUND) 
               GBLC &(DFHRESP_DSIDERR)      
               GBLC &(DFHRESP_NOTFND)       
               GBLC &(DFHRESP_DUPREC)       
               GBLC &(DFHRESP_DUPKEY)       
               GBLC &(DFHRESP_INVREQ)
               GBLC &(DFHRESP_IOERR)
               GBLC &(DFHRESP_NOSPACE)      
               GBLC &(DFHRESP_NOTOPEN)      
               GBLC &(DFHRESP_ENDFILE)      
               GBLC &(DFHRESP_ILLOGIC)      
               GBLC &(DFHRESP_LENGERR)
               GBLC &(DFHRESP_ITEMERR)      
               GBLC &(DFHRESP_PGMIDERR)
               GBLC &(DFHRESP_TRANSIDERR)
               GBLC &(DFHRESP_ENDDATA) 
               GBLC &(DFHRESP_EXPIRED)      
               GBLC &(DFHRESP_MAPFAIL)      
               GBLC &(DFHRESP_INVMPSZ)      
               GBLC &(DFHRESP_OVERFLOW)     
               GBLC &(DFHRESP_QIDERR)       
               GBLC &(DFHRESP_ENQBUSY)      
               GBLC &(DFHRESP_ENVDEFERR)    
               GBLC &(DFHRESP_NOTALLOC)     RPI 1079 
               GBLC &(DFHRESP_SUPPRESSED)     
               GBLC &(DFHRESP_END)          
               GBLC &(DFHRESP_DISABLED)     
               :&(DFHRESP_NORMAL)       SETC   '0'  
               :&(DFHRESP_ERROR)        SETC   '1'  
               :&(DFHRESP_TERMIDERR)    SETC   '11' 
               :&(DFHRESP_FILENOTFOUND) SETC   '12' 
               :&(DFHRESP_DSIDERR)      SETC   '12' 
               :&(DFHRESP_NOTFND)       SETC   '13' 
               :&(DFHRESP_DUPREC)       SETC   '14' 
               :&(DFHRESP_DUPKEY)       SETC   '15' 
               :&(DFHRESP_INVREQ)       SETC   '16' 
               :&(DFHRESP_IOERR)        SETC   '17' 
               :&(DFHRESP_NOSPACE)      SETC   '18' 
               :&(DFHRESP_NOTOPEN)      SETC   '19' 
               :&(DFHRESP_ENDFILE)      SETC   '20' 
               :&(DFHRESP_ILLOGIC)      SETC   '21' 
               :&(DFHRESP_LENGERR)      SETC   '22' 
               :&(DFHRESP_ITEMERR)      SETC   '26' 
               :&(DFHRESP_PGMIDERR)     SETC   '27' 
               :&(DFHRESP_TRANSIDERR)   SETC   '28' 
               :&(DFHRESP_ENDDATA)      SETC   '29' 
               :&(DFHRESP_EXPIRED)      SETC   '31' 
               :&(DFHRESP_MAPFAIL)      SETC   '36' 
               :&(DFHRESP_INVMPSZ)      SETC   '38' 
               :&(DFHRESP_OVERFLOW)     SETC   '40' 
               :&(DFHRESP_QIDERR)       SETC   '44' 
               :&(DFHRESP_ENQBUSY)      SETC   '55' 
               :&(DFHRESP_ENVDEFERR)    SETC   '56' 
               :&(DFHRESP_NOTALLOC)     SETC   '61'   RPI 1079
               :&(DFHRESP_SUPPRESSED)   SETC   '72' 
               :&(DFHRESP_END)          SETC   '83' 
               :&(DFHRESP_DISABLED)     SETC   '84' 
