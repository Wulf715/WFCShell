@echo off
rem This presumes you have an existing WFCShell config to pull from, so it can pull the API key.
rem If you don't have a WFCShell config, you can make one manually by mapping out the API key to the second line of config.txt.
rem Just keep in mind doing so may break WFCShell later down the line.
if exist config.txt (
  goto readConfig
) else (
  goto setup
)

:readConfig
setlocal enabledelayedexpansion
set count=0
for /f "tokens=*" %%x in (config.txt) do (
    set /a count+=1
    set var[!count!]=%%x
)
set apiKey=%var[2]%
rem I would drop a endlocal here to avoid related bugs
rem HOWEVER doing so breaks the config entirely.
rem Anything that relies on endlocal being called then is a no-go. shit.
goto start

:start
rem Put your custom curl command here, Refer to coconutjsonbible.md.
timeout /t 5 /nobreak
pause
endlocal
exit

:setup
echo no :[
exit