set number=1
< run.sav (
  set /p number=
)

set update=4
if %number% equ %update% goto end

echo something >test.txt
start test.txt

echo %update% >run.sav
:end
timeout 1 >nul
exit /b
