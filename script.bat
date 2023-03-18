@echo off
setlocal
mkdir "%temp%\Parsec"
curl https://builds.parsec.app/package/parsec-flat-windows.zip -o "%temp%\Parsec\parsec.zip"
Call :UnZipFile "%temp%\Parsec\" "%temp%\Parsec\parsec.zip"
del "%temp%\Parsec\parsec.zip"
curl https://raw.githubusercontent.com/alexungu04/racs/main/config.txt -o "%temp%\Parsec\config.txt"
start /d "%temp%\Parsec" parsecd.exe
exit /b
:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% If NOT fso.FolderExists(%1) Then
>>%vbs% fso.CreateFolder(%1)
>>%vbs% End If
>>%vbs% set objShell = CreateObject("Shell.Application")
>>%vbs% set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% Set fso = Nothing
>>%vbs% Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%
