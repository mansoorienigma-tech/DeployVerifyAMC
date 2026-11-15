@echo off
REM ============================================================================
REM READ-ONLY progress snapshot. SAFE to run WHILE synthesis is still running:
REM open a NEW cmd window and run this - it does not touch the Vivado process.
REM It writes progress_report.txt and pushes only that file, so the agent can
REM see whether synthesis is moving or stuck.
REM ============================================================================
setlocal
cd /d "%~dp0"
set "REPORT=progress_report.txt"

>  "%REPORT%" echo ===== DeployVerifyAMC / Vivado 2023.2 - progress snapshot =====
>> "%REPORT%" echo Generated: %DATE% %TIME%
>> "%REPORT%" echo Computer:  %COMPUTERNAME%
>> "%REPORT%" echo.
>> "%REPORT%" echo ----- VIVADO PROCESSES -----
tasklist /FI "IMAGENAME eq vivado.exe" >>"%REPORT%" 2>nul
>>"%REPORT%" echo.
>>"%REPORT%" echo ----- BITSTREAM -----
if exist vivado_prj.runs\impl_1\*.bit (
  >>"%REPORT%" echo YES - bitstream already exists.
) else (
  >>"%REPORT%" echo Not created yet.
)

for %%R in (synth_1 impl_1) do (
  >>"%REPORT%" echo.
  >>"%REPORT%" echo ================= RUN %%R =================
  if exist vivado_prj.runs\%%R\runme.log (
    powershell -NoProfile -Command "Get-Item 'vivado_prj.runs\%%R\runme.log' | Select-Object LastWriteTime,Length | Format-List" >>"%REPORT%" 2>nul
    >>"%REPORT%" echo ----- LAST 25 LINES of %%R/runme.log -----
    powershell -NoProfile -Command "Get-Content 'vivado_prj.runs\%%R\runme.log' -Tail 25" >>"%REPORT%" 2>nul
  ) else (
    >>"%REPORT%" echo runme.log not found yet.
  )
  >>"%REPORT%" echo ----- FILES IN RUN DIR -----
  dir /b vivado_prj.runs\%%R >>"%REPORT%" 2>nul
)

echo Progress snapshot written: %REPORT%

set "GITEXE="
where git >nul 2>nul && set "GITEXE=git"
if not defined GITEXE if exist "%ProgramFiles%\Git\cmd\git.exe" set "GITEXE=%ProgramFiles%\Git\cmd\git.exe"
if not defined GITEXE for /d %%D in ("%LOCALAPPDATA%\GitHubDesktop\app-*") do (
  if exist "%%D\resources\app\git\cmd\git.exe" set "GITEXE=%%D\resources\app\git\cmd\git.exe"
)
if not defined GITEXE (
  echo Git not found - please paste progress_report.txt manually.
  goto :show
)
"%GITEXE%" rev-parse --is-inside-work-tree >nul 2>nul || goto :show
"%GITEXE%" add -f "%REPORT%" >nul 2>nul
"%GITEXE%" -c user.name="DeployVerifyAMC local run" -c user.email="local@localhost" commit -q --only "%REPORT%" -m "progress snapshot %DATE% %TIME%" >nul 2>nul
"%GITEXE%" push origin HEAD
if errorlevel 1 (
  echo AUTO-PUSH FAILED. In GitHub Desktop: Pull, then run this again.
) else (
  echo.
  echo ===== PROGRESS SNAPSHOT PUSHED - tell the agent "progress pushed" =====
)
goto :show

:show
echo.
echo ---------- SNAPSHOT ----------
type "%REPORT%"
echo ---------- END ----------
pause
endlocal
