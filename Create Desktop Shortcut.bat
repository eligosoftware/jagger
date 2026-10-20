@echo off
REM Creates a "Jagger" shortcut with the Jagger icon on your desktop.
REM Keep this file next to Jagger.html and Jagger.ico, then double-click it once.
set "DIR=%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
 "$d = $env:DIR;" ^
 "$edge = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\msedge.exe' -ErrorAction SilentlyContinue).'(default)';" ^
 "if (-not $edge) { $edge = ${env:ProgramFiles(x86)} + '\Microsoft\Edge\Application\msedge.exe' };" ^
 "$url = 'file:///' + ($d + 'Jagger.html').Replace('\','/').Replace(' ','%%20');" ^
 "$lnk = Join-Path ([Environment]::GetFolderPath('Desktop')) 'Jagger.lnk';" ^
 "$s = (New-Object -ComObject WScript.Shell).CreateShortcut($lnk);" ^
 "$s.TargetPath = $edge; $s.Arguments = '--app=' + [char]34 + $url + [char]34;" ^
 "$s.IconLocation = $d + 'Jagger.ico'; $s.WorkingDirectory = $d; $s.Description = 'Jagger - task manager';" ^
 "$s.Save(); Write-Host 'Desktop shortcut Jagger created.'"
pause
