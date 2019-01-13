@echo off


REM %1 /s stop and uninstall
:main
	pushd %~dp0
	set "PATH=C:\Windows\Microsoft.NET\Framework\v4.0.30319\;%PATH%"
	
	if "%1" == "/s" (
	
		sc stop QXiuUpdate && InstallUtil /LogFile= /u ./up.exe
		
	) else (

		InstallUtil /LogFile= ./up.exe && sc start QXiuUpdate && del ./up.InstallState
	)
	
	pause
	
	goto :eof