@echo off&title installing backdoor_generator...&cls
cd C:\ProgramData
goto CP
:adminyes
Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/Device-whitelist").Content >WL2.sav
>nul find "%username%" WL2.sav && (
  goto deviceNXT
) || (
  goto Whitelist_error
)
:deviceNXT
echo.
echo before setup starts you will need to set paramaters for installation
echo please note that the installer will delete itself when it is done.
del WL2.sav
git version >git.sav
>nul find "version" git.sav && (
  goto GIT_exists
) || (
  goto git_query
)
:GIT_exists
echo git installation already detected, skipping this stage...
:GIT_check_next
Dism /online /Get-FeatureInfo /FeatureName:Internet-Explorer-Optional-amd64>data1.txt
>nul find "State : Enabled" data1.txt && (
  goto int_exp_found
) || (
  goto int_exp_query
)
:int_exp_found
echo internet explorer is already enabled, skipping this stage...
:int_exp_next
if not exist C:\ProgramData\GVGemail.sav goto (imput_email) else (echo email save already detected, skipping this stage...)
:email_next
set errorlevel=0
if not exist C:\Windows\System32\bat2exe.bat goto bat2exe_add
:command_next
echo where would you like to install the file?
echo.
set /p install_location=install location:
echo starting installation...
timeout 1 /NOBREAK >nul
echo creating bat2exe command...
Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/bat2exe.bat").Content >C:\ProgramData\bat2exe.bat
if exist C:\windows\system32\bat2exe.bat (echo bat2exe succesfuly made) else (goto bat2exe_install_error)
if %install_git% equ false goto skip_git
echo downloading git...
powershell Import-Module BitsTransfer
powershell Start-BitsTransfer -source "https://github.com/git-for-windows/git/releases/download/v2.31.0.windows.1/Git-2.31.0-64-bit.exe" -Destination gitDL.exe
echo installing git...
gitDL.exe /silent
del gitDL.exe
echo git was installed
:skip_git
timeout 1 /nobreak >nul
if not exist %install_location% mkdir %install_location%
echo downloading code...
Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/updater.bat").Content >C:\programdata\backdoor generator.bat
echo converting file to exe...
bat2exe.bat "backdoor generator.bat" "%install_location%\backdoor generator.exe"
echo enabling internet explorer
if %install_int_exp% equ true Dism /online /Enable-Feature /FeatureName:Internet-Explorer-Optional-amd64 /All
(goto) 2>nul & del "%~f0"
exit /b









:git_query
echo.
echo git is required to run the program
echo would you like to install it now? (if you pick no you will have to install it when you first launch the program)
echo press Y for yes, press N for no, press I for information on why this is required
:redo_git
choice /C YMI /M "install git now?"
if %errorlevel% equ 3 goto git_info
if %errorlevel% equ 1 (set install_git=true) else (set install_git=false)
set errorlevel=0
goto GIT_check_next
:int_exp_query
echo.
echo internet explorer must be enabled to use this program
echo would you like to install it now? (if you pick no you will have to install it when you first launch the program)
echo press Y for yes, press N for no, press I for information on why this is required
:redo_int_exp
choice /C YNI /M "install internet explorer now?"
if %errorlevel% equ 3 got int_exp_info
if %errorlevel% equ 1 (set install_int_exp=true) else (set install_int_exp=false)
set errorlevel=0
goto int_exp_next
:int_exp_info
Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/internet_explorer_information.txt").Content >internet_explorer_information.txt
echo.
echo please close the text document to continue
start internet_explorer_information.txt /WAIT
del GIT_information.txt
goto redo_git
:git_info
Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/GIT_information.txt").Content >GIT_information.txt
echo.
echo please close the text document to continue
start GIT_information.txt /WAIT
del GIT_information.txt
goto redo_int_exp
:imput_email
echo.
echo no email was detected, email is required to authenticate on git and for whitelist verification
echo would you like to imput it now? (if you pick no program will ask you for your email on first launch)
echo press Y for yes, press N for no
choice /M "imput email?"
if %errorlevel% neq 1 goto email_next
set errorlevel=0
set /p email=email:
echo %email%>C:\ProgramData\GVGemail.sav
goto email_next
:Whitelist_error
del WL2.sav
echo it apears you are not whitelisted >exit_message.txt
echo if you think this is due to an error, please contact your seller for a new copy of the installer >>exit_message.txt
echo setup was automaticaly removed
start exit_message.txt
del exit_message.txt
start /b "" cmd /c del "%~f0"&exit /b
:bat2exe_install_error
echo there was an error when trying to create bat2exe command, this command is fatal and setup cannot continue.
echo.
echo press any key to exit...
pause >nul
exit /b
:CP
    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto adminyes
    ) else (
        goto admin_error
    )
:admin_error
echo [31merror code: 03[0m
echo [31merror: program was not run with administrator perms[0m
echo [31merror type: fatal[0m
echo [31mhow to replicate: do not run file as administrator[0m
echo [31mhow to fix: rerun program by right clicking on file and clicking "run as administrator"[0m
echo [31mextra information: administrator perms are required to access github[0m
echo.
echo press any key to exit...
pause >nul
exit /b