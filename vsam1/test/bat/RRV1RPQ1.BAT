@echo off
REM LOAD/UNLOAD RRV1 USING RECFM=V QSAM FILE    
REM NOTE RRV1.TF1 QSAM INPUT FILE IS CREATED BY RRV1TEST.MLC
rem %0 in z390\vsam1\test\bat; switch to z390
pushd %~dps0..\..\..

SET PGMNAME=RRV1RPQ1
SET VSAMPATH=vsam1\test
SET ZVSAM=ZVSAM(1)
SET TRACE=%
IF /I "%1" == "traceall" (
    SET TRACE=TRACEALL
    shift /1
)

SET RC=0

REM RUN REPRO TO LOAD RRV1.VES FROM RRV1.TQ1
SET INFILE=%VSAMPATH%\RRV1.TQ1[RECFM=V]
SET OUTFILE=%VSAMPATH%\TESTCAT.RRV1
CALL bat\EXEC linklib\REPRO %1 %2 %3 %4 %5 %ZVSAM% %TRACE%
SET RC=%ERRORLEVEL%
IF %RC% NEQ 0 (
    SET ERRMSG=ERROR IN REPRO LOAD OF RRV1
	GOTO errmsg
)
REM SAVE REPRO LOAD STATS
COPY linklib\REPRO.LOG %VSAMPATH%\%PGMNAME%.RLG  
IF "%TRACE%" == "TRACEALL" COPY linklib\REPRO.TRE %VSAMPATH%\%PGMNAME%.RLE
REM RUN REPRO TO UNLOAD FROM RRV1.VES TO RRV1.TQ2
SET INFILE=%VSAMPATH%\TESTCAT.RRV1
SET OUTFILE=%VSAMPATH%\RRV1.TQ2[RECFM=V]
CALL bat\EXEC linklib\REPRO %1 %2 %3 %4 %5 %ZVSAM% %TRACE%
SET RC=%ERRORLEVEL%
IF %RC% NEQ 0 (
    SET ERRMSG=ERROR IN REPRO UNLOAD OF RRV1
	GOTO errmsg
)
REM SAVE REPRO UNLOAD STATS
COPY linklib\REPRO.LOG %VSAMPATH%\%PGMNAME%.RUG  
IF "%TRACE%" == "TRACEALL" COPY linklib\REPRO.TRE %VSAMPATH%\%PGMNAME%.RUE
REM COMPARE INPUT AND OUTPUT QSAM FILES
fc %VSAMPATH%\RRV1.TQ1 %VSAMPATH%\RRV1.TQ2 > %VSAMPATH%\%PGMNAME%.DIF
SET RC=%ERRORLEVEL%
IF %RC% NEQ 0 (
    SET ERRMSG=REPRO LOAD/UNLOAD QSAM FILES DO NOT MATCH
	GOTO errmsg
)

:return
popd
exit /b %RC%
:errmsg
echo ERROR: %ERRMSG%
SET RC=8
GOTO return
