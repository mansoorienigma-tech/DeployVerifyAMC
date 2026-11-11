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
  echo RESULT: FAILED - bitstream not found.
  echo.
  echo ===== COPY THE LINES BELOW AND SEND THEM TO THE AGENT =====
  findstr /C:"Block design is open" /C:"No block design is open" /C:"After close" /C:"make_wrapper OK" /C:"make_wrapper failed" /C:"Synthesis status:" vivado.log
  echo ----- LOCKED REASON (full line) -----
  findstr /C:"locked" /C:"Locked" vivado.log
  echo ----- ERRORS -----
  findstr /C:"ERROR:" vivado.log
  echo ===== END OF LINES TO SEND =====
)
pause
endlocal
