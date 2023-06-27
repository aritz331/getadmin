@echo off
set "_count=0"
:1
<nul set /p "=a"
set /a "_count+=1"
title %_count%
echo %_cmd%

rem if "%_count%"=="3360" (goto 2 trevi.exe)
if "%_count%" GTR "3460" (set "_cmd=ping localhost -n 1 >nul")

goto 1 abdus.can

:2
cls
timeout 5 /nobreak
goto 1