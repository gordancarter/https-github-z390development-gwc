@echo off
REM ESF2TEST TEST ESDS FIXED LENGTH VSAM FILE SEQ AND RANDOM RBA/XRBA
rem %0 in z390\vsam1\test\bat; switch to z390
pushd %~dps0..\..\..

SET VSAMPATH=vsam1\test
SET ZVSAM=ZVSAM(1)
SET TRACE=%
IF /I "%1" == "traceall" (
    SET TRACE=TRACEALL
    shift /1
)

SET RC=0

REM RUN ESF2TEST TO CREATE AND TEST ESDS WITH 3 80 BYTE RCDS
SET VFILE=%VSAMPATH%\TESTCAT.ESF2
if exist %VSAMPATH%\ESF2.VES erase %VSAMPATH%\ESF2.VES
CALL bat\ASMLG %VSAMPATH%\ESF2TEST %1 %2 %3 %4 %5 %ZVSAM% %TRACE%
SET RC=%ERRORLEVEL%
IF %RC% NEQ 0 (
    SET ERRMSG=ERROR IN ESF2TEST
	GOTO errmsg
)

:return
popd
exit /b %RC%
:errmsg
echo ERROR: %ERRMSG%
SET RC=8
GOTO return
