@echo off
rem venv\Script\activate 를 실행하여 가상환경 중이어야 함.
rem git 설치되어 있어야 함.
set COUNT=0

:loop
    git reset --hard HEAD
    git pull
    rem set FILENAME=.\update_requirements.txt
    rem if exist %FILENAME% (
    rem     pip install -r %FILENAME%
    rem )
    python -OO sjva.py 0 %COUNT% no_celery
    echo PYTHON EXIT CODE : %errorlevel%..............
    set res=F
    if errorlevel == 1 set res=T
    if errorlevel == 2 set res=T
    if "%res%"=="T" (
        echo REPEAT....
        set /a COUNT=%COUNT%+1
        goto loop
    ) else (
        echo FINISH....
    )
