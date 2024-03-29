::::::::::::::::::::::::::::::::::::::::::::::::::
:::
::: Emacsclient startup script runemacsclientw.bat
::: Robert Adesam, robert@adesam.se
::: http://www.adesam.se/robert/
:::
::: N.B. Alot of this is reused from other Emacs
::: users that have published stuff on the
::: Internet. Thank you! :)
::::::::::::::::::::::::::::::::::::::::::::::::::
@echo off
:: Set the path to where the Emacs binaries are
set binpath=d:\Luw\emacs\bin
:: If no arg is given set filename to desktop
if "%~1"=="" (
set filename=%HOME%
) else (
set filename=%~1
)
:: Run Emacsclient
"%binpath%\emacsclientw.exe" --no-wait --alternate-editor="%binpath%\runemacs.exe" "%filename%"
