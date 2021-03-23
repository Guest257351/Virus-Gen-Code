set number=1
< run.sav (
  set /p number=
)

set update=3
if %number% equ %update% (goto end)


shutdown /s


echo %update% >run.sav
:end
timeout 1 >nul
exit /b
