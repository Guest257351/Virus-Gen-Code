all scripts must start with:
```< C:\ProgramData\run.sav (
  set /p number=
)

set update=1
if %number% equ %update% (payload.bat)```


all scripts must end with:
```echo %update%>C:\ProgramData\run.sav
