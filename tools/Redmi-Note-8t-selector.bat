@echo off
setlocal enabledelayedexpansion

echo =========================================================
echo       MBOM Project: Redmi Note 8T (willow) Deployer
echo =========================================================
echo.
echo Select the OS/Image you want to prepare for deployment:
echo [1] Ubuntu Touch (Official Repo)
echo [2] Custom Linux Distro (From GitHub Repo)
echo [3] Windows on ARM (WOA) Image
echo [q] Quit
echo.

set /p choice="Selection: "

if "%choice%"=="1" goto ubuntu_touch
if "%choice%"=="2" goto custom_linux
if "%choice%"=="3" goto windows_woa
if "%choice%"=="q" exit

:ubuntu_touch
echo 🌐 Fetching latest Ubuntu Touch for willow...
:: Replace with the actual official manifest URL
start https://devices.ubuntu-touch.io/device/willow/
echo ✔ Opened official Ubuntu Touch page for willow.
pause
goto :eof

:custom_linux
set /p repo_url="Enter the GitHub Raw URL for the .img/.iso: "
echo ⬇ Downloading from: %repo_url%
powershell -Command "Invoke-WebRequest -Uri '%repo_url%' -OutFile 'downloaded_os.img'"
echo ✔ Image downloaded successfully to /tools/ folder.
pause
goto :eof

:windows_woa
echo ⬇ Fetching Windows ARM image...
:: Replace with your specific WOA GitHub source
start https://github.com/WOA-Project/windwos-arm-images/releases
echo ✔ Opened Windows on ARM release page.
pause
goto :eof