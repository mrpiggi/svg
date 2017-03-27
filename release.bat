@echo off
cd %~dp0
echo =========================================================================
echo  Set the version to create
echo =========================================================================
for /f "tokens=1,2 delims= " %%a in (
  'findstr /r /c:"[ ][ ][0-9][0-9][0-9][0-9]/[0-9][0-9]/[0-9][0-9]" source\svg.dtx'
) do (
  set version=%%b
)
set version=%version:\space%=%
echo.
echo Package svg and svg-extract %version%
echo.
echo =========================================================================
echo  Generate packages and documentation for version %version%
echo =========================================================================
echo.
if exist release-%version% rmdir release-%version% /s /q > nul
mkdir release-%version%
if exist temp rmdir temp /s /q > nul
xcopy source temp\ /s
cd temp
call clearsource.bat
del  clearsource.bat
if exist test rmdir test/s /q > nul
mkdir tex\latex\svg
mkdir source\latex\svg
mkdir doc\latex\svg
tex svg.dtx
echo \BaseDirectory{.}> docstrip.cfg
echo \UseTDS>> docstrip.cfg
tex svg.dtx
pdflatex --shell-escape "\def\tudfinalflag{}\input{svg.dtx}"
pdflatex "\def\tudfinalflag{}\input{svg.dtx}"
pdflatex --shell-escape "\def\tudfinalflag{}\input{svg.dtx}"
pdflatex "\def\tudfinalflag{}\input{svg.dtx}"
move  *.dtx           source\latex\svg\
copy ..\*.md          doc\latex\svg\
move svg.pdf          doc\latex\svg\
move examples         doc\latex\svg\examples
del *.* /q > nul
if exist svg-inkscape rmdir svg-inkscape /s /q > nul
if exist svg-extract rmdir svg-extract /s /q > nul
echo.
echo =========================================================================
echo  Release GitHub and CTAN
echo =========================================================================
echo.
xcopy * ..\release-%version%\temp\ /s
(
  echo With WScript
  echo   ZipFile = .Arguments^(0^) 
  echo   Folder = .Arguments^(1^) 
  echo End With
  echo CreateObject^("Scripting.FileSystemObject"^).CreateTextFile^(ZipFile, True^).Write "PK" ^& Chr^(5^) ^& Chr^(6^) ^& String^(18, vbNullChar^) 
  echo With CreateObject^("Shell.Application"^) 
  echo   .NameSpace^(ZipFile^).CopyHere .NameSpace^(Folder^).Items
  echo End With
  echo wScript.Sleep 2000 
) > winzip.vbs
cd ..\release-%version%
mkdir GitHub
CScript  ..\temp\winzip.vbs %cd%\GitHub\svg_%version%.zip %cd%\temp\
mkdir CTAN\svg\doc
mkdir CTAN\svg\source
xcopy temp\doc\latex\svg\*.*    CTAN\svg\doc\    /s
xcopy temp\source\latex\svg\*.* CTAN\svg\source\ /s
move  CTAN\svg\doc\README.md         CTAN\svg\README.md
CScript  ..\temp\winzip.vbs %cd%\svg.zip %cd%\CTAN\
move svg.zip CTAN\
echo.
echo =========================================================================
echo  Loeschen aller temporaeren Dateien
echo =========================================================================
echo.
pause.
cd %~dp0
if exist release-%version%\temp        rmdir release-%version%\temp /s /q > nul
if exist release-%version%\CTAN\svg    rmdir release-%version%\CTAN\svg /s /q > nul
if exist temp                          rmdir temp /s /q > nul
