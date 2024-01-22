@echo off
setlocal enabledelayedexpansion

set "DIR=%ProgramFiles%\Visual Paradigm 17.1"

set "SCRIPT=%~f0"
set "SCRIPTPATH=%~dp0"

rmdir /s /q "%SCRIPTPATH%\output" 2>nul
copy "%SCRIPTPATH%\diagrams.vpp" "%SCRIPTPATH%\copy.vpp"
cd "%DIR%\scripts" && java -cp ".;../lib/vpplatform.jar;../lib/jniwrap.jar;../lib/winpack.jar;../ormlib/orm.jar;../ormlib/orm-core.jar;../lib/lib01.jar;../lib/lib02.jar;../lib/lib03.jar;../lib/lib04.jar;../lib/lib05.jar;../lib/lib06.jar;../lib/lib07.jar;../lib/lib08.jar;../lib/lib09.jar;../lib/lib10.jar;../lib/lib11.jar;../lib/lib12.jar;../lib/lib13.jar;../lib/lib14.jar;../lib/lib15.jar;../lib/lib16.jar;../lib/lib17.jar;../lib/lib18.jar;../lib/lib19.jar;../lib/lib20.jar" com.vp.cmd.ExportDiagramImage -project "%SCRIPTPATH%\copy.vpp" -out "%SCRIPTPATH%\output" -diagram "*" -type svg
del /q "%SCRIPTPATH%\copy.vpp*"