@echo off
:: Get current date and time in format YYYYMMDD_HHMMSS
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (
    set yyyy=%%d
    set mm=%%b
    set dd=%%c
)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set hh=%%a
    set min=%%b
)
set hh=%hh: =0%
set timestamp=%yyyy%%mm%%dd%_%hh%%min%
set filename=logcat_%timestamp%.txt

:: Run ADB logcat and save to file
adb logcat -d > %filename%
echo Log saved as %filename%
pause