@echo off
REM Synthesis + implementation + BITSTREAM in Vivado 2023.2 batch mode.
REM SAFE to re-run: if a routed checkpoint already exists, run_synth.tcl takes
REM a fast path and only writes the .bit (minutes, not the 6-hour synthesis).
REM At the end, send_report.bat pushes a compact log summary to GitHub.
setlocal
set VIVADO_BIN=C:\Xilinx\Vivado\2023.2\bin
if not exist "%VIVADO_BIN%\vivado.bat" (
  echo ERROR: Vivado 2023.2 not found at %VIVADO_BIN%
  pause
  exit /b 1
)
cd /d "%~dp0"

REM CRITICAL: never rebuild when implementation results exist.
REM vivado_create_prj.tcl uses create_project -force, which would DELETE
REM vivado_prj.runs and throw away hours of synthesis/implementation work.
if exist "vivado_prj.runs\impl_1\system_wrapper_routed.dcp" (
  echo Routed checkpoint found - skipping rebuild. Writing bitstream only.
  goto :run_synth
)

REM The wrapper must be created while the BD is freshly built and unlocked.
set "WRAP_FOUND="
for %%P in (
  "vivado_prj.gen\sources_1\bd\system\hdl\system_wrapper.v"
  "vivado_prj.gen\sources_1\bd\system\hdl\system_wrapper.vhd"
  "vivado_prj.srcs\sources_1\bd\system\hdl\system_wrapper.v"
  "vivado_prj.srcs\sources_1\bd\system\hdl\system_wrapper.vhd"
) do if exist %%P set "WRAP_FOUND=1"

REM The file existing on disk is not enough: it must also be in the project.
findstr /C:"system_wrapper.v" vivado_prj.xpr >nul 2>nul
if errorlevel 1 set "WRAP_FOUND="

if not defined WRAP_FOUND (
  echo No registered system_wrapper found - rebuilding the block design first ^(2-5 min^).
  call "%VIVADO_BIN%\vivado.bat" -mode batch -notrace -source vivado_create_prj.tcl
  copy /y vivado.log vivado_build.log >nul 2>nul
) else (
  echo system_wrapper found - skipping block design rebuild.
)

:run_synth
echo Starting Vivado... this may take a LONG time for a full run.
call "%VIVADO_BIN%\vivado.bat" -mode batch -notrace -source run_synth.tcl
echo.
echo ================= Finished =================
call send_report.bat
endlocal
