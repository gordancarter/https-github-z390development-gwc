rem regression test zcobol to z390 assenbker programs
rem run pgms and gen dif reports
echo off
rem
rem cbl to z390 regression tests
rem
call ZCCLEAN1 zcobol\test *
erase zcobol\test\z390\*.* /q
REM TESTCAL3+TESTASM4 STATIC LINKED
CALL ASM      ZCOBOL\TEST\TESTASM4 notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
CALL ZC390CL  ZCOBOL\TEST\TESTCAL3 notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
REM TESTCAL1+TESTCAL2 STATIC LINKED WITH TESTCAL2 DYNAMIC CALL TO TESTCAL3
CALL ZC390C   ZCOBOL\TEST\TESTCAL2 notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
CALL ZC390CLG ZCOBOL\TEST\TESTCAL1 notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
REM MISC REGRESSION TESTS IN ALPHA ORDER
call ZC390CLG zcobol\test\TESTCMP1 notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
call ZC390CLG zcobol\test\TESTCPY1 notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
call ZC390CLG zcobol\test\TESTCPY2 notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
call ZC390CLG zcobol\test\TESTDSP1 notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
call ZC390CLG zcobol\test\TESTFUN1 notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
call ZC390CLG zcobol\test\TESTIF1  notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
call ZC390CLG zcobol\test\TESTISP1 notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
call ZC390CLG zcobol\test\TESTMOV1 notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
call ZC390CLG zcobol\test\TESTPM1  notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
call ZC390CLG zcobol\test\TESTSIX1 notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
call ZC390CLG zcobol\test\TESTTRC1 notiming stats TRUNC %1 %2 %3 %4 %5 %6 %7 %8 %9
call ZC390CLG zcobol\test\TESTTRC2 notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
call ZC390CLG zcobol\test\TESTTRC3 notiming stats TRUNC NOR64 %1 %2 %3 %4 %5 %6 %7 %8 %9
call ZC390CLG zcobol\test\TESTWS1  notiming stats %1 %2 %3 %4 %5 %6 %7 %8 %9
copy zcobol\test\*.* zcobol\test\z390
rem
rem compare generated files to saved files to create dif file with changes
rem
erase zcobol\test\z390\dif\*.* /q
call rt\RTCOMP zcobol\test\z390 zcobol\test\z390\save zcobol\test\z390\dif
call rt\RTLIST zcobol\test\z390\dif
rem end of rtzcob.bat
