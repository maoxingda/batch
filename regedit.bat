@echo off


:main
	REM 主菜单选择
	set mmsel=0
	
	REM 子菜单选择
	set smsel=0
	
	call :main_menu
	
	if %mmsel% == 3 (
		call :cleanup
		goto :eof
	) else (
		cls && call :main_menu
	)

:main_menu
	echo.
	echo    --------------------------------
	echo    -  (1)	春节活动
	echo    -  (2)	情人节活动
	echo    -  (3)	退出
	echo    --------------------------------
	echo.
	
	choice -cs -n -c 123 -m "please select:"
	
	set mmsel=%errorlevel%

	if %mmsel% == 1 call :sf && cls && call :sub_menu
	if %mmsel% == 2 call :vd && cls && call :sub_menu
	
	exit /b 0
	
:sub_menu
	echo.
	echo    --------------------------------
	echo    -  (1)	第一阶段
	echo    -  (2)	第二阶段
	echo    -  (3)	第三阶段
	echo    -  (4)	返回上层菜单
	echo    --------------------------------
	echo.

	choice -cs -n -c 1234 -m "please select:"

	set smsel=%errorlevel%
	
	if %smsel% == 4 (
		cls && call :main_menu
	) else (
		if %smsel% == 1 call :part1
		if %smsel% == 2 call :part2
		if %smsel% == 3 call :part3
		
		cls && call :sub_menu
	)
	
	exit /b 0

:version
	echo Windows Registry Editor Version 5.00 > tmp.reg
	
	exit /b 0

:sf
	call :version
	
	echo. >> tmp.reg
	
	echo [HKEY_CURRENT_USER\uitest] >> tmp.reg
	
	echo "" = "1" >> tmp.reg
	echo "type" = "1" >> tmp.reg
	
	regedit /s tmp.reg
	
	exit /b 0

:vd
	call :version
	
	echo. >> tmp.reg
	
	echo [HKEY_CURRENT_USER\uitest] >> tmp.reg
	
	echo "" = "2" >> tmp.reg
	echo "type" = "2" >> tmp.reg
	
	regedit /s tmp.reg
	
	exit /b 0

:part1
	call :version
	
	echo. >> tmp.reg
	
	echo [HKEY_CURRENT_USER\uitest] >> tmp.reg
	
	echo "" = "1" >> tmp.reg
	echo "partion" = "1" >> tmp.reg
	
	regedit /s tmp.reg
	
	exit /b 0

:part2
	call :version
	
	echo. >> tmp.reg
	
	echo [HKEY_CURRENT_USER\uitest] >> tmp.reg
	
	echo "" = "2" >> tmp.reg
	echo "partion" = "2" >> tmp.reg
	
	regedit /s tmp.reg
	
	exit /b 0

:part3
	call :version
	
	echo. >> tmp.reg
	
	echo [HKEY_CURRENT_USER\uitest] >> tmp.reg
	
	echo "" = "3" >> tmp.reg
	echo "partion" = "3" >> tmp.reg
	
	regedit /s tmp.reg
	
	exit /b 0
	
:cleanup
	call :version
	
	echo. >> tmp.reg
	
	echo [-HKEY_CURRENT_USER\uitest] >> tmp.reg
	
	regedit /s tmp.reg
	del tmp.reg
	
	exit /b 0
