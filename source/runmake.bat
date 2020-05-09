@echo off
SET sourcepath=%~dp0
SET sourcepath=%sourcepath:\=/%
IF "%1"=="" (
  SET target=clean
) ELSE (
  SET target=%1
)
C:\cygwin64\bin\bash --login -c "cd %sourcepath%; make %target%"
pause
