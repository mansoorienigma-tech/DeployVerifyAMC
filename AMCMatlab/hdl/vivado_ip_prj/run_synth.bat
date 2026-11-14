@echo off
REM Synthesis + implementation + bitstream in Vivado 2023.2 batch mode.
REM One double-click does everything:
REM   - if the HDL wrapper is missing, the block design is rebuilt first
REM   - then synthesis + implementation runs
REM   - then send_report.bat pushes a compact log summary to GitHub
setlocal
set VIVADO_BIN=C:\Xilinx\Vivado\2023.2\bin
if not exist "%VIVADO_BIN%\vivado.bat" (
  echo ERROR: Vivado 2023.2 not found at %VIVADO_BIN%
  pause
  exit /b 1
)
cd /d "%~dp0"

REM The wrapper must be created while the BD is freshly built and unlocked.
set "WRAP_FOUND="
for %%P in (
  "vivado_prj.gen\sources_1\bd\system\hdl\system_wrapper.v"
  "vivado_prj.gen\sources_1\bd\system\hdl\system_wrapper.vhd"
  "vivado_prj.srcs\sources_1\bd\system\hdl\system_wrapper.v"
  "vivado_prj.srcs\sources_1\bd\system\hdl\system_wrapper.vhd"
) do if exist %%P set "WRAP_FOUND=1"

REM The file existing on disk is not enough: it must also be registered in the
REM project. If .xpr has no reference to system_wrapper.v, rebuild once.
findstr /C:"system_wrapper.v" vivado_prj.xpr >nul 2>nul
if errorlevel 1 set "WRAP_FOUND="

if not defined WRAP_FOUND (
  echo No system_wrapper found - rebuilding the block design first ^(2-5 min^).
  call "%VIVADO_BIN%\vivado.bat" -mode batch -notrace -source vivado_create_prj.tcl
  copy /y vivado.log vivado_build.log >nul 2>nul
) else (
  echo system_wrapper found - skipping block design rebuild.
)

echo Starting synthesis + implementation... this takes a LONG time.
call "%VIVADO_BIN%\vivado.bat" -mode batch -notrace -source run_synth.tcl
echo.
echo ================= Finished =================
call send_report.bat
endlocal
