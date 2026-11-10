@echo off
REM Build the RFSoC system design in Vivado 2023.2 batch (headless) mode.
REM No GUI is opened, so graphics-driver crashes cannot kill the build.
setlocal
set VIVADO_BIN=C:\Xilinx\Vivado\2023.2\bin
if not exist "%VIVADO_BIN%\vivado.bat" (
  echo ERROR: Vivado 2023.2 not found at %VIVADO_BIN%
  echo Edit this file and set VIVADO_BIN to your Vivado install folder.
  pause
  exit /b 1
)
cd /d "%~dp0"
echo Running Vivado batch build... please wait.
call "%VIVADO_BIN%\vivado.bat" -mode batch -notrace -source vivado_create_prj.tcl
echo.
echo ================= Build finished =================
if not exist vivado.log (
  echo No vivado.log found - Vivado may not have started.
) else (
  findstr /C:"ERROR:" vivado.log >nul
  if errorlevel 1 (
    echo RESULT: OK - no errors in vivado.log
  ) else (
    echo RESULT: FAILED - errors in vivado.log:
    findstr /C:"ERROR:" vivado.log
  )
)
echo.
echo Full log is in: vivado.log  (same folder as this file)
pause
endlocal
