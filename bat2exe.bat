 ;@echo off
;set "target.exe=backdoor generator.exe
;set "batch_file=backdoor generator.bat
;set "bat_name=%~nx1"
;set "bat_dir=%~dp1"

;copy /y "%~f0" "%temp%\2exe.sed" >nul

;(echo()>>"%temp%\2exe.sed"
;(echo(AppLaunched=cmd.exe /c "%bat_name%")>>"%temp%\2exe.sed"
;(echo(TargetName=%target.exe%)>>"%temp%\2exe.sed"
;(echo(FILE0="%bat_name%")>>"%temp%\2exe.sed"
;(echo([SourceFiles])>>"%temp%\2exe.sed"
;(echo(SourceFiles0=%bat_dir%)>>"%temp%\2exe.sed"
;(echo([SourceFiles0])>>"%temp%\2exe.sed"
;(echo(%%FILE0%%=)>>"%temp%\2exe.sed"


;iexpress /n /q /m %temp%\2exe.sed

;del /q /f "%temp%\2exe.sed"
;exit /b 0

[Version]
Class=IEXPRESS
SEDVersion=3
[Options]
PackagePurpose=InstallApp
ShowInstallProgramWindow=0
HideExtractAnimation=1
UseLongFileName=1
InsideCompressed=0
CAB_FixedSize=0
CAB_ResvCodeSigning=0
RebootMode=N
InstallPrompt=%InstallPrompt%
DisplayLicense=%DisplayLicense%
FinishMessage=%FinishMessage%
TargetName=%TargetName%
FriendlyName=%FriendlyName%
AppLaunched=%AppLaunched%
PostInstallCmd=%PostInstallCmd%
AdminQuietInstCmd=%AdminQuietInstCmd%
UserQuietInstCmd=%UserQuietInstCmd%
SourceFiles=SourceFiles

[Strings]
InstallPrompt=
DisplayLicense=
FinishMessage=
FriendlyName=-
PostInstallCmd=<None>
AdminQuietInstCmd=
UserQuietInstCmd=
