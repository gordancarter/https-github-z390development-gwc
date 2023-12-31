REM GENERATE SOA APPLICAITON
REM GEN SOA CLIENT MSG MGR
CALL ASML soa\demo\DEMOCMGR SYSMAC(soa\maclib+mac) stats NOTIMING   %1 %2 %3 %4 %5
IF ERRORLEVEL 1 PAUSE ERROR IN ASML DEMOCMGR
REM GEN SOA SERVER MSG MGR
CALL ASML soa\demo\DEMOSMGR SYSMAC(soa\maclib+mac) stats NOTIMING   %1 %2 %3 %4 %5
IF ERRORLEVEL 1 PAUSE ERROR IN ASML DEMOSMGR
REM GEN SOA SERVICE 390 FOR LOADING BY SERVER
CALL ASML soa\demo\DEMOSUB1 SYSMAC(soa\maclib+mac) SYS390(soa\demo) stats NOTIMING   %1 %2 %3 %4 %5
IF ERRORLEVEL 1 PAUSE ERROR IN ASML DEMOSUB1
REM GEN SOA SERVICE STUB OBJ FOR LINKING WITH CLIENT APPL
CALL ASM  soa\demo\SOA_STUB_DEMOSUB1 SYSMAC(soa\maclib+mac) stats NOTIMING   %1 %2 %3 %4 %5
IF ERRORLEVEL 1 PAUSE ERROR IN ASM STUB DEMOSUB1
COPY soa\demo\SOA_STUB_DEMOSUB1.OBJ soa\demo\DEMOSUB1.OBJ
IF ERRORLEVEL 1 PAUSE ERROR IN COPY STUB DEMOSUB1
REM GEN SOA SERVICE 390 FOR LOADING BY SERVER
CALL ASML soa\demo\DEMOSUB2 SYSMAC(soa\maclib+mac) SYS390(soa\demo) stats NOTIMING   %1 %2 %3 %4 %5
IF ERRORLEVEL 1 PAUSE ERROR IN ASML DEMOSUB2
REM GEN SOA SERVICE STUB OBJ FOR LINKING WITH CLIENT APPL
CALL ASM  soa\demo\SOA_STUB_DEMOSUB2 SYSMAC(soa\maclib+mac) stats NOTIMING   %1 %2 %3 %4 %5
IF ERRORLEVEL 1 PAUSE ERROR IN ASM STUB DEMOSUB2
COPY soa\demo\SOA_STUB_DEMOSUB2.OBJ soa\demo\DEMOSUB2.OBJ
IF ERRORLEVEL 1 PAUSE ERROR IN COPY STUB DEMOSUB2
REM GEN SOA MAIN CLIENT LINKED WITH SERVICE STUBS
CALL ASML soa\demo\DEMOMAIN SYSOBJ(soa\demo) SYS390(soa\demo)
