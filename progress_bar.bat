@echo off
title progress bar
mode 36,6
color 0A
:loop1
if not exist "load_trigger.txt" goto loop1
del "load_trigger.txt"
echo _________________________________
echo ###
echo _________________________________
echo.
echo creating placeholder file...
:loop2
if not exist "load_trigger.txt" goto loop2
del "load_trigger.txt"
echo _________________________________
echo ######
echo _________________________________
echo.
echo setting uo git...
:loop3
if not exist "load_trigger.txt" goto loop3
del "load_trigger.txt"
echo _________________________________
echo #########
echo _________________________________
echo.
echo creating payload folder...
:loop4
if not exist "load_trigger.txt" goto loop4
del "load_trigger.txt"
echo _________________________________
echo ############
echo _________________________________
echo.
echo generating launch.vbs...
:loop5
if not exist "load_trigger.txt" goto loop5
del "load_trigger.txt"
echo _________________________________
echo ###############
echo _________________________________
echo.
echo generating payload.bat...
:loop6
if not exist "load_trigger.txt" goto loop6
del "load_trigger.txt"
echo _________________________________
echo ##################
echo _________________________________
echo.
echo configuring payload.bat...
:loop7
if not exist "load_trigger.txt" goto loop7
del "load_trigger.txt"
echo _________________________________
echo #####################
echo _________________________________
echo.
echo generating run.bat...
:loop8
if not exist "load_trigger.txt" goto loop8
del "load_trigger.txt"
echo _________________________________
echo ########################
echo _________________________________
echo.
echo generating readme.txt...
:loop9
if not exist "load_trigger.txt" goto loop9
del "load_trigger.txt"
echo _________________________________
echo ###########################
echo _________________________________
echo.
echo verifying successful download...
:loop10
if not exist "load_trigger.txt" goto loop10
del "load_trigger.txt"
echo _________________________________
echo ##############################
echo _________________________________
echo.
echo deleting temp files...
:loop11
if not exist "load_trigger.txt" goto loop11
del "load_trigger.txt"
echo _________________________________
echo #################################
echo _________________________________
echo.
echo completed!
timeout 3 /NOBREAK >nul
exit
