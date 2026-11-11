@echo off
REM ============================================================================
REM Discard the changes Vivado makes to GENERATED project files.
REM
REM Every time Vivado builds/opens the project it rewrites ~50 .xci files under
REM vivado_prj.srcs/sources_1/bd/system/ip/ (line endings + INSERT_VIP params)
REM and vivado_prj.xpr (project path, top module). These are NOT your work and
REM must never be committed. This script resets just those paths back to HEAD.
REM
REM Safe: it does NOT touch .tcl / .bat / README / synth_report.txt, and it
REM does NOT delete untracked files (Vivado regenerates them on the next build).
REM ============================================================================
setlocal
cd /d "%~dp0"

set "GITEXE="
where git >nul 2>nul && set "GITEXE=git"
if not defined GITEXE if exist "%ProgramFiles%\Git\cmd\git.exe" set "GITEXE=%ProgramFiles%\Git\cmd\git.exe"
if not defined GITEXE for /d %%D in ("%LOCALAPPDATA%\GitHubDesktop\app-*") do (
  if exist "%%D\resources\app\git\cmd\git.exe" set "GITEXE=%%D\resources\app\git\cmd\git.exe"
)
if not defined GITEXE (
  echo Git not found. In GitHub Desktop use: right-click Changes ^> Discard all changes.
  pause
  exit /b 1
)

echo Discarding Vivado-generated changes in:
echo   vivado_prj.xpr
echo   vivado_prj.srcs\  ^(the .xci IP files^)
echo.
"%GITEXE%" reset -q HEAD -- vivado_prj.xpr vivado_prj.srcs
"%GITEXE%" checkout -q -- vivado_prj.xpr vivado_prj.srcs
echo Done. Remaining changes:
"%GITEXE%" status --short
echo.
pause
endlocal
