@echo off
REM ========================================
REM Set base variables
REM ========================================
set DIRNAME=%~dp0
cd /d %DIRNAME%

REM Normalize path (remove trailing backslash)
IF "%DIRNAME:~-1%"=="\" SET DIRNAME=%DIRNAME:~0,-1%

REM ========================================
REM Define APP_HOME and APP_BASE_NAME
REM ========================================
set APP_HOME=%DIRNAME%
for %%F in ("%APP_HOME%") do set APP_BASE_NAME=%%~nF

echo APP_HOME: %APP_HOME%
echo APP_BASE_NAME: %APP_BASE_NAME%

REM ========================================
REM Set JAVA_HOME if not already defined
REM ========================================
IF NOT DEFINED JAVA_HOME (
    SET JAVA_HOME=C:\Program Files\Java\jdk-17
)

SET PATH=%JAVA_HOME%\bin;%PATH%

REM ========================================
REM Run Gradle (Wrapper or System)
REM ========================================
IF EXIST gradlew.bat (
    echo Running Gradle Wrapper...
    CALL gradlew.bat %*
) ELSE (
    echo Running System Gradle...
    gradle %*
)
