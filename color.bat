::-------------Welcome to www.bathome.net---------------
@mode con cols=56 lines=12 & @title 献词一首 by Broly
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

=========分=====割=====线==========
   念奴娇·赤壁怀古  苏轼
大江东去，浪淘尽，千古风流人物。
故垒西边，人道是，三国周郎赤壁。
乱石穿空，惊涛拍岸，卷起千堆雪。
江山如画，一时多少豪杰！
遥想公瑾当年，小乔初嫁了，雄姿英发。
羽扇纶巾，谈笑间，樯橹灰飞烟灭。
故国神游，多情应笑我，早生华发。
人生如梦，一樽还酹江月。