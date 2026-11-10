@echo off
REM Synthesis + implementation + bitstream in Vivado 2023.2 batch mode.
REM Run AFTER run_build.bat. This takes a long time (hours).
setlocal
set VIVADO_BIN=C:\Xilinx\Vivado\2023.2\bin
if not exist "%VIVADO_BIN%\vivado.bat" (
  echo ERROR: Vivado 2023.2 not found at %VIVADO_BIN%
  pause
  exit /b 1
)
cd /d "%~dp0"
echo Starting synthesis + implementation... this takes a LONG time.
call "%VIVADO_BIN%\vivado.bat" -mode batch -notrace -source run_synth.tcl
echo.
echo ================= Finished =================
if exist vivado_prj.runs\impl_1\*.bit (
  echo RESULT: OK - bitstream created in vivado_prj.runs\impl_1
) else (
  echo RESULT: FAILED - bitstream not found. Check vivado.log
  findstr /C:"ERROR:" vivado.log
)
pause
endlocal
