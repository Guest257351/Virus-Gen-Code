@echo off
title progress bar
mode 33,5
color 0A
:loop1
if not exist "load_trigger.bat" goto loop1
del "load_trigger.bat"
echo ______________________________
echo ###
echo ______________________________
echo.
echo setting up git...
:loop2
if not exist "load_trigger.bat" goto loop2
del "load_trigger.bat"
echo ______________________________
echo ######
echo ______________________________
echo.
echo creating payload folder...
:loop3
if not exist "load_trigger.bat" goto loop3
del "load_trigger.bat"
echo ______________________________
echo #########
echo ______________________________
echo.
echo generating launch.vbs...
:loop4
if not exist "load_trigger.bat" goto loop4
del "load_trigger.bat"
echo ______________________________
echo ############
echo ______________________________
echo.
echo generating payload.bat...
:loop5
if not exist "load_trigger.bat" goto loop5
del "load_trigger.bat"
echo ______________________________
echo ###############
echo ______________________________
echo.
echo configuring payload.bat...
:loop6
if not exist "load_trigger.bat" goto loop6
del "load_trigger.bat"
echo ______________________________
echo ##################
echo ______________________________
echo.
echo generating run.bat...
:loop7
if not exist "load_trigger.bat" goto loop7
del "load_trigger.bat"
echo ______________________________
echo #####################
echo ______________________________
echo.
echo generating readme.txt...
:loop8
if not exist "load_trigger.bat" goto loop8
del "load_trigger.bat"
echo ______________________________
echo ########################
echo ______________________________
echo.
echo verifying successful download...
:loop9
if not exist "load_trigger.bat" goto loop9
del "load_trigger.bat"
echo ______________________________
echo ###########################
echo ______________________________
echo.
echo deleting temp files...
:loop10
if not exist "load_trigger.bat" goto loop10
del "load_trigger.bat"
echo ______________________________
echo ##############################
echo ______________________________
echo.
echo completed!
timeout 3 /NOBREAK >nul
exit