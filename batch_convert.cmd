@echo off
setlocal EnableExtensions

REM 查找 JDK 17，并用它执行批量转换
set "JDK17="
REM 1. 优先使用显式指定的环境变量
call :check "%JAVA17_HOME%"
call :check "%JDK17_HOME%"
call :check "%JAVA_HOME%"

REM 2. 其次检查 PATH 中的 java
for /f "delims=" %%J in ('where java 2^>nul') do call :check "%%~dpJ.."

REM 3. 最后扫描常见安装目录中带 17 的文件夹
for %%R in (
    "%ProgramFiles%\Java"
    "%ProgramFiles%\Eclipse Adoptium"
    "%ProgramFiles%\Microsoft"
    "%ProgramFiles%\Amazon Corretto"
    "%ProgramFiles%\Zulu"
    "%ProgramFiles%\BellSoft"
    "%ProgramFiles(x86)%\Java"
    "%ProgramFiles(x86)%\Eclipse Adoptium"
    "%LOCALAPPDATA%\Programs\Eclipse Adoptium"
    "%USERPROFILE%\.jdks"
    "%USERPROFILE%\.gradle\jdks"
    "C:\Java"
    "D:\Java"
) do (
    if exist "%%~R" (
        for /d %%D in ("%%~R\*17*") do call :check "%%~D"
    )
)

if not defined JDK17 (
    echo [ERROR] Java 17 JDK not found. Install JDK 17 or set JAVA17_HOME.
    pause
    exit /b 1
)

REM 用 JDK 17 执行 batch_convert.gradle 的 batchConvert 任务
set "JAVA_HOME=%JDK17%"
set "PATH=%JAVA_HOME%\bin;%PATH%"
echo Using Java 17: %JAVA_HOME%

set "VERSION_DIR="
set /p "VERSION_DIR=Version folder (contains tacz/ and mods/): "
if not defined VERSION_DIR (
    echo [ERROR] No version folder path entered.
    pause
    exit /b 1
)
REM 拖入文件夹时路径会带引号，这里去掉
set "VERSION_DIR=%VERSION_DIR:"=%"

pushd "%~dp0" >nul
call "%~dp0gradlew.bat" --no-daemon --console=plain batchConvert "-PversionDir=%VERSION_DIR%"
set "GRADLE_EXIT=%ERRORLEVEL%"
popd

echo.
pause
exit /b %GRADLE_EXIT%

REM 校验候选目录：java/javac/release 齐全且 JAVA_VERSION 为 17
:check
if defined JDK17 exit /b 0
set "CAND=%~1"
if "%CAND%"=="" exit /b 0
for %%P in ("%CAND%") do set "CAND=%%~fP"
if not exist "%CAND%\bin\java.exe" exit /b 0
if not exist "%CAND%\bin\javac.exe" exit /b 0
if not exist "%CAND%\release" exit /b 0
set "VER="
for /f "usebackq tokens=1,* delims==" %%A in ("%CAND%\release") do (
    if /i "%%A"=="JAVA_VERSION" set "VER=%%~B"
)
if "%VER%"=="17" (
    set "JDK17=%CAND%"
    exit /b 0
)
if "%VER:~0,3%"=="17." (
    set "JDK17=%CAND%"
    exit /b 0
)
exit /b 0
