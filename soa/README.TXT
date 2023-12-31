Z390 SERVICE ORIENTED ARCHITECTURE (SOA) SUPPORT v1.3.01 02/05/07

THIS SOA DIRECTORY CONTAINS DEMOS AND MACROS FOR Z390 SUPPORT OF SOA
CLIENT APPLICATIONS IN ANY LANGUAGE CALLING Z390 SERVICES VIA TCP/IP
MESSAGING BETWEEN SHARED CLIENT MESSAGE MANAGER (SOACMGR) AND SHARED
SERVER MESSAGE MANAGER (SOASMGR).

THE SOA\MACLIB DIRECTORY CONTAINS THE FOLLOWING MACROS:
  1. SOAGEN - GENERATE SOA CLIENT SERVER APPLICATION
  2. SOACMGR - GENERATE SOA CLIENT MESSAGE MANAGER
  3. SOASMGR - GENERATE SOA SERVER MESSAGE MANAGER
  4. SOASTUB - GENERATE SOA STUB FOR SERVICE CALLS

THE SOA\DEMO DIRECTORY CONTAINS THE FOLLOWING DEMO FILES:
  1.  DEMOMAIN.MLC - DEMO MAIN PROGRAM CALLING TWO SERVICES
  2.  DEMOSUB1.MLC - DEMO SERVICE TO ADD TWO INTEGERS
  3.  DEMOSUB2.MLC - DEMO SERVICE TO ADD TWO DISPLAY SCIENTIFIC VALUES
  4.  DEMOSTD.BAT  - BUILD AND EXEC STANDARD STATICALLY LINKED DEMO  
  5.  DEMOSOA.MLC  = DEFINE DEMO SOA APPLICATION CLIENT AND SERVER    
  6.  CLEANUP.BAT  - DELETE ALL GENERATED FILES FROM DEMO DIRECTORY
  7.  DEMOSTOP.MLC - DEMO UTILITY TO SHUT DOWN SPECIFIED PORT SERVER
  8.  DEMOSTOP.BAT - BUILD AND EXECUTE DEMOSTOP TO SHUTDOWN DEMO 
SERVER

THE FOLLOWING FILES ARE GENERATED BY BLDSTD.BAT:

  1.  DEMOSOA1.390 - STATICALLY LINKED EXECUTABLE APPLICAITON

THE FOLLOWING SOURCE FILES ARE GENERATED BY DEMOSOA.BAT:

  1.  DEMOCMGR.MLC  - SOURCE TO GEN SOA CLIENT MSG MGR
  2.  DEMOSMGR.MLC  - SOURCE TO GEN SOA SERVER MSG MGR
  3.  SOA_STUB_DEMOSUB1.MLC - SOURCE TO GEN STUB FOR DEMOSUB1
  4.  SOA_STUB_DEMOSUB2.MLC - SOURCE TO GEN STUB FOR DEMOSUB2
  5.  DEMOBLD.BAT   - BUILD SOA EXECUTABLE APPLICATION MODULES
  6.  DEMORUN.BAT   - START DEMO SERVER, PAUSE, RUN CLIENT, STOP SERVER
  7.  DEMORUNS.BAT  - RUN DEMOSMGR SOA APPLICATION SERVER
  8.  DEMORUNC.BAT  - RUN DEMOMAIN SOA APPLICATION CLIENT 

THE FOLLOWING EXECUTABLE FILES ARE BUILT BY DEMOBLD.BAT:

  1.  DEMOCMGR.390  - SOA CLIENT MSG MGR LINKED TO FROM SOA STUBS
  2.  DEMOSMGR.390  - SOA SERVER WHICH LOADS SERVICES AS REQUIRED
  3.  DEMOMAIN.390 - SOA CLIENT APPLICATION LINKED WITH SERVICE STUBS
  4.  DEMOSUB1.390 - SOA SERVICE LOADED AND CALLED BY DEMOSMGR
  5.  DEMOSUB2.390 - SOA SERVIDE LOADED AND CALLED BY DEMOSMGR

THE DEMORUN.BAT FILE STARTS THE SOA SERVER DEMOSMGR AND THEN RUNS 
THE DEMOSOA1 CLIENT APPLICATION.

THE CONTROL FLOW FOR DEMOMAIN SOA EXECUTION IS AS FOLLOWS:

1.  DEMOSMGR SERVER OPENS TCP/IP SOCKETS HOST PORT AND LISTENS
    FOR MESSAGES FROM ANY CLIENTS.

2.  DEMOMAIN CLIENT APPLICATION STARTS UP AND ISSUES CALL TO 
    DEMOSUB1 SOA STUB STATICALLY LINKED CODE.
    
3.  DEMOSUB1 STUB CODE LOADS AND CALLS DEMOCMGR PASSING NAME OF 
    SERVICE CALL AND THE STANDARD CALLING PARM LIST FOR DEMOSUB1.
    
4.  DEMOCMGR FINDS MSG PROGESSING CODE FOR NAMED SERVICE, BUILDS
    MESSAGE WITH SERVICE NAME AND PARMS, AND SENDS MESSAGE TO
    SOA HOST SERVER VIA TCP/IP PORT, AND WAITS FOR REPSONSE.         

5.  DEMOSMGR RECEIVES MESSAGE, FINDS MSG PROCESSING CODE FOR NAMED
    SERVICE, BUILDS SERVICE PARMLIST FROM MESSAGE, LOADS SERVICE
    ON FIRST CALL, CALLS SERVICE WITH PARMS, BUILD RESPONSE MESSAGE
    WITH UPDATED PARMS SKIPPING READ ONLY PARMS PLUS RETURN CODE, AND
    SENDS RESPONSE MESSAGE, AND RETURNS TO WAIT FOR NEXT REQUEST MSG.

6.  DEMOCMGR RECEIVES RESPONSE MESSAGE, VERIFIES SERVICE TIME STAMP
    AND NAME MATCH, UPDATES ORIGINAL PARMS WITH RETURNED MESSAGE VALUES,
    AND EXITS TO CALLER WITH RETURN CODE FROM MESSAGE.

TO RUN THE DEMO AS STATICALLY LINKED LOCAL APPLICATION 
RUN SOA\DEMO\DEMOSTD.BAT

TO RUN THE DEMO AS SOA CLIENT SERVER APPLICATION 
RUN SOA\DEMO\DEMOSOA.BAT

TO SEE INSTRUCTION TRACE FOR ABOVE ADD OPTIONS TRACE CON

NOTICE THE MAJOR DIFFERENCE BETWEEN RUNNING DEMOSTD AND DEMOSOA IS
THAT FOR DEMOSTD ALL THE WTO'S APPEAR ON SINGLE DEMOMAIN.LOG AND 
FOR DEMOSOA, THE SERVER WTOS' APPEAR ON DEMOSMGR.LOG INSTEAD.

NOTE THE CLIENT DEMOMAIN CAN BE RUN REPEATEDLY WITH SAME SERVER RUNNING.

TO STOP THE SERVER, RUN SHUTDOWN.BAT 

FOR MORE INFORMATION VISIT WWW.Z390.ORG.

DON HIGGINS
DON@HIGGINS.NET