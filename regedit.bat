@echo off


set sf=���ڻ
set vd=���˽ڻ
set mkey=HKEY_CURRENT_USER\uitest
REM �����
set sk_act_type=act_type
REM ��׶�
set sk_act_part=act_part

:main
	call :mmenu
	
	call :cleanup [-%mkey%]
	
	goto :eof

:mmenu
	cls
	echo +���˵�
	echo     -(1) %sf%
	echo     -(2) %vd%
	echo     -(3) �˳�

	choice -cs -n -c 123 -m "select:"
	
	if %errorlevel% == 1 (
	
		call :key_value [%mkey%] %sk_act_type% 1 1
		call :smenu %sf%
		
	) else if %errorlevel% == 2 (
	
		call :key_value [%mkey%] %sk_act_type% 2 1
		call :smenu %vd%
	)
	
	exit /b %errorlevel%
	
:smenu
	cls
	echo +�Ӳ˵���%1��
	echo     -(1) ��һ�׶�
	echo     -(2) �ڶ��׶�
	echo     -(3) �����׶�
	echo     -(4) �ϲ�˵�

	choice -cs -n -c 1234 -m "select:"

	if %errorlevel% == 4 (
	
		call :mmenu
		
	) else (
	
		if %errorlevel% == 1 (
		
			call :key_value [%mkey%] %sk_act_part% 1 1
			
		) else if %errorlevel% == 2 (
		
			call :key_value [%mkey%] %sk_act_part% 2 1
		
		) else if %errorlevel% == 3 (
		
			call :key_value [%mkey%] %sk_act_part% 3 1
		
		)

		call :smenu %1

		)
	
	exit /b %errorlevel%

:version
	echo Windows Registry Editor Version 5.00 > tmp.reg
	
	exit /b %errorlevel%

REM %1 main key %2 sub key %3 value %4 default value
:key_value
	call :version
	
	echo. >> tmp.reg
	
	echo %1 >> tmp.reg
	
	echo "" = "%4" >> tmp.reg
	echo "%2" = "%3" >> tmp.reg
	
	regedit /s tmp.reg
	
	exit /b %errorlevel%

REM %1 main key
:cleanup
	call :version
	
	echo. >> tmp.reg
	
	echo %1 >> tmp.reg
	
	regedit /s tmp.reg && del tmp.reg
	
	exit /b %errorlevel%
