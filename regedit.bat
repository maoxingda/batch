@echo off


set sf=���ڻ
set vd=���˽ڻ
set mkey=HKEY_CURRENT_USER\uitest
REM �����
set sk_act_type=act_type
REM ��׶�
set sk_act_part=act_part
REM ���˵�ѡ��
set msel=0
REM �Ӳ˵�ѡ��
set ssel=0

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
	echo +�Ӳ˵���%1��
	echo     -(1) ��һ�׶�
	echo     -(2) �ڶ��׶�
	echo     -(3) �����׶�
	echo     -(4) �ϲ�˵�

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
