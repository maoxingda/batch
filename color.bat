::-------------Welcome to www.bathome.net---------------
@mode con cols=56 lines=12 & @title �״�һ�� by Broly
@echo off&setlocal enabledelayedexpansion
set m=0
set str=2367abcdef
for /f "delims=" %%i in ('more +22 "%~nx0"') do (set "t=%%i" &call :loop)
echo\ &echo                   Welcome to www.bathome.net
pause>nul & exit
:loop
if not "!t:~%m%,1!"=="" (
set /a rnd=%random%%%11
>"!t:~%m%,1!_",set /p "=   "<nul
findstr /a:0!str:~%rnd%,1! .* "!t:~%m%,1!_*" 2>nul
ping -n 1 127.1>nul
del "!t:~%m%,1!_"
set /a m+=1
goto loop)
set m=0
echo.
goto :eof

=========��=====��=====��==========
   ��ū������ڻ���  ����
�󽭶�ȥ�����Ծ���ǧ�ŷ������
�������ߣ��˵��ǣ��������ɳ�ڡ�
��ʯ���գ������İ�������ǧ��ѩ��
��ɽ�续��һʱ���ٺ��ܣ�
ң�빫誵��꣬С�ǳ����ˣ�����Ӣ����
�����ڽ�̸Ц�䣬���ֻҷ�����
�ʹ����Σ�����ӦЦ�ң�����������
�������Σ�һ�׻������¡�