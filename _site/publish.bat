:: ������github

@echo off
SetLocal EnableDelayedExpansion

:: �û���
set usr=loongfee

:: ��ǰ����
set "Ymd=%date:~,4%%date:~5,2%%date:~8,2%"

:: ��ʱ����Ŀ¼
set build_path="%TEMP%Jekyll_build"

:: ������ʱ����Ŀ¼
:: ����Ѿ�������ɾ�������´���

if exist %build_path% (
    ::echo !build_path! exist
    rd /s /q %build_path%
    md %build_path%
    ) else (
    ::echo !build_path! missing
    md %build_path%
)

:: ������վ
chcp 65001
jekyll build  %build_path%

echo %errorlevel%

del /q/a/f/s %build_path%\publish.bat
exit
rd /s /q !build_path!

:: �������û�д���ͷ�����վ
::if   %errorlevel% (
    cd /d d:sdk %build_path%
    git init
    git add .
    git commit -m "updated site %ymd%"
    git remote add origin git@github.com:!usr!/!usr!.github.com.git
    git push origin master --force
::)

cd /d %~dp0

rd /s /q !build_path!
