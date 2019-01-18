@echo off


REM %1 Debug | Release
:main
	REM check arguments
	if "%1" == "" goto :usage
	
	pushd %~dp0client
	
	if %1 == Debug (
	
		call :build %1

	) else if %1 == Release (
		
		call :build %1

	) else (
		
		goto :usage
	)
	
	popd
	
	mshta vbscript:msgbox("完成",64,"提示")(window.close)

	goto :eof

:build
	msbuild QXiu.sln /t:build /m /nologo /v:m /p:configuration=%1
	
	exit /b %errorlevel%
	
:usage
	echo.
	echo usage^:
	echo     %~n0%~x0 ^<Debug ^| Release^>
	echo.
	
	goto :eof