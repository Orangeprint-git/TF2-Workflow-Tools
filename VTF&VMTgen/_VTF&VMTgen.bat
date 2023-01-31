@ECHO OFF
setlocal enabledelayedexpansion
title VTF : VMT Gen
color 06
mode 40,30

SET FOLDER=OUTPUT\

SET /p DIRECTORY=<VMTDirectory.txt


:START
SET TEMPLAT=Names.txt
SET _cnt=0
cls
echo [33m________________________________________
echo ----------------------------------------
echo.
echo.
echo.
echo.
echo.
echo    Set custom file names in Names.txt
echo     Configure VMT in VMTSettings.txt
echo.
echo    You can generate up to [93m100[33m files
echo                 at a time.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo             Discord: [93m@Orangeprint#1170[33m
echo ________________________________________
echo ----------------------------------------
echo.
echo  [ Y ] Choose Regular Name.txt
echo  [ T ] Choose from templates.
echo  [ C ] Choose any .txt you want to use.
echo.
echo ________________________________________
echo --------[ Hit [93mENTER[33m to Reload. ]--------
SET choice=
SET /p choice=Command: [93m:

	IF NOT '%choice%'=='' SET choice=%choice:~0,1%
	
	IF '%choice%'=='' GOTO START 
	
	IF '%choice%'=='y' GOTO NAMTXTDEF
	IF '%choice%'=='Y GOTO NAMTXTDEF
	IF '%choice%'=='n' GOTO RXIT
	IF '%choice%'=='N' GOTO EXIT
	
	IF '%choice%'=='c' GOTO CUSTXT
	IF '%choice%'=='C' GOTO CUSTXT
	
	IF '%choice%'=='t' GOTO SELTEMPLT
	IF '%choice%'=='T' GOTO START


:NAMTXTDEF
[33m 2>nul
SET TEMPLAT=Names.txt
GOTO SETVAR

:CUSTXT
set cmd=Add-Type -AssemblyName System.Windows.Forms;$f=new-object                 Windows.Forms.OpenFileDialog;$f.InitialDirectory=        [environment]::GetFolderPath('Desktop');$f.Filter='Text Files(*.txt)^|*.txt^|All         Files(*.*)^|*.*';$f.Multiselect=$true;[void]$f.ShowDialog();if($f.Multiselect)        {$f.FileNames}else{$f.FileName}
set pwshcmd=powershell -noprofile -command "&{%cmd%}"
for /f "tokens=* delims=" %%I in ('%pwshcmd%') do call :sum "%%I" ret
:sum [mud] [ret]
set FileName=%FileName% "%~1"
set ret=%FileName%
SET TEMPLAT=%ret%
GOTO SETVAR

:SELTEMPLT
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
echo.
echo             Discord: [93m@Orangeprint#1170[33m
echo ________________________________________
echo ----------------------------------------
echo.
for /F "tokens=1,*delims=[]" %%i in ('dir /b /a:-d Templates\*.txt ^| find /v /n ""') do (
    echo  [93m%%i:[33m %%j
    set "cnt=!cnt!%%i"
    set "fchoice%%i=%%~j"
)
echo.
echo ________________________________________
echo ----------------------------------------

choice /c %cnt% /m "Choose:"
SET TEMPLAT=Templates\!fchoice%errorlevel%!


:SETVAR
[33m 2>nul
For /F tokens^=* %%i in ('type %TEMPLAT%
')do set /a "_cnt+=1+0" && call set "_var!_cnt!=%%~i" ) do (
)

:NAMTXTDEF
cls
echo [33m________________________________________
echo ----------------------------------------
echo.
echo.
echo.
echo.
echo       Set file names in Names.txt
echo      Configure VMT in VMTSettings.txt
echo.
echo    You can generate up to [93m100[33m files
echo                 at a time.
echo.
echo.
echo.
echo.
echo.
echo.
echo             Discord: [93m@Orangeprint#1170[33m
echo ________________________________________
echo ----------------------------------------
echo.
echo  File: %TEMPLAT%
echo.
echo   Generating:
echo   [93m!_cnt![33m VTF Files.
echo   [93m!_cnt![33m VMT Files.
echo.
echo ________________________________________
echo -------[ Hit [93mENTER[33m to confirm. ]--------
pause >NUL
cls
IF "%_var1%"=="" (echo  [31mNo file names set.[33m) else (
	echo  [93m1:[33m %_var1%.vtf
	echo     %_var1%.vtf
	echo > %FOLDER%%_var1%.vtf
	type VMTSettings.txt > %FOLDER%%_var1%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var1%.vtf" >> %FOLDER%%_var1%.vmt
	echo } >> %FOLDER%%_var1%.vmt
)

IF "%_var2%"=="" (echo 2>nul) >nul else (
	echo  [93m2:[33m %_var2%.vtf
	echo > %FOLDER%%_var2%.vtf
	type VMTSettings.txt > %FOLDER%%_var2%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var2%.vtf" >> %FOLDER%%_var2%.vmt
	echo } >> %FOLDER%%_var2%.vmt
)

IF "%_var3%"=="" (echo 2>nul) >nul else (
	echo  [93m3:[33m %_var3%.vtf
	echo > %FOLDER%%_var3%.vtf
	type VMTSettings.txt > %FOLDER%%_var3%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var3%.vtf" >> %FOLDER%%_var3%.vmt
	echo } >> %FOLDER%%_var3%.vmt
)
 
IF "%_var4%"=="" (echo 2>nul) >nul else (
	echo  [93m4:[33m %_var4%.vtf
	echo > %FOLDER%%_var4%.vtf
	type VMTSettings.txt > %FOLDER%%_var4%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var4%.vtf" >> %FOLDER%%_var4%.vmt
	echo } >> %FOLDER%%_var4%.vmt
)
 
IF "%_var5%"=="" (echo 2>nul) >nul else (
	echo  [93m5:[33m %_var5%.vtf
	echo > %FOLDER%%_var5%.vtf
	type VMTSettings.txt > %FOLDER%%_var5%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var5%.vtf" >> %FOLDER%%_var5%.vmt
	echo } >> %FOLDER%%_var5%.vmt
)
 
IF "%_var6%"=="" (echo 2>nul) >nul else (
	echo  [93m6:[33m %_var6%.vtf
	echo > %FOLDER%%_var6%.vtf
	type VMTSettings.txt > %FOLDER%%_var6%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var6%.vtf" >> %FOLDER%%_var6%.vmt
	echo } >> %FOLDER%%_var6%.vmt
)
 
IF "%_var7%"=="" (echo 2>nul) >nul else (
	echo  [93m7:[33m %_var7%.vtf
	echo > %FOLDER%%_var7%.vtf
	type VMTSettings.txt > %FOLDER%%_var6%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var6%.vtf" >> %FOLDER%%_var7%.vmt
	echo } >> %FOLDER%%_var7%.vmt
)
 
IF "%_var8%"=="" (echo 2>nul) >nul else (
	echo  [93m8:[33m %_var8%.vtf
	echo > %FOLDER%%_var8%.vtf
	type VMTSettings.txt > %FOLDER%%_var7%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var8%.vtf" >> %FOLDER%%_var8%.vmt
	echo } >> %FOLDER%%_var8%.vmt
)
 
IF "%_var9%"=="" (echo 2>nul) >nul else (
	echo  [93m9:[33m %_var9%.vtf
	echo > %FOLDER%%_var9%.vtf
	type VMTSettings.txt > %FOLDER%%_var9%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var8%.vtf" >> %FOLDER%%_var9%.vmt
	echo } >> %FOLDER%%_var9%.vmt
)

IF "%_var10%"=="" (echo 2>nul) >nul else (
	echo  [93m10:[33m %_var10%.vtf
	echo > %FOLDER%%_var10%.vtf
	type VMTSettings.txt > %FOLDER%%_var10%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var8%.vtf" >> %FOLDER%%_var10%.vmt
	echo } >> %FOLDER%%_var10%.vmt
)

IF "%_var11%"=="" (echo 2>nul) >nul else (
	echo  [93m11:[33m %_var11%.vtf
	echo > %FOLDER%%_var11%.vtf
	type VMTSettings.txt > %FOLDER%%_var11%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var11%.vtf" >> %FOLDER%%_var11%.vmt
	echo } >> %FOLDER%%_var11%.vmt
)

IF "%_var12%"=="" (echo 2>nul) >nul else (
	echo  [93m12:[33m %_var12%.vtf
	echo > %FOLDER%%_var12%.vtf
	type VMTSettings.txt > %FOLDER%%_var12%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var12%.vtf" >> %FOLDER%%_var12%.vmt
	echo } >> %FOLDER%%_var12%.vmt
)

IF "%_var13%"=="" (echo 2>nul) >nul else (
	echo  [93m13:[33m %_var13%.vtf
	echo > %FOLDER%%_var13%.vtf
	type VMTSettings.txt > %FOLDER%%_var13%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var13%.vtf" >> %FOLDER%%_var13%.vmt
	echo } >> %FOLDER%%_var13%.vmt
)
 
IF "%_var14%"=="" (echo 2>nul) >nul else (
	echo  [93m14:[33m %_var14%.vtf
	echo > %FOLDER%%_var14%.vtf
	type VMTSettings.txt > %FOLDER%%_var14%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var14%.vtf" >> %FOLDER%%_var14%.vmt
	echo } >> %FOLDER%%_var14%.vmt
)
 
IF "%_var15%"=="" (echo 2>nul) >nul else (
	echo  [93m15:[33m %_var15%.vtf
	echo > %FOLDER%%_var15%.vtf
	type VMTSettings.txt > %FOLDER%%_var15%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var15%.vtf" >> %FOLDER%%_var15%.vmt
	echo } >> %FOLDER%%_var15%.vmt
)
 
IF "%_var16%"=="" (echo 2>nul) >nul else (
	echo  [93m16:[33m %_var16%.vtf
	echo > %FOLDER%%_var16%.vtf
	type VMTSettings.txt > %FOLDER%%_var16%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var16%.vtf" >> %FOLDER%%_var16%.vmt
	echo } >> %FOLDER%%_var16%.vmt
)
 
IF "%_var17%"=="" (echo 2>nul) >nul else (
	echo  [93m17:[33m %_var17%.vtf
	echo > %FOLDER%%_var17%.vtf
	type VMTSettings.txt > %FOLDER%%_var17%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var17%.vtf" >> %FOLDER%%_var17%.vmt
	echo } >> %FOLDER%%_var17%.vmt
)
 
IF "%_var18%"=="" (echo 2>nul) >nul else (
	echo  [93m18:[33m %_var18%.vtf
	echo > %FOLDER%%_var18%.vtf
	type VMTSettings.txt > %FOLDER%%_var18%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var18%.vtf" >> %FOLDER%%_var18%.vmt
	echo } >> %FOLDER%%_var18%.vmt
)
 
IF "%_var19%"=="" (echo 2>nul) >nul else (
	echo  [93m19:[33m %_var19%.vtf
	echo > %FOLDER%%_var19%.vtf
	type VMTSettings.txt > %FOLDER%%_var19%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var19%.vtf" >> %FOLDER%%_var19%.vmt
	echo } >> %FOLDER%%_var19%.vmt
)

IF "%_var20%"=="" (echo 2>nul) >nul else (
	echo  [93m20:[33m %_var20%.vtf
	echo > %FOLDER%%_var20%.vtf
	type VMTSettings.txt > %FOLDER%%_var20%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var20%.vtf" >> %FOLDER%%_var20%.vmt
	echo } >> %FOLDER%%_var20%.vmt
)

IF "%_var21%"=="" (echo 2>nul) >nul else (
	echo  [93m21:[33m %_var21%.vtf
	echo > %FOLDER%%_var21%.vtf
	type VMTSettings.txt > %FOLDER%%_var21%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var21%.vtf" >> %FOLDER%%_var21%.vmt
	echo } >> %FOLDER%%_var21%.vmt
)

IF "%_var23%"=="" (echo 2>nul) >nul else (
	echo  [93m23:[33m %_var23%.vtf
	echo > %FOLDER%%_var23%.vtf
	type VMTSettings.txt > %FOLDER%%_var23%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var23%.vtf" >> %FOLDER%%_var23%.vmt
	echo } >> %FOLDER%%_var23%.vmt
)

IF "%_var24%"=="" (echo 2>nul) >nul else (
	echo  [93m24:[33m %_var24%.vtf
	echo > %FOLDER%%_var24%.vtf
	type VMTSettings.txt > %FOLDER%%_var24%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var24%.vtf" >> %FOLDER%%_var24%.vmt
	echo } >> %FOLDER%%_var24%.vmt
)

IF "%_var25%"=="" (echo 2>nul) >nul else (
	echo  [93m25:[33m %_var25%.vtf
	echo > %FOLDER%%_var25%.vtf
	type VMTSettings.txt > %FOLDER%%_var25%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var25%.vtf" >> %FOLDER%%_var25%.vmt
	echo } >> %FOLDER%%_var25%.vmt
)

IF "%_var26%"=="" (echo 2>nul) >nul else (
	echo  [93m26:[33m %_var26%.vtf
	echo > %FOLDER%%_var26%.vtf
	type VMTSettings.txt > %FOLDER%%_var26%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var26%.vtf" >> %FOLDER%%_var26%.vmt
	echo } >> %FOLDER%%_var26%.vmt
)

IF "%_var27%"=="" (echo 2>nul) >nul else (
	echo  [93m27:[33m %_var27%.vtf
	echo > %FOLDER%%_var27%.vtf
	type VMTSettings.txt > %FOLDER%%_var27%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var27%.vtf" >> %FOLDER%%_var27%.vmt
	echo } >> %FOLDER%%_var27%.vmt
)

IF "%_var28%"=="" (echo 2>nul) >nul else (
	echo  [93m28:[33m %_var28%.vtf
	echo > %FOLDER%%_var28%.vtf
	type VMTSettings.txt > %FOLDER%%_var28%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var28%.vtf" >> %FOLDER%%_var28%.vmt
	echo } >> %FOLDER%%_var28%.vmt
)

IF "%_var29%"=="" (echo 2>nul) >nul else (
	echo  [93m29:[33m %_var29%.vtf
	echo > %FOLDER%%_var29%.vtf
	type VMTSettings.txt > %FOLDER%%_var29%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var29%.vtf" >> %FOLDER%%_var29%.vmt
	echo } >> %FOLDER%%_var29%.vmt
)

IF "%_var30%"=="" (echo 2>nul) >nul else (
	echo  [93m30:[33m %_var30%.vtf
	echo > %FOLDER%%_var30%.vtf
	type VMTSettings.txt > %FOLDER%%_var30%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var30%.vtf" >> %FOLDER%%_var30%.vmt
	echo } >> %FOLDER%%_var30%.vmt
)

IF "%_var31%"=="" (echo 2>nul) >nul else (
	echo  [93m31:[33m %_var31%.vtf
	echo > %FOLDER%%_var31%.vtf
	type VMTSettings.txt > %FOLDER%%_var31%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var31%.vtf" >> %FOLDER%%_var31%.vmt
	echo } >> %FOLDER%%_var31%.vmt
)

IF "%_var32%"=="" (echo 2>nul) >nul else (
	echo  [93m32:[33m %_var32%.vtf
	echo > %FOLDER%%_var32%.vtf
	type VMTSettings.txt > %FOLDER%%_var32%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var32%.vtf" >> %FOLDER%%_var32%.vmt
	echo } >> %FOLDER%%_var32%.vmt
)

IF "%_var33%"=="" (echo 2>nul) >nul else (
	echo  [93m33:[33m %_var33%.vtf
	echo > %FOLDER%%_var33%.vtf
	type VMTSettings.txt > %FOLDER%%_var33%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var33%.vtf" >> %FOLDER%%_var33%.vmt
	echo } >> %FOLDER%%_var33%.vmt
)

IF "%_var34%"=="" (echo 2>nul) >nul else (
	echo  [93m34:[33m %_var34%.vtf
	echo > %FOLDER%%_var34%.vtf
	type VMTSettings.txt > %FOLDER%%_var34%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var34%.vtf" >> %FOLDER%%_var34%.vmt
	echo } >> %FOLDER%%_var34%.vmt
)

IF "%_var35%"=="" (echo 2>nul) >nul else (
	echo  [93m35:[33m %_var35%.vtf
	echo > %FOLDER%%_var35%.vtf
	type VMTSettings.txt > %FOLDER%%_var35%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var35%.vtf" >> %FOLDER%%_var35%.vmt
	echo } >> %FOLDER%%_var35%.vmt
)

IF "%_var36%"=="" (echo 2>nul) >nul else (
	echo  [93m36:[33m %_var36%.vtf
	echo > %FOLDER%%_var36%.vtf
	type VMTSettings.txt > %FOLDER%%_var36%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var36%.vtf" >> %FOLDER%%_var36%.vmt
	echo } >> %FOLDER%%_var36%.vmt
)

IF "%_var37%"=="" (echo 2>nul) >nul else (
	echo  [93m37:[33m %_var37%.vtf
	echo > %FOLDER%%_var37%.vtf
	type VMTSettings.txt > %FOLDER%%_var37%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var37%.vtf" >> %FOLDER%%_var37%.vmt
	echo } >> %FOLDER%%_var37%.vmt
)

IF "%_var38%"=="" (echo 2>nul) >nul else (
	echo  [93m38:[33m %_var38%.vtf
	echo > %FOLDER%%_var38%.vtf
	type VMTSettings.txt > %FOLDER%%_var38%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var38%.vtf" >> %FOLDER%%_var38%.vmt
	echo } >> %FOLDER%%_var38%.vmt
)

IF "%_var39%"=="" (echo 2>nul) >nul else (
	echo  [93m39:[33m %_var39%.vtf
	echo > %FOLDER%%_var39%.vtf
	type VMTSettings.txt > %FOLDER%%_var39%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var39%.vtf" >> %FOLDER%%_var39%.vmt
	echo } >> %FOLDER%%_var39%.vmt
)

IF "%_var40%"=="" (echo 2>nul) >nul else (
	echo  [93m40:[33m %_var40%.vtf
	echo > %FOLDER%%_var40%.vtf
	type VMTSettings.txt > %FOLDER%%_var40%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var40%.vtf" >> %FOLDER%%_var40%.vmt
	echo } >> %FOLDER%%_var40%.vmt
)

IF "%_var41%"=="" (echo 2>nul) >nul else (
	echo  [93m41:[33m %_var41%.vtf
	echo > %FOLDER%%_var41%.vtf
	type VMTSettings.txt > %FOLDER%%_var41%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var41%.vtf" >> %FOLDER%%_var41%.vmt
	echo } >> %FOLDER%%_var41%.vmt
)

IF "%_var42%"=="" (echo 2>nul) >nul else (
	echo  [93m42:[33m %_var42%.vtf
	echo > %FOLDER%%_var42%.vtf
	type VMTSettings.txt > %FOLDER%%_var42%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var42%.vtf" >> %FOLDER%%_var42%.vmt
	echo } >> %FOLDER%%_var42%.vmt
)

IF "%_var43%"=="" (echo 2>nul) >nul else (
	echo  [93m43:[33m %_var43%.vtf
	echo > %FOLDER%%_var43%.vtf
	type VMTSettings.txt > %FOLDER%%_var43%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var43%.vtf" >> %FOLDER%%_var43%.vmt
	echo } >> %FOLDER%%_var43%.vmt
)

IF "%_var44%"=="" (echo 2>nul) >nul else (
	echo  [93m44:[33m %_var44%.vtf
	echo > %FOLDER%%_var44%.vtf
	type VMTSettings.txt > %FOLDER%%_var44%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var44%.vtf" >> %FOLDER%%_var44%.vmt
	echo } >> %FOLDER%%_var44%.vmt
)

IF "%_var45%"=="" (echo 2>nul) >nul else (
	echo  [93m45:[33m %_var45%.vtf
	echo > %FOLDER%%_var45%.vtf
	type VMTSettings.txt > %FOLDER%%_var45%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var45%.vtf" >> %FOLDER%%_var45%.vmt
	echo } >> %FOLDER%%_var45%.vmt
)

IF "%_var46%"=="" (echo 2>nul) >nul else (
	echo  [93m46:[33m %_var46%.vtf
	echo > %FOLDER%%_var46%.vtf
	type VMTSettings.txt > %FOLDER%%_var46%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var46%.vtf" >> %FOLDER%%_var46%.vmt
	echo } >> %FOLDER%%_var46%.vmt
)

IF "%_var47%"=="" (echo 2>nul) >nul else (
	echo  [93m47:[33m %_var47%.vtf
	echo > %FOLDER%%_var47%.vtf
	type VMTSettings.txt > %FOLDER%%_var47%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var47%.vtf" >> %FOLDER%%_var47%.vmt
	echo } >> %FOLDER%%_var47%.vmt
)

IF "%_var48%"=="" (echo 2>nul) >nul else (
	echo  [93m48:[33m %_var48%.vtf
	echo > %FOLDER%%_var48%.vtf
	type VMTSettings.txt > %FOLDER%%_var48%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var48%.vtf" >> %FOLDER%%_var48%.vmt
	echo } >> %FOLDER%%_var48%.vmt
)

IF "%_var49%"=="" (echo 2>nul) >nul else (
	echo  [93m49:[33m %_var49%.vtf
	echo > %FOLDER%%_var49%.vtf
	type VMTSettings.txt > %FOLDER%%_var49%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var49%.vtf" >> %FOLDER%%_var49%.vmt
	echo } >> %FOLDER%%_var49%.vmt
)

IF "%_var50%"=="" (echo 2>nul) >nul else (
	echo  [93m50:[33m %_var50%.vtf
	echo > %FOLDER%%_var50%.vtf
	type VMTSettings.txt > %FOLDER%%_var50%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var50%.vtf" >> %FOLDER%%_var50%.vmt
	echo } >> %FOLDER%%_var50%.vmt
)

IF "%_var51%"=="" (echo 2>nul) >nul else (
	echo  [93m51:[33m %_var51%.vtf
	echo > %FOLDER%%_var51%.vtf
	type VMTSettings.txt > %FOLDER%%_var51%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var51%.vtf" >> %FOLDER%%_var51%.vmt
	echo } >> %FOLDER%%_var51%.vmt
)

IF "%_var52%"=="" (echo 2>nul) >nul else (
	echo  [93m52:[33m %_var52%.vtf
	echo > %FOLDER%%_var52%.vtf
	type VMTSettings.txt > %FOLDER%%_var52%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var52%.vtf" >> %FOLDER%%_var52%.vmt
	echo } >> %FOLDER%%_var52%.vmt
)

IF "%_var53%"=="" (echo 2>nul) >nul else (
	echo  [93m53:[33m %_var53%.vtf
	echo > %FOLDER%%_var53%.vtf
	type VMTSettings.txt > %FOLDER%%_var53%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var53%.vtf" >> %FOLDER%%_var53%.vmt
	echo } >> %FOLDER%%_var53%.vmt
)

IF "%_var54%"=="" (echo 2>nul) >nul else (
	echo  [93m54:[33m %_var54%.vtf
	echo > %FOLDER%%_var54%.vtf
	type VMTSettings.txt > %FOLDER%%_var54%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var54%.vtf" >> %FOLDER%%_var54%.vmt
	echo } >> %FOLDER%%_var54%.vmt
)

IF "%_var55%"=="" (echo 2>nul) >nul else (
	echo  [93m55:[33m %_var55%.vtf
	echo > %FOLDER%%_var55%.vtf
	type VMTSettings.txt > %FOLDER%%_var55%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var55%.vtf" >> %FOLDER%%_var55%.vmt
	echo } >> %FOLDER%%_var55%.vmt
)

IF "%_var56%"=="" (echo 2>nul) >nul else (
	echo  [93m56:[33m %_var56%.vtf
	echo > %FOLDER%%_var56%.vtf
	type VMTSettings.txt > %FOLDER%%_var56%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var56%.vtf" >> %FOLDER%%_var56%.vmt
	echo } >> %FOLDER%%_var56%.vmt
)

IF "%_var57%"=="" (echo 2>nul) >nul else (
	echo  [93m57:[33m %_var57%.vtf
	echo > %FOLDER%%_var57%.vtf
	type VMTSettings.txt > %FOLDER%%_var57%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var57%.vtf" >> %FOLDER%%_var57%.vmt
	echo } >> %FOLDER%%_var57%.vmt
)

IF "%_var58%"=="" (echo 2>nul) >nul else (
	echo  [93m58:[33m %_var58%.vtf
	echo > %FOLDER%%_var58%.vtf
	type VMTSettings.txt > %FOLDER%%_var58%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var58%.vtf" >> %FOLDER%%_var58%.vmt
	echo } >> %FOLDER%%_var58%.vmt
)

IF "%_var59%"=="" (echo 2>nul) >nul else (
	echo  [93m59:[33m %_var59%.vtf
	echo > %FOLDER%%_var59%.vtf
	type VMTSettings.txt > %FOLDER%%_var59%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var59%.vtf" >> %FOLDER%%_var59%.vmt
	echo } >> %FOLDER%%_var59%.vmt
)

IF "%_var60%"=="" (echo 2>nul) >nul else (
	echo  [93m60:[33m %_var60%.vtf
	echo > %FOLDER%%_var60%.vtf
	type VMTSettings.txt > %FOLDER%%_var60%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var60%.vtf" >> %FOLDER%%_var60%.vmt
	echo } >> %FOLDER%%_var60%.vmt
)

IF "%_var61%"=="" (echo 2>nul) >nul else (
	echo  [93m61:[33m %_var61%.vtf
	echo > %FOLDER%%_var61%.vtf
	type VMTSettings.txt > %FOLDER%%_var61%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var61%.vtf" >> %FOLDER%%_var61%.vmt
	echo } >> %FOLDER%%_var61%.vmt
)

IF "%_var62%"=="" (echo 2>nul) >nul else (
	echo  [93m62:[33m %_var62%.vtf
	echo > %FOLDER%%_var62%.vtf
	type VMTSettings.txt > %FOLDER%%_var62%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var62%.vtf" >> %FOLDER%%_var62%.vmt
	echo } >> %FOLDER%%_var62%.vmt
)

IF "%_var63%"=="" (echo 2>nul) >nul else (
	echo  [93m63:[33m %_var63%.vtf
	echo > %FOLDER%%_var63%.vtf
	type VMTSettings.txt > %FOLDER%%_var63%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var63%.vtf" >> %FOLDER%%_var63%.vmt
	echo } >> %FOLDER%%_var63%.vmt
)

IF "%_var64%"=="" (echo 2>nul) >nul else (
	echo  [93m64:[33m %_var64%.vtf
	echo > %FOLDER%%_var64%.vtf
	type VMTSettings.txt > %FOLDER%%_var64%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var64%.vtf" >> %FOLDER%%_var64%.vmt
	echo } >> %FOLDER%%_var64%.vmt
)

IF "%_var65%"=="" (echo 2>nul) >nul else (
	echo  [93m65:[33m %_var65%.vtf
	echo > %FOLDER%%_var65%.vtf
	type VMTSettings.txt > %FOLDER%%_var65%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var65%.vtf" >> %FOLDER%%_var65%.vmt
	echo } >> %FOLDER%%_var65%.vmt
)

IF "%_var66%"=="" (echo 2>nul) >nul else (
	echo  [93m66:[33m %_var66%.vtf
	echo > %FOLDER%%_var66%.vtf
	type VMTSettings.txt > %FOLDER%%_var66%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var66%.vtf" >> %FOLDER%%_var66%.vmt
	echo } >> %FOLDER%%_var66%.vmt
)

IF "%_var67%"=="" (echo 2>nul) >nul else (
	echo  [93m67:[33m %_var67%.vtf
	echo > %FOLDER%%_var67%.vtf
	type VMTSettings.txt > %FOLDER%%_var67%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var67%.vtf" >> %FOLDER%%_var67%.vmt
	echo } >> %FOLDER%%_var67%.vmt
)

IF "%_var68%"=="" (echo 2>nul) >nul else (
	echo  [93m68:[33m %_var68%.vtf
	echo > %FOLDER%%_var68%.vtf
	type VMTSettings.txt > %FOLDER%%_var68%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var68%.vtf" >> %FOLDER%%_var68%.vmt
	echo } >> %FOLDER%%_var68%.vmt
)

IF "%_var69%"=="" (echo 2>nul) >nul else (
	echo  [93m69:[33m %_var69%.vtf
	echo > %FOLDER%%_var69%.vtf
	type VMTSettings.txt > %FOLDER%%_var69%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var69%.vtf" >> %FOLDER%%_var69%.vmt
	echo } >> %FOLDER%%_var69%.vmt
)

IF "%_var70%"=="" (echo 2>nul) >nul else (
	echo  [93m70:[33m %_var70%.vtf
	echo > %FOLDER%%_var70%.vtf
	type VMTSettings.txt > %FOLDER%%_var70%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var70%.vtf" >> %FOLDER%%_var70%.vmt
	echo } >> %FOLDER%%_var70%.vmt
)

IF "%_var71%"=="" (echo 2>nul) >nul else (
	echo  [93m71:[33m %_var71%.vtf
	echo > %FOLDER%%_var71%.vtf
	type VMTSettings.txt > %FOLDER%%_var71%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var71%.vtf" >> %FOLDER%%_var71%.vmt
	echo } >> %FOLDER%%_var71%.vmt
)

IF "%_var72%"=="" (echo 2>nul) >nul else (
	echo  [93m72:[33m %_var72%.vtf
	echo > %FOLDER%%_var72%.vtf
	type VMTSettings.txt > %FOLDER%%_var72%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var72%.vtf" >> %FOLDER%%_var72%.vmt
	echo } >> %FOLDER%%_var72%.vmt
)

IF "%_var73%"=="" (echo 2>nul) >nul else (
	echo  [93m73:[33m %_var73%.vtf
	echo > %FOLDER%%_var73%.vtf
	type VMTSettings.txt > %FOLDER%%_var73%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var73%.vtf" >> %FOLDER%%_var73%.vmt
	echo } >> %FOLDER%%_var73%.vmt
)

IF "%_var74%"=="" (echo 2>nul) >nul else (
	echo  [93m74:[33m %_var74%.vtf
	echo > %FOLDER%%_var74%.vtf
	type VMTSettings.txt > %FOLDER%%_var74%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var74%.vtf" >> %FOLDER%%_var74%.vmt
	echo } >> %FOLDER%%_var74%.vmt
)

IF "%_var75%"=="" (echo 2>nul) >nul else (
	echo  [93m75:[33m %_var75%.vtf
	echo > %FOLDER%%_var75%.vtf
	type VMTSettings.txt > %FOLDER%%_var75%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var75%.vtf" >> %FOLDER%%_var75%.vmt
	echo } >> %FOLDER%%_var75%.vmt
)

IF "%_var76%"=="" (echo 2>nul) >nul else (
	echo  [93m76:[33m %_var76%.vtf
	echo > %FOLDER%%_var76%.vtf
	type VMTSettings.txt > %FOLDER%%_var76%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var76%.vtf" >> %FOLDER%%_var76%.vmt
	echo } >> %FOLDER%%_var76%.vmt
)

IF "%_var77%"=="" (echo 2>nul) >nul else (
	echo  [93m77:[33m %_var77%.vtf
	echo > %FOLDER%%_var77%.vtf
	type VMTSettings.txt > %FOLDER%%_var77%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var77%.vtf" >> %FOLDER%%_var77%.vmt
	echo } >> %FOLDER%%_var77%.vmt
)

IF "%_var78%"=="" (echo 2>nul) >nul else (
	echo  [93m78:[33m %_var78%.vtf
	echo > %FOLDER%%_var78%.vtf
	type VMTSettings.txt > %FOLDER%%_var78%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var78%.vtf" >> %FOLDER%%_var78%.vmt
	echo } >> %FOLDER%%_var78%.vmt
)

IF "%_var79%"=="" (echo 2>nul) >nul else (
	echo  [93m79:[33m %_var79%.vtf
	echo > %FOLDER%%_var79%.vtf
	type VMTSettings.txt > %FOLDER%%_var79%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var79%.vtf" >> %FOLDER%%_var79%.vmt
	echo } >> %FOLDER%%_var79%.vmt
)

IF "%_var80%"=="" (echo 2>nul) >nul else (
	echo  [93m80:[33m %_var80%.vtf
	echo > %FOLDER%%_var80%.vtf
	type VMTSettings.txt > %FOLDER%%_var80%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var80%.vtf" >> %FOLDER%%_var80%.vmt
	echo } >> %FOLDER%%_var80%.vmt
)

IF "%_var81%"=="" (echo 2>nul) >nul else (
	echo  [93m81:[33m %_var81%.vtf
	echo > %FOLDER%%_var81%.vtf
	type VMTSettings.txt > %FOLDER%%_var81%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var81%.vtf" >> %FOLDER%%_var81%.vmt
	echo } >> %FOLDER%%_var81%.vmt
)

IF "%_var82%"=="" (echo 2>nul) >nul else (
	echo  [93m82:[33m %_var82%.vtf
	echo > %FOLDER%%_var82%.vtf
	type VMTSettings.txt > %FOLDER%%_var82%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var82%.vtf" >> %FOLDER%%_var82%.vmt
	echo } >> %FOLDER%%_var82%.vmt
)

IF "%_var83%"=="" (echo 2>nul) >nul else (
	echo  [93m83:[33m %_var83%.vtf
	echo > %FOLDER%%_var83%.vtf
	type VMTSettings.txt > %FOLDER%%_var83%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var83%.vtf" >> %FOLDER%%_var83%.vmt
	echo } >> %FOLDER%%_var83%.vmt
)

IF "%_var84%"=="" (echo 2>nul) >nul else (
	echo  [93m84:[33m %_var84%.vtf
	echo > %FOLDER%%_var84%.vtf
	type VMTSettings.txt > %FOLDER%%_var84%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var84%.vtf" >> %FOLDER%%_var84%.vmt
	echo } >> %FOLDER%%_var84%.vmt
)

IF "%_var85%"=="" (echo 2>nul) >nul else (
	echo  [93m85:[33m %_var85%.vtf
	echo > %FOLDER%%_var85%.vtf
	type VMTSettings.txt > %FOLDER%%_var85%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var85%.vtf" >> %FOLDER%%_var85%.vmt
	echo } >> %FOLDER%%_var85%.vmt
)

IF "%_var86%"=="" (echo 2>nul) >nul else (
	echo  [93m86:[33m %_var86%.vtf
	echo > %FOLDER%%_var86%.vtf
	type VMTSettings.txt > %FOLDER%%_var86%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var86%.vtf" >> %FOLDER%%_var86%.vmt
	echo } >> %FOLDER%%_var86%.vmt
)

IF "%_var87%"=="" (echo 2>nul) >nul else (
	echo  [93m87:[33m %_var87%.vtf
	echo > %FOLDER%%_var87%.vtf
	type VMTSettings.txt > %FOLDER%%_var87%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var87%.vtf" >> %FOLDER%%_var87%.vmt
	echo } >> %FOLDER%%_var87%.vmt
)

IF "%_var88%"=="" (echo 2>nul) >nul else (
	echo  [93m88:[33m %_var88%.vtf
	echo > %FOLDER%%_var88%.vtf
	type VMTSettings.txt > %FOLDER%%_var88%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var88%.vtf" >> %FOLDER%%_var88%.vmt
	echo } >> %FOLDER%%_var88%.vmt
)

IF "%_var89%"=="" (echo 2>nul) >nul else (
	echo  [93m89:[33m %_var89%.vtf
	echo > %FOLDER%%_var89%.vtf
	type VMTSettings.txt > %FOLDER%%_var89%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var89%.vtf" >> %FOLDER%%_var89%.vmt
	echo } >> %FOLDER%%_var89%.vmt
)

IF "%_var90%"=="" (echo 2>nul) >nul else (
	echo  [93m90:[33m %_var90%.vtf
	echo > %FOLDER%%_var90%.vtf
	type VMTSettings.txt > %FOLDER%%_var90%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var90%.vtf" >> %FOLDER%%_var90%.vmt
	echo } >> %FOLDER%%_var90%.vmt
)

IF "%_var91%"=="" (echo 2>nul) >nul else (
	echo  [93m91:[33m %_var91%.vtf
	echo > %FOLDER%%_var91%.vtf
	type VMTSettings.txt > %FOLDER%%_var91%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var91%.vtf" >> %FOLDER%%_var91%.vmt
	echo } >> %FOLDER%%_var91%.vmt
)

IF "%_var92%"=="" (echo 2>nul) >nul else (
	echo  [93m92:[33m %_var92%.vtf
	echo > %FOLDER%%_var92%.vtf
	type VMTSettings.txt > %FOLDER%%_var92%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var92%.vtf" >> %FOLDER%%_var92%.vmt
	echo } >> %FOLDER%%_var92%.vmt
)

IF "%_var93%"=="" (echo 2>nul) >nul else (
	echo  [93m93:[33m %_var93%.vtf
	echo > %FOLDER%%_var93%.vtf
	type VMTSettings.txt > %FOLDER%%_var93%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var93%.vtf" >> %FOLDER%%_var93%.vmt
	echo } >> %FOLDER%%_var93%.vmt
)

IF "%_var94%"=="" (echo 2>nul) >nul else (
	echo  [93m94:[33m %_var94%.vtf
	echo > %FOLDER%%_var94%.vtf
	type VMTSettings.txt > %FOLDER%%_var94%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var94%.vtf" >> %FOLDER%%_var94%.vmt
	echo } >> %FOLDER%%_var94%.vmt
)

IF "%_var95%"=="" (echo 2>nul) >nul else (
	echo  [93m95:[33m %_var95%.vtf
	echo > %FOLDER%%_var95%.vtf
	type VMTSettings.txt > %FOLDER%%_var95%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var95%.vtf" >> %FOLDER%%_var95%.vmt
	echo } >> %FOLDER%%_var95%.vmt
)

IF "%_var96%"=="" (echo 2>nul) >nul else (
	echo  [93m96:[33m %_var96%.vtf
	echo > %FOLDER%%_var96%.vtf
	type VMTSettings.txt > %FOLDER%%_var96%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var96%.vtf" >> %FOLDER%%_var96%.vmt
	echo } >> %FOLDER%%_var96%.vmt
)

IF "%_var97%"=="" (echo 2>nul) >nul else (
	echo  [93m97:[33m %_var97%.vtf
	echo > %FOLDER%%_var97%.vtf
	type VMTSettings.txt > %FOLDER%%_var97%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var97%.vtf" >> %FOLDER%%_var97%.vmt
	echo } >> %FOLDER%%_var97%.vmt
)

IF "%_var98%"=="" (echo 2>nul) >nul else (
	echo  [93m98:[33m %_var98%.vtf
	echo > %FOLDER%%_var98%.vtf
	type VMTSettings.txt > %FOLDER%%_var98%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var98%.vtf" >> %FOLDER%%_var98%.vmt
	echo } >> %FOLDER%%_var98%.vmt
)

IF "%_var99%"=="" (echo 2>nul) >nul else (
	echo  [93m99:[33m %_var99%.vtf
	echo > %FOLDER%%_var99%.vtf
	type VMTSettings.txt > %FOLDER%%_var99%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var99%.vtf" >> %FOLDER%%_var99%.vmt
	echo } >> %FOLDER%%_var99%.vmt
)

IF "%_var100%"=="" (echo 2>nul) >nul else (
	echo  [93m100:[33m %_var100%.vtf
	echo > %FOLDER%%_var100%.vtf
	type VMTSettings.txt > %FOLDER%%_var100%.vmt
	echo 	"$basetexture" "%DIRECTORY%%_var100%.vtf" >> %FOLDER%%_var100%.vmt
	echo } >> %FOLDER%%_var100%.vmt
)



echo ________________________________________
echo ---[ Hit [93mENTER[33m to go back to Start. ]---
pause >NUL
GOTO START



