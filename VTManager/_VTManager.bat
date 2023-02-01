@ECHO OFF
setlocal enabledelayedexpansion
title VTManager
color 06
mode 40,30

if exist "Settings\VTFCdir.txt" (
	SET /p VTFC=<Settings\VTFCdir.txt
	GOTO VTFCSTART
) else (
    GOTO SETVTFCDIR
)

:SETVTFCDIR
cls
echo SELECT VTFCmd.exe
set cmd=Add-Type -AssemblyName System.Windows.Forms;$f=new-object                 Windows.Forms.OpenFileDialog;$f.InitialDirectory=        [environment]::GetFolderPath('Desktop');$f.Filter='VTFCmd.exe^|*.exe^|All         Files(*.*)^|*.*';$f.Multiselect=$true;[void]$f.ShowDialog();if($f.Multiselect)        {$f.FileNames}else{$f.FileName}
set pwshcmd=powershell -noprofile -command "&{%cmd%}"
for /f "tokens=* delims=" %%I in ('%pwshcmd%') do call :sum "%%I" RET
:sum [mud] [RET]
set FileName=%FileName% "%~1"
set RET=%FileName%
echo %RET%>Settings\VTFCdir_raw.txt

for /F "tokens=*" %%A in (Settings\VTFCdir_raw.txt) do (
  set line=%%A
echo(!line: =!>>Settings\VTFCdir.txt
)

del "Settings\VTFCdir_raw.txt"
SET /p VTFC=<Settings\VTFCdir.txt
GOTO VTFCSTART

:VTFCSTART

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

For /F tokens^=* %%i in ('type %TEMPLAT%
')do set /a "_cnt+=1+0" && call set "_var!_cnt!=%%~i" ) do (
)

For /F tokens^=* %%i in ('type %TEMPLAT_anim%
')do set /a "_cnt_anim+=1+0" && call set "_var_anim!_cnt_anim!=%%~i" ) do (
)

::   ________________________________________
::   ----------------------------------------

:: MAIN MENU


echo [33m________________________________________
echo ----------------------------------------
echo.
echo       Converts all [93mTGA[33m to [93mVTF[33m 
echo     and VTF to TGA that are in the
echo             OUTPUT folder
echo.
echo    Also generates [93mVMT[33m for the files
echo        from the VMTSettings.txt
echo.
echo ________________________________________
echo ----------------------------------------
echo.
echo  Files:
echo     VTF: [93m%_VTFcnt%[33m
echo     VMT: [93m%_VMTcnt%[33m
echo     TGA: [93m%_TGAcnt%[33m
echo.
echo  Tags:
echo     _anim: [93m%_cnt_anim%[33m
echo.
echo.
echo             Discord: [93m@Orangeprint#1170[33m
echo ________________________________________
echo -------[ Hit [93mENTER[33m to proceed. ]--------
SET choice=
SET /p choice=[93m

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
)


::   ________________________________________
::   ----------------------------------------

:: FPS select

IF %_cnt_anim% GTR 0 echo  [33m[ [93m%_cnt_anim%[33m ] _anim tag(s) found!
IF %_cnt_anim% GTR 0 set /p "FPS=[33m Animation FPS[93m : "

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
%VTFC% -folder "%cd%\OUTPUT\*.vtf" -output "%cd%\OUTPUT" -silent 
del "%cd%\OUTPUT\*.vtf"
del "%cd%\OUTPUT\ .vtf"
del "%cd%\OUTPUT\*.vmt"
del "Names-CONVRT_anim.txt"
del "Names-CONVRT.txt"
GOTO START
