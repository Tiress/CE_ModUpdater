@echo off

:: if the program didn't finish correctly, make sure to delete the temporary batch file
if exist _temp.bat del /F /Q _temp.bat

:: if we already have SteamCMD, go straight to updating
if exist "%cd%\SteamCMD\steamcmd.exe" goto :main

:: make a directory to keep it clean and separated
md SteamCMD

echo:
echo *-----------------------------------------------*
echo *   Downloading SteamCMD, please wait...        *
echo *-----------------------------------------------*

:: download compressed SteamCMD.exe into our newly created directory
bitsadmin /transfer mydownload /download /priority normal "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip" "%cd%\SteamCMD\steamcmd.zip"

echo:
echo *-----------------------------------------------*
echo *   Download complete.                          *
echo *-----------------------------------------------*

echo:
echo *-----------------------------------------------*
echo *   Preparing the file...                       *
echo *-----------------------------------------------*

:: extract the file
tar -xf "%cd%\SteamCMD\steamcmd.zip" -C "%cd%\SteamCMD"

:: remove the archive, we don't need it
del /F /Q "%cd%\SteamCMD\steamcmd.zip"

echo:
echo *-----------------------------------------------*
echo *   Preparation complete.                       *
echo *-----------------------------------------------*

:main

echo:
echo *-----------------------------------------------*
echo *   Starting the update process, please wait... *
echo *-----------------------------------------------*

pushd "%~dp0"

:: get the game executable folder from config file
for /f "tokens=2 delims=^=" %%i in ('findstr /rbc:"ConanPath=*" config.txt') do set "ConanPath=%%i"

if [%ConanPath%] == [] goto :nopath

:: get the root Steam folder with Conan Exiles workshop files
for /f "tokens=2 delims=^=" %%i in ('findstr /rbc:"WorkshopPath=*" config.txt') do set "WorkshopPath=%%i"

if [%WorkshopPath%] == [] goto :nopath

:: start preparing _temp.txt
echo:@echo off>_temp.txt
echo | set /p=""%~dp0SteamCMD\steamcmd.exe" +force_install_dir "%WorkshopPath%" +login anonymous ">>_temp.txt

SETLOCAL EnableDelayedExpansion

:: loop through the modlist.txt..
for /F "usebackq tokens=*" %%a in ("%ConanPath%\ConanSandbox\Mods\modlist.txt") do (
	set "subvar=%%a"
	set "lside=!subvar:*\440900\=!"
	:: ..pick only the Mod Id and pass it to _temp.txt as a SteamCMD parameter
	for /F "tokens=1 delims=/" %%i in ("!lside!") do echo | set /p="+workshop_download_item 440900 %%i validate ">>_temp.txt
)
echo | set /p=+quit>>_temp.txt

:: turn out .txt file into an actual .bat file
ren _temp.txt _temp.bat

:: run the _temp.bat file and wait for it to finish
call _temp.bat

:: delete _temp.bat as we no longer need it
del /F /Q _temp.bat

:: let the user know we have finished
echo:
echo *-----------------------------------------------*
echo *   Finished updating all mods.                 *
echo *-----------------------------------------------*
echo:
goto :end

:nopath

echo:
echo *-----------------------------------------------*
echo *   The path isn't filled up correctly.         *
echo *   Aborting update process.                    *
echo *-----------------------------------------------*
echo:

:end
pause
exit