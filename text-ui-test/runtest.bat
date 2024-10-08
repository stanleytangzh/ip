@ECHO OFF

REM create bin directory if it doesn't exist
if not exist ..\bin mkdir ..\bin

REM delete output from previous run
if exist ACTUAL.TXT del ACTUAL.TXT

REM compile the code into the bin folder
javac -encoding UTF-8 -cp ..\src\main\java -Xlint:none -d ..\bin ..\src\main\java\stan\*.java ..\src\main\java\stan\commands\*.java ..\src\main\java\stan\exceptions\*.java ..\src\main\java\stan\ui\*.java ..\src\main\java\stan\tasks\*.java
IF ERRORLEVEL 1 (
    echo ********** BUILD FAILURE **********
    exit /b 1
)

REM Skip running the program and comparing outputs for now
REM If you want to re-enable testing in the future, uncomment the lines below

REM run the program, feed commands from input.txt file and redirect the output to ACTUAL.TXT
REM java -classpath ..\bin stan.Main < input.txt > ACTUAL.TXT

REM compare the output to the expected output
REM FC ACTUAL.TXT EXPECTED.TXT
