@echo off


set sf=春节活动
set vd=情人节活动
set mkey=HKEY_CURRENT_USER\uitest
REM 活动类型
set sk_act_type=act_type
REM 活动阶段
set sk_act_part=act_part
REM 主菜单选择
set msel=0
REM 子菜单选择
set ssel=0

:main
	call :mmenu
	
	call :cleanup [-%mkey%]
	
	goto :eof

:mmenu
	cls
	echo +主菜单
	echo     -(1) %sf%
	echo     -(2) %vd%
	echo     -(3) 退出

	choice -cs -n -c 123 -m "select:"
	
	set msel=%errorlevel%
	
	call :key_value [%mkey%] %sk_act_type% %msel% 1
	
	if %msel% == 1 (
	
		call :smenu %sf%
		
	) else if %msel% == 2 (
	
		call :smenu %vd%
	)
	
	exit /b %errorlevel%
	
:smenu
	cls
	echo +子菜单（%1）
	echo     -(1) 第一阶段
	echo     -(2) 第二阶段
	echo     -(3) 第三阶段
	echo     -(4) 上层菜单

	choice -cs -n -c 1234 -m "select:"
	
	set ssel=%errorlevel%

	if %ssel% == 4 (
	
		call :mmenu
		
	) else (
	
		call :key_value [%mkey%] %sk_act_part% %ssel% 1

		call :smenu %1
	)
	
	exit /b %errorlevel%

:version
	echo Windows Registry Editor Version 5.00 > tmp.reg
	
	exit /b %errorlevel%

REM %1 main key %2 sub key %3 value %4 default value
:key_value
	call :version
	
	echo %1 >> tmp.reg
	
	echo "" = "%4" >> tmp.reg
	echo "%2" = "%3" >> tmp.reg
	
	regedit /s tmp.reg
	
	exit /b %errorlevel%

REM %1 main key
:cleanup
	call :version
	
	echo %1 >> tmp.reg
	
	regedit /s tmp.reg && del tmp.reg
	
	exit /b %errorlevel%
