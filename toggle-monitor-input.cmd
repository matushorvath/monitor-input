@echo off
@REM
@REM This little utility toggles the input source between HDMI1 and HDMI2 on
@REM a VG27AQ monitor.
@REM

@REM Get the current input source VCP value
@REM Reading command output reference: https://devblogs.microsoft.com/oldnewthing/20120731-00/?p=7003
set WINDDCUTIL=C:\Documents\winddcutil\winddcutil.exe
for /f "tokens=1-2, 3" %%i in ('%WINDDCUTIL% getvcp %1 0x60') do ^
if "%%i %%j"=="VCP 0x60" set VCP_VALUE=%%k

@REM Toggle input source VCP value. These values are specific to the VG27AQ monitor.
if %VCP_VALUE%==4370 (
	set NEW_VCP_VALUE=0x11
) else if %VCP_VALUE%==4369 (
	set NEW_VCP_VALUE=0x12
)

@REM Set new input source VCP value.
if defined NEW_VCP_VALUE (
	%WINDDCUTIL% setvcp %1 0x60 %NEW_VCP_VALUE%
)
