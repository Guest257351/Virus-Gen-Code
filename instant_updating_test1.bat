set number=1
< run.sav (
  set /p number=
)
:: ADD 1 TO UPDATE TO RUN THE CODE ::
set update=fuck u
if %number% equ %update% (goto end)
:: PUT CODE IN HERE :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

shutdown /s


:: END CODE HERE ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo %update% >run.sav
:end
timeout 1 >nul
exit /b

