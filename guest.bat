set number=1
< run.sav (
  set /p number=
)

set update=2
if %number% equ %update% (exit /b)

echo something >test.txt
start test.txt

echo %update% >run.sav
timeout 1 >nul
exit /b
