@echo off
REM ============================================================================
REM ONE-TIME FIX: stop Vivado-generated files from ever appearing in Changes.
REM
REM   discard_generated.bat          -> discard current changes AND mark these
REM                                     files "skip-worktree" permanently.
REM   discard_generated.bat undo     -> remove the mark (show changes again).
REM
REM Why: .gitignore only affects UNTRACKED files. These ~60 .xci / .xpr /
REM component.xml files are already TRACKED, so Vivado's rewrites show up every
REM time. "skip-worktree" tells Git to ignore local modifications to tracked
REM files. Nothing is deleted, nothing is pushed, the project stays intact.
REM
REM Re-run only after a fresh clone or a hard reset (the flag is local to this
REM .git index). Refresh GitHub Desktop with Ctrl+R afterwards.
REM ============================================================================
setlocal
cd /d "%~dp0"

set "FLAG=--skip-worktree"
set "UNDO="
if /i "%~1"=="undo" (
  set "FLAG=--no-skip-worktree"
  set "UNDO=1"
)

set "GITEXE="
where git >nul 2>nul && set "GITEXE=git"
if not defined GITEXE if exist "%ProgramFiles%\Git\cmd\git.exe" set "GITEXE=%ProgramFiles%\Git\cmd\git.exe"
if not defined GITEXE for /d %%D in ("%LOCALAPPDATA%\GitHubDesktop\app-*") do (
  if exist "%%D\resources\app\git\cmd\git.exe" set "GITEXE=%%D\resources\app\git\cmd\git.exe"
)
if not defined GITEXE (
  echo Git not found. In GitHub Desktop: right-click Changes ^> Discard all changes.
  pause
  exit /b 1
)

set "ROOT="
for /f "delims=" %%R in ('"%GITEXE%" rev-parse --show-toplevel') do set "ROOT=%%R"
if not defined ROOT (
  echo Not inside a git repository.
  pause
  exit /b 1
)

set "P1=AMCMatlab/hdl/vivado_ip_prj/vivado_prj.xpr"
set "P2=AMCMatlab/hdl/vivado_ip_prj/vivado_prj.srcs"
set "P3=AMCMatlab/hdl/vivado_ip_prj/ipcore/analogdevices-dmac"
set "LIST=%TEMP%\dva_skip_%RANDOM%.txt"

"%GITEXE%" -C "%ROOT%" ls-files -- "%P1%" "%P2%" "%P3%" > "%LIST%" 2>nul

REM Clear any previous mark first so the discard below really takes effect.
"%GITEXE%" -C "%ROOT%" update-index --no-skip-worktree --stdin < "%LIST%" >nul 2>nul

echo Discarding Vivado-generated changes...
"%GITEXE%" -C "%ROOT%" reset -q HEAD -- "%P1%" "%P2%" "%P3%" >nul 2>nul
"%GITEXE%" -C "%ROOT%" checkout -q -- "%P1%" "%P2%" "%P3%" >nul 2>nul
del /q hs_err_pid*.dmp 2>nul

if defined UNDO (
  echo skip-worktree removed - changes will be visible again.
) else (
  "%GITEXE%" -C "%ROOT%" update-index --skip-worktree --stdin < "%LIST%" >nul 2>nul
  echo.
  echo ===== DONE - from now on these files will NOT appear in Changes =====
  echo Nothing was deleted or pushed. Refresh GitHub Desktop with Ctrl+R.
)
del "%LIST%" 2>nul

echo.
echo Remaining changes:
"%GITEXE%" -C "%ROOT%" status --short
echo.
pause
endlocal
