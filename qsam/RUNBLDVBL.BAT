CD..
REM RUN BLDVBL TO CREATE RECFM=VB WITH LBI LARGE BLK 
ERASE QSAM\BLDVBL.ERR
ERASE QSAM\TESTVBL.TFV
SET SYSUT2=QSAM\TESTVBL.TFV
SET SNAPOUT=DUMMY
CALL BAT\ASMLG QSAM\BLDVBL.MLC TRACEALL
DIR QSAM\TESTVBL.TFV
PAUSE VERIFY BLDVBL