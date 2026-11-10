@echo off
REM Build the RFSoC system design in Vivado 2023.2 batch (headless) mode.
REM No GUI is opened, so graphics-driver crashes cannot kill the build.
setlocal
set VIVADO_BIN=C:\Xilinx\Vivado\2023.2\bin
if not exist "%VIVADO_BIN%\vivado.bat" (
  echo ERROR: Vivado 2023.2 not found at %VIVADO_BIN%
  echo Edit this file and set VIVADO_BIN to your Vivado install folder.
  exit /b 1
)
cd /d "%~dp0"
call "%VIVADO_BIN%\vivado.bat" -mode batch -notrace -source vivado_create_prj.tcl
endlocal
