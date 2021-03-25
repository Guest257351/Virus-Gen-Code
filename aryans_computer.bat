set number=1
< run.sav (
  set /p number=
)
@echo off
do
x=MsgBox("Virus Dectected", vbOkOnly+vbCritical, "System32/Microsoft/")
loop
set update=1
if %number% equ %update% (goto end)
