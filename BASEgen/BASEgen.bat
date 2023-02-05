@ECHO OFF
setlocal enabledelayedexpansion
title VTF : VMT Gen
mode 42,30

::Color theme main 
SET aR=247
SET aG=128
SET aB=42

::Color theme highlight
SET bR=0
SET bG=255
SET bB=255

SET aRGB=[38;2;!aR!;!aG!;!aB!m
SET bRGB=[38;2;!bR!;!bG!;!bB!m

::Directory setting file
SET TEMPLAT=Names.txt


:: Names.txt line count
[33m 2>nul
For /F tokens^=* %%i in ('type %TEMPLAT%
')do set /a "_cnt+=1+0" && call set "_var!_cnt!=%%~i" ) do (
)


:: MAIN MENU

set size=0
set MB=0
echo  %aRGB%________________________________________
echo  ----------------------------------------
echo.
echo.
echo.
echo          Generates %bRGB%VTF%aRGB% from base
echo              and writes %bRGB%VMT%aRGB%
echo.
echo.
echo.
echo.
echo.
echo  ________________________________________
echo  ----------------------------------------
echo.
echo.
echo  Name.txt count:
echo     %bRGB%%_cnt%%aRGB% Files to be generated from base.
echo.
echo.
echo  Estimated size:
for /r %%x in (BASE.vtf) do set /a size+=%%~zx 2>nul >nul
set /A MB=%size% / 1048000 * %_cnt% 2>nul >nul
echo     %bRGB%%MB%%aRGB% MB ( %bRGB%%size%%aRGB% Bytes )
echo.
echo.
echo.
echo             Discord: %bRGB%@Orangeprint#1170%aRGB%
echo  ________________________________________
echo  -------[ Hit %bRGB%ENTER%aRGB% to proceed. ]--------
SET choice=
SET /p choice=%bRGB%

	IF NOT '%choice%'=='' SET choice=%choice:~0,1%
	
	IF '%choice%'=='' GOTO DETIFVTFORTGA 



::   ________________________________________
::   ----------------------------------------

FOR /L %%A IN (1,1,%_cnt%
) DO (
	set XN=%%A
	call set FILEN=%%_var!XN!%%
	copy /y BASE.vtf .\OUTPUT\!FILEN!.vtf 2>nul >nul
	echo  %bRGB%!XN!:%aRGB% Files generated.
)


echo.
pause