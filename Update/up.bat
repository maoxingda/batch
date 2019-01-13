@echo off


:main
	pushd %~dp0.. && svn cleanup && svn update
	
	REM pause

	goto :eof