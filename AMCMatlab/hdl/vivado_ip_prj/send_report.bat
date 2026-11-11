@echo off
REM ============================================================================
REM Build a COMPACT report from vivado.log and push it to the current branch,
REM so the agent can read the diagnostics without any screenshot or copy/paste.
REM
REM Can be run standalone at any time (no synthesis needed):
REM   send_report.bat
REM It is also called automatically at the end of run_synth.bat.
REM
REM Note: the full vivado.log is several MB - we only push a small summary.
REM If git push fails (auth/network), just paste synth_report.txt manually.
REM ============================================================================
setlocal
cd /d "%~dp0"
set "REPORT=synth_report.txt"

if not exist vivado.log (
  echo ERROR: vivado.log not found in this folder.
  pause
  exit /b 1
)

>  "%REPORT%" echo ===== DeployVerifyAMC / Vivado 2023.2 - synthesis report =====
>> "%REPORT%" echo Generated: %DATE% %TIME%
>> "%REPORT%" echo Computer:  %COMPUTERNAME%
if exist vivado_prj.runs\impl_1\*.bit (
  >>"%REPORT%" echo RESULT: OK - bitstream created in vivado_prj.runs\impl_1
  echo RESULT: OK
) else (
  >>"%REPORT%" echo RESULT: FAILED - bitstream not found
  echo RESULT: FAILED
)
>>"%REPORT%" echo.
>>"%REPORT%" echo ----- KEY DIAGNOSTICS -----
findstr /C:"OK: wrapper" /C:"OK: system_wrapper" /C:"FATAL" /C:"make_wrapper" /C:"wrapper =" /C:"Synthesis status:" /C:"Implementation status:" /C:"Report IP Status" vivado.log >>"%REPORT%" 2>nul
if exist vivado_build.log (
  >>"%REPORT%" echo ----- BUILD ^(wrapper creation^) DIAGNOSTICS -----
  findstr /C:"OK: system_wrapper" /C:"FATAL" /C:"make_wrapper" /C:"ERROR:" /C:"locked" vivado_build.log >>"%REPORT%" 2>nul
)
>>"%REPORT%" echo.
>>"%REPORT%" echo ----- LOCKED REASON ^(full lines^) -----
findstr /C:"locked" /C:"Locked" /C:"LOCKED" vivado.log >>"%REPORT%" 2>nul
>>"%REPORT%" echo.
>>"%REPORT%" echo ----- ALL ERROR LINES -----
findstr /C:"ERROR:" vivado.log >>"%REPORT%" 2>nul
>>"%REPORT%" echo.
>>"%REPORT%" echo ----- LAST 30 LINES OF vivado.log -----
powershell -NoProfile -Command "Get-Content 'vivado.log' -Tail 30" >>"%REPORT%" 2>nul
echo Report written: %REPORT%

REM ---- locate git (PATH, Git for Windows, or GitHub Desktop bundled git) ----
set "GITEXE="
where git >nul 2>nul && set "GITEXE=git"
if not defined GITEXE if exist "%ProgramFiles%\Git\cmd\git.exe" set "GITEXE=%ProgramFiles%\Git\cmd\git.exe"
if not defined GITEXE for /d %%D in ("%LOCALAPPDATA%\GitHubDesktop\app-*") do (
  if exist "%%D\resources\app\git\cmd\git.exe" set "GITEXE=%%D\resources\app\git\cmd\git.exe"
)
if not defined GITEXE goto :nogit

"%GITEXE%" rev-parse --is-inside-work-tree >nul 2>nul || goto :nogit
"%GITEXE%" add -f "%REPORT%" >nul 2>nul
"%GITEXE%" -c user.name="DeployVerifyAMC local run" -c user.email="local@localhost" commit -q -m "synth report %DATE% %TIME%" >nul 2>nul
"%GITEXE%" push origin HEAD
if errorlevel 1 goto :pushfail
echo.
echo ============================================================
echo   REPORT PUSHED TO GITHUB
echo   Just tell the agent: "report pushed" - no screenshot needed.
echo ============================================================
goto :done

:pushfail
echo.
echo AUTO-PUSH FAILED (git auth / network / branch behind).
echo In GitHub Desktop: Pull, then run send_report.bat again.
echo Or just paste synth_report.txt manually.
goto :done

:nogit
echo.
echo Git not found on this PC. Please paste synth_report.txt manually.

:done
echo.
echo ---------- REPORT CONTENT ----------
type "%REPORT%"
echo ---------- END OF REPORT ----------
pause
endlocal
