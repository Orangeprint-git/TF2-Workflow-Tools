@ECHO OFF
setlocal enabledelayedexpansion
title VTManager
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

SET VTFC=VTFcmd\bin\x64\VTFCmd.exe

:VTFCSTART

SET pR=0
SET pG=0
SET pB=0

::   ________________________________________
::   ----------------------------------------

:: FILE DEFS

SET TEMPLAT=Names-CONVRT.txt
SET TEMPLAT_ANIM=Names-CONVRT_anim.txt

SET FOLDER=OUTPUT\
SET /p DIRECTORY=<VMTDirectory.txt

::   ________________________________________
::   ----------------------------------------

:: START OF FUNCTIONS
:START
cls

::   ________________________________________
::   ----------------------------------------

:: RESETS NUMBERS AND NAME FILES

break>%TEMPLAT%
break>%TEMPLAT_ANIM%
set _cnt=0
set _cntF=0
set _VTFcnt=None
set _TGAcnt=None
set _VMTcnt=None
set _cnt_anim=0
set _var_anim=0

::   ________________________________________
::   ----------------------------------------

:: OUTPUT FOLDER FILE COUNTS

for %%x in (OUTPUT\*.vtf) do set /a _VTFcnt+=1
for %%x in (OUTPUT\*.vmt) do set /a _VMTcnt+=1
for %%x in (OUTPUT\*.tga) do set /a _TGAcnt+=1

::   ________________________________________
::   ----------------------------------------

:: FILE NAME SETS

For %%A in ("OUTPUT\*.tga") do (echo %%~nA)|findstr /ive "_anim">> Names-CONVRT_spaces.txt
For %%A in ("OUTPUT\*.vtf") do (echo %%~nA)|findstr /ive "_anim">> Names-CONVRT_spaces.txt

For %%A in ("OUTPUT\*.tga") do (echo %%~nA)|findstr /i "_anim">> Names-CONVRT_anim_spaces.txt
For %%A in ("OUTPUT\*.vtf") do (echo %%~nA)|findstr /i "_anim">> Names-CONVRT_anim_spaces.txt

::   ________________________________________
::   ----------------------------------------

:: FIX FOR FILE NAMES ( REMOVES SPACES )

for /F "tokens=*" %%A in (Names-CONVRT_spaces.txt) do (
  set line=%%A
echo(!line: =!>>Names-CONVRT.txt
)

for /F "tokens=*" %%A in (Names-CONVRT_anim_spaces.txt) do (
  set line=%%A
echo(!line: =!>>Names-CONVRT_anim.txt
)

::   ________________________________________
::   ----------------------------------------

:: DELETES TEMP NAME FILES
del "Names-CONVRT_anim_spaces.txt"
del "Names-CONVRT_spaces.txt"

::   ________________________________________
::   ----------------------------------------

:: NAME COUNTS

For /F tokens^=* %%i in ('type %TEMPLAT%
')do set /a "_cnt+=1+0" && call set "_var!_cnt!=%%~i" ) do (
)

For /F tokens^=* %%i in ('type %TEMPLAT_anim%
')do set /a "_cnt_anim+=1+0" && call set "_var_anim!_cnt_anim!=%%~i" ) do (
)

::   ________________________________________
::   ----------------------------------------

:: MAIN MENU

set size=0
set MB=0
echo  %aRGB%________________________________________
echo  ----------------------------------------
echo.
echo.
echo       Converts all %bRGB%TGA%aRGB% to %bRGB%VTF%aRGB% 
echo     and VTF to TGA that are in the
echo             OUTPUT folder
echo.
echo    Also generates %bRGB%VMT%aRGB% for the files
echo        from the VMTSettings.txt
echo.
echo.
echo  ________________________________________
echo  ----------------------------------------
echo.
echo  Files:
echo     VTF: %bRGB%%_VTFcnt%%aRGB%
echo     VMT: %bRGB%%_VMTcnt%%aRGB%
echo     TGA: %bRGB%%_TGAcnt%%aRGB%
echo.
echo  Tags:
echo     _anim: %bRGB%%_cnt_anim%%aRGB%
echo.
echo  Size:
for /r %%x in (OUTPUT\*) do set /a size+=%%~zx
set /A MB=%size%/1048000
echo     %bRGB%%MB%%aRGB% MB ( %bRGB%%size%%aRGB% Bytes )
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

:: TGA/VTF detect

:DETIFVTFORTGA
if not exist "%cd%\OUTPUT\*.tga" (
    GOTO VTFTOTGA
    if not errorlevel 1 (
        GOTO TGATOVTF
    )
)

::   ________________________________________
::   ----------------------------------------

:: TGA TO VTF

:TGATOVTF
set size=0
set MB=0
cls
echo  %aRGB%________________________________________
echo  ----------------------------------------
echo.
echo.
echo.
echo.
echo    %bRGB%Please wait, this may take a while.%aRGB%
echo.
echo.
echo.
echo.
echo.
echo  ________________________________________
echo  ----------------------------------------
echo.
echo  Files:
echo     VTF: %bRGB%%_VTFcnt%%aRGB%
echo     VMT: %bRGB%%_VMTcnt%%aRGB%
echo     TGA: %bRGB%%_TGAcnt%%aRGB%
echo.
echo  Tags:
echo     _anim: %bRGB%%_cnt_anim%%aRGB%
echo.
echo  Size:
for /r %%x in (OUTPUT\*) do set /a size+=%%~zx
set /A MB=%size%/1048000
echo     %bRGB%%MB%%aRGB% MB ( %bRGB%%size%%aRGB% Bytes )
echo.
echo             Discord: %bRGB%@Orangeprint#1170%aRGB%
echo  ________________________________________
echo  ----------------------------------------

set VTFC=VTFcmd\bin\x64\VTFcmd.exe
%VTFC% -folder "%cd%\OUTPUT\*.tga" -output "%cd%\OUTPUT" -format "I8" -alphaformat IA88 -silent 
del "%cd%\OUTPUT\*.tga"

FOR /L %%A IN (1,1,%_cnt%
) DO (
	set XN=%%A
	call set FILEN=%%_var!XN!%%
	type VMTSettings.txt> %FOLDER%!FILEN!.vmt
	echo 	"$basetexture" "%DIRECTORY%!FILEN!.vtf">> %FOLDER%!FILEN!.vmt
	echo }>> %FOLDER%!FILEN!.vmt
	call :PROGRESSBAR
)


::   ________________________________________
::   ----------------------------------------

:: FPS select

IF %_cnt_anim% GTR 0 echo  %aRGB%[ %bRGB%%_cnt_anim%%aRGB% ] _anim tag(s) found!
IF %_cnt_anim% GTR 0 set /p "FPS=%aRGB% Animation FPS%bRGB% : "

::   ________________________________________
::   ----------------------------------------

:: ANIMATION VMT SETTINGS

FOR /L %%A IN (1,1,%_cnt_anim%
) DO (
	set XN=%%A
	call set FILEN=%%_var_anim!XN!%%
	type VMTSettings_anim.txt>> %FOLDER%!FILEN!.vmt
echo		"animatedTextureFrameRate" "%FPS%">> %FOLDER%!FILEN!.vmt
echo }>> %FOLDER%!FILEN!.vmt
	call :PROGRESSBAR
)

::   ________________________________________
::   ----------------------------------------

:: DELETES TEMP NAME FILES

del "Names-CONVRT_anim.txt"
del "Names-CONVRT.txt"
GOTO START

::   ________________________________________
::   ----------------------------------------

:: VTF TO TGA

:VTFTOTGA
set size=0
set MB=0
cls
echo  %aRGB%________________________________________
echo  ----------------------------------------
echo.
echo.
echo.
echo.
echo    %bRGB%Please wait, this may take a while.%aRGB%
echo.
echo.
echo.
echo.
echo.
echo  ________________________________________
echo  ----------------------------------------
echo.
echo  Files:
echo     VTF: %bRGB%%_VTFcnt%%aRGB%
echo     VMT: %bRGB%%_VMTcnt%%aRGB%
echo     TGA: %bRGB%%_TGAcnt%%aRGB%
echo.
echo  Tags:
echo     _anim: %bRGB%%_cnt_anim%%aRGB%
echo.
echo  Size:
for /r %%x in (OUTPUT\*) do set /a size+=%%~zx
set /A MB=%size%/1048000
echo     %bRGB%%MB%%aRGB% MB ( %bRGB%%size%%aRGB% Bytes )
echo.
echo             Discord: %bRGB%@Orangeprint#1170%aRGB%
echo ________________________________________
echo ----------------------------------------
%VTFC% -folder "%cd%\OUTPUT\*.vtf" -output "%cd%\OUTPUT" -silent
del "%cd%\OUTPUT\*.vtf"
del "%cd%\OUTPUT\ .vtf"
del "%cd%\OUTPUT\*.vmt"
del "Names-CONVRT_anim.txt"
del "Names-CONVRT.txt"
GOTO START


::   ________________________________________
::   ----------------------------------------

:: PROGRESS BAR

:PROGRESSBAR
if !pR! LEQ 0 SET pR=0
if !pG! LEQ 0 SET pG=0
if !pB! LEQ 0 SET pB=0
if !pR! GTR 247  SET pR=247 
if !pG! GTR 128  SET pG=128 
if !pB! GTR 42   SET pB=42   

chcp 65001 > nul
FOR /L  %%A IN (1,1,1) DO (
		cls
		echo.
		echo  %bRGB%Writing VMT files.%aRGB%
		echo.
		SET /a pR+=7
		SET /a pG+=4
		SET /a pB+=2
		
		call set BAR=[38;2;!pR!;!pG!;!pB!m█!BAR!
		ECHO !BAR!
    )
)
chcp 1252 >nul
