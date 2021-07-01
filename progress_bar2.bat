@echo off
title progress bar
mode 36,6
color 0A
:check
< load_trigger.txt (
  set /p loadnum=
)
if %loadnum% neq nil (
echo nil>load_trigger.txt
goto %loadnum%)
:1
echo _________________________________
echo ###
echo _________________________________
echo.
echo creating placeholder file...
goto check
:2
cls
echo _________________________________
echo ######
echo _________________________________
echo.
echo setting uo git...
goto check
:3
cls
echo _________________________________
echo #########
echo _________________________________
echo.
echo creating payload folder...
goto check
:4
cls
echo _________________________________
echo ############
echo _________________________________
echo.
echo generating launch.vbs...
goto check
:5
cls
echo _________________________________
echo ###############
echo _________________________________
echo.
echo generating payload.bat...
goto check
:6
cls
echo _________________________________
echo ##################
echo _________________________________
echo.
echo configuring payload.bat...
goto check
:7
cls
echo _________________________________
echo #####################
echo _________________________________
echo.
echo generating run.bat...
goto check
:8
cls
echo _________________________________
echo ########################
echo _________________________________
echo.
echo generating readme.txt...
goto check
:9
cls
echo _________________________________
echo ###########################
echo _________________________________
echo.
echo verifying successful download...
goto check
:10
cls
echo _________________________________
echo ##############################
echo _________________________________
echo.
echo deleting temp files...
goto check
:11
cls
echo _________________________________
echo #################################
echo _________________________________
echo.
echo completed!
timeout 3 /NOBREAK >nul
exit
