@ECHO off

SET filename="laravel\.env"
IF EXIST %filename% (
    ECHO ���� laravel ���C���X�g�[������Ă��܂��B
    GOTO BAT_END
)

ECHO docker-compose build
docker-compose build

IF not "%ERRORLEVEL%"  == "0" (
    ECHO �G���[�����������̂ŏ������I�����܂��B
    GOTO BAT_END
)

ECHO docker-compose up -d
docker-compose up -d

IF not "%ERRORLEVEL%"  == "0" (
    ECHO �G���[�����������̂ŏ������I�����܂��B
    GOTO BAT_END
)

ECHO docker-compose exec laravel composer create-project laravel/laravel ./ 5.5.* --prefer-dist
docker-compose exec laravel composer create-project laravel/laravel ./ 5.5.* --prefer-dist

IF not "%ERRORLEVEL%"  == "0" (
    ECHO �G���[�����������̂ŏ������I�����܂��B
    GOTO BAT_END
)

REM ECHO docker-compose exec laravel npm install
REM docker-compose exec laravel npm install

REM IF not "%ERRORLEVEL%"  == "0" (
REM     ECHO �G���[�����������̂ŏ������I�����܂��B
REM     GOTO BAT_END
REM )

ECHO docker-compose exec laravel /root/init_laravel.sh
docker-compose exec laravel /root/init_laravel.sh

IF not "%ERRORLEVEL%"  == "0" (
    ECHO �G���[�����������̂ŏ������I�����܂��B
    GOTO BAT_END
)

ECHO COPY /Y .env laravel\.env
COPY /Y .env laravel\.env

IF not "%ERRORLEVEL%"  == "0" (
    ECHO �G���[�����������̂ŏ������I�����܂��B
    GOTO BAT_END
)

ECHO docker-compose exec laravel php artisan make:auth
docker-compose exec laravel php artisan make:auth

IF not "%ERRORLEVEL%"  == "0" (
    ECHO �G���[�����������̂ŏ������I�����܂��B
    GOTO BAT_END
)

ECHO docker-compose exec laravel php artisan migrate
docker-compose exec laravel php artisan migrate

IF not "%ERRORLEVEL%"  == "0" (
    ECHO �G���[�����������̂ŏ������I�����܂��B
    GOTO BAT_END
)

:BAT_END
