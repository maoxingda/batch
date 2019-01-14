@echo off


:main
	REM check required envrionments
	set frameworkDir=C:\Windows\Microsoft.NET\Framework\v4.0.30319\
	if not exist %frameworkDir% echo no framework checked. && goto :eof
	
	REM check arguments
	if "%1" == "" goto usage

	pushd %~dp0 && set "PATH=%frameworkDir%;%PATH%"
	
	if "%1" == "stop" (
	
		InstallUtil /LogFile= /u ./service.exe
		
	) else if "%1" == "start" (

		InstallUtil /LogFile= ./service.exe && sc start QXiuUpdate
		
	) else if "%1" == "svn" (

		pushd %~dp0 && echo begin...>update.log
		pushd %~dp0.. && svn cleanup && svn update
	)
	
	REM pause
	
	goto :eof

:usage
	echo.
	echo usage: auto [arguments]
	echo.
	echo     [start]        install ./service.exe as QXiuUpdate service and start it;
	echo                    execute svn command "cleanup and update" in the parent directory.
	echo.                   
		                    
	echo     [stop]         uninstall QXiuUpdate service.
	echo.
	
	goto :eof
