@ECHO OFF
setlocal enabledelayedexpansion
title VTDnDrop
color 06
mode 40,30

:RESET
if exist "VTFCdir.txt" (
	SET /p VTFC=<VTFCdir.txt
	GOTO VTFCSTART
) else (
    GOTO SETVTFCDIR
)

:SETVTFCDIR
cls
echo [33m________________________________________
echo ----------------------------------------
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo           SELECT VTFCmd.exe
echo.
echo           IF YOU CANCEL THIS-
echo        YOU MUST REMOVE VTFCdir.txt
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo [33m________________________________________
echo ----------------------------------------





set cmd=Add-Type -AssemblyName System.Windows.Forms;$f=new-object                 Windows.Forms.OpenFileDialog;$f.InitialDirectory=        [environment]::GetFolderPath('Desktop');$f.Filter='VTFCmd.exe^|*.exe^|All         Files(*.*)^|*.*';$f.Multiselect=$true;[void]$f.ShowDialog();if($f.Multiselect)        {$f.FileNames}else{$f.FileName}
set pwshcmd=powershell -noprofile -command "&{%cmd%}"
for /f "tokens=* delims=" %%I in ('%pwshcmd%') do call :sum "%%I" RET
	:sum [mud] [RET]
	set FileName=%FileName% "%~1"
	set RET=%FileName%
	echo %RET%>VTFCdir_raw.txt

for /F "tokens=*" %%A in (VTFCdir_raw.txt) do (
  set line=%%A
echo(!line: =!>>VTFCdir.txt
)

del "VTFCdir_raw.txt"
SET /p VTFC=<VTFCdir.txt
GOTO VTFCSTART

:VTFCSTART

set "params=!cmdcmdline:~0,-1!"
set "params=!params:*" =!"
set count=0

for %%G IN (!params!) do (
  set /a count+=1
  set "item_!count!=%%~G"
)

echo [33m________________________________________
echo ----------------------------------------

echo.
echo  Processing [93m!count![33m Files(s).[93m
echo.

for /L %%n in (1,1,!count!) DO (
	echo.
	for /f %%f in ('dir /b !item_%%n!') do echo     %%n: %%f
	%VTFC% -folder "!item_%%n!" -output "%CD%" -format "I8" -alphaformat IA88 -silent 
)

if !count! EQU 0 GOTO NOFILES

echo.
echo [33m________________________________________
echo ----------------------------------------
pause>nul
EXIT


:NOFILES
echo [33m________________________________________
echo ----------------------------------------
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo         THIS IS A DRAG AND DROP
echo          CLOSE THIS WINDOW AND
echo           DRAG AND DROP FILES
echo             TO THE ICON TO
echo           CONVERT VTF TO TGA
echo             AND TGA TO VTF
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo [33m________________________________________
echo ----------------------------------------
pause>nul