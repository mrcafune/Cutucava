#!/bin/bash

# Cutucava Uninstaller by Kitten Technologies
# Uninstall Nudge from macOS

if [ -d "/Applications/Utilities/Nudge.app" ]; then
    echo "Removing Nudge.app..."
    rm -rf "/Applications/Utilities/Nudge.app"
else
    echo "Nudge.app not found."
fi

if [ -e "/Library/LaunchDaemons/com.github.macadmins.Nudge.plist" ]; then
    echo "Removing Nudge's login daemon..."
    sudo launchctl bootout system /Library/LaunchDaemons/com.github.macadmins.Nudge.plist
    sudo rm -f "/Library/LaunchDaemons/com.github.macadmins.Nudge.plist"
else
    echo "Nudge's login daemon not found."
fi

echo "Uninstallation of Nudge completed."
