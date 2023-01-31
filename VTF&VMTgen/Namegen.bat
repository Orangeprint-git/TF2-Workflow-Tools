@ECHO OFF
setlocal enabledelayedexpansion
mode 70,49
color 06
for %%f in (*) do (
	set /p val=<%%f
	echo %%~nf>> Names.txt
)