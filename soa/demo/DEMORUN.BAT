REM RUN SO CLIENT SERVER APPLICAITON
IF EXIST /usr/local/lib/z390/z390.jar GOTO LINUX
REM START SOA APPLICATION SERVER AS SEPARATE PROCESS
START soa\demo\DEMORUNS stats NOTIMING   %1 %2 %3 %4 %5
PAUSE PRESS ENTER TO START CLIENT AFTER SERVER IS RUNNING
REM RUN SOA CLIENT APPLICATION
CALL soa\demo\DEMORUNC stats NOTIMING   %1 %2 %3 %4 %5
GOTO END
:LINUX
REM RUN DEMORUNS DEMOSMGR SERVER AND THEN
REM RUN DEMORUNC DEMOMAIN CLIENT IN 2ND TERMINAL WINDOW
:END
