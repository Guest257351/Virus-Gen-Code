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
goto check
:one
cls
echo _________________________________
echo ###
echo _________________________________
echo.
echo creating placeholder file...
goto check
:two
cls
echo _________________________________
echo ######
echo _________________________________
echo.
echo setting uo git...
goto check
:three
cls
echo _________________________________
echo #########
echo _________________________________
echo.
echo creating payload folder...
goto check
:four
cls
echo _________________________________
echo ############
echo _________________________________
echo.
echo generating launch.vbs...
goto check
:five
cls
echo _________________________________
echo ###############
echo _________________________________
echo.
echo generating payload.bat...
goto check
:six
cls
echo _________________________________
echo ##################
echo _________________________________
echo.
echo configuring payload.bat...
goto check
:seven
cls
echo _________________________________
echo #####################
echo _________________________________
echo.
echo generating run.bat...
goto check
:eight
cls
echo _________________________________
echo ########################
echo _________________________________
echo.
echo generating readme.txt...
goto check
:nine
cls
echo _________________________________
echo ###########################
echo _________________________________
echo.
echo verifying successful download...
goto check
:ten
cls
echo _________________________________
echo ##############################
echo _________________________________
echo.
echo deleting temp files...
goto check
:eleven
cls
echo _________________________________
echo #################################
echo _________________________________
echo.
echo completed!
echo nil>load_trigger.txt
timeout 3 /NOBREAK >nul
exit
