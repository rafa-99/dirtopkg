echo "Made by Rafa_99"

@echo off
move input\act.dat tools\4\input\act_dat
move input\idps.hex tools\4\input\idps_hex
rmdir /Q/S input\PS3_GAME\LICDIR
tools\1\PS3_Generate_LIC.DAT.exe input\PS3_GAME
move input\PS3_GAME tools\2\
tools\2\CFW2OFW_Helper
echo %cd% >tmp
set /p origdir= < tmp
del tmp
cd "tools\2\*(*"
for %%I in (.) do echo %%~nxI >tmp
set /p gamedir= < tmp
del tmp
cd %origdir%
robocopy "tools\2\%gamedir%" tools\3\ /E /MOVE
rmdir /S /Q tools\2\patch tools\2\PS3_GAME
cd tools\3\
call do.bat
cd %origdir%
move tools\3\*.pkg tools\4\input\pkgs
cd tools\4
call resign_windows.bat
cd %origdir%
del /S/Q/F tools\4\input\pkgs\*.pkg tools\4\input\raps\*.rap
move tools\4\output\pkgs\*.pkg output
msg %USERNAME% "Your package files are available in the output folder"