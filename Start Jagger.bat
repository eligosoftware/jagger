@echo off
REM Opens Jagger in its own app window (Microsoft Edge). Keep this file next to Jagger.html.
setlocal EnableDelayedExpansion
set "APP=%~dp0Jagger.html"
set "URL=file:///!APP:\=/!"
set "URL=!URL: =%%20!"
start "" msedge --app="!URL!" 2>nul || start "" "!APP!"
