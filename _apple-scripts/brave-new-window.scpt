#!/usr/bin/osascript
set termName to "Brave Browser"

tell application termName
    if it is running
        tell application "System Events" to tell process termName
            click menu item "New Window" of menu "File" of menu bar 1
        end tell
    else
        activate
    end if
end tell
