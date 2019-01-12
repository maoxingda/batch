@echo off


:main
	cd /d %~dp0img\
	
	set addsuffix=true
	set addsuffix=false
	
	setlocal enabledelayedexpansion
	
	for %%i in (*) do (
	
		echo rename for %%i...
	
		if %addsuffix%==true (
		
			ren %%i %%i.jpg
			
		) else (
			
			set bname=%%~ni
			ren %%i !bname!
		)
	)
	
	echo finished.
	
	pause
	
	goto :eof