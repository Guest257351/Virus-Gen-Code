

:: setup
@echo off
color 0a
cls
title Education Perfect Bot
mkdir C:\ProgramData\botch>nul
echo division mode? (Y/N)
set /p YN=


:: read screen
:loop
cd C:\Program Files (x86)\Textract
textra.exe /capture 500 410 880 500 C:\ProgramData\botch\dat.txt
cd C:\ProgramData\botch


:: change >< with * to help with multiplcation 
powershell -Command "(gc dat.txt) -replace '|', ' ' | Out-File -encoding ASCII output.txt"


:: pull data out of text files for usage inside a variable
< output.txt (
  set /p data=
)


:: change errors while reading screen into proper math symbols
set data=%data:O=0%
set data=%data:X=*%
set data=%data:x=*%
set data=%data:?)=3%
set data=%data:—=-%
set data=%data: =%
if %YN% equ Y set data=%data:+=/%


:: create a VBS script to run keyboard inputs
set /a answer=%data%
echo %answer%
echo Set wshshell = wscript.CreateObject("WScript.Shell") >action.vbs
echo wscript.sleep 100 >>action.vbs
echo wshshell.sendkeys "%answer%" >>action.vbs
echo wscript.sleep 100 >>action.vbs
echo wshshell.sendkeys "{ENTER}" >>action.vbs
start action.vbs


:: Log results
echo %time%: >>botlogs.txt
echo %data% >>botlogs.txt
echo %answer% >>botlogs.txt
echo. >>botlogs.txt
timeout 1 >nul
goto loop


:: change symbols for division