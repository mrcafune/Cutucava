#!/bin/bash

# Cutucava by Kitten Technologies
# Simplified Nudge Deployment for macOS
# https://kittentechnologies.com

# ██████  ██    ██ ████████ ██    ██  ██████  █████  ██    ██  █████  
# ██      ██    ██    ██    ██    ██ ██      ██   ██ ██    ██ ██   ██ 
# ██      ██    ██    ██    ██    ██ ██      ███████ ██    ██ ███████ 
# ██      ██    ██    ██    ██    ██ ██      ██   ██  ██  ██  ██   ██ 
# ██████  ██████      ██     ██████   ██████ ██   ██   ████   ██   ██ 
                                                                    
                                                                    

NUDGE_SUITE_URL="https://github.com/macadmins/nudge/releases/download/v1.1.11.81465/Nudge_Suite-1.1.11.81465.pkg"
EXAMPLE_JSON_URL="https://raw.githubusercontent.com/macadmins/nudge/main/Example%20Assets/com.github.macadmins.Nudge.json"
EXAMPLE_MOBILECONFIG_URL="https://raw.githubusercontent.com/macadmins/nudge/main/Example%20Assets/com.github.macadmins.Nudge.mobileconfig"

# Download Nudge Suite
download_nudge() {
    echo "Downloading Nudge Suite with Cutucava..."
    mkdir -p Cutucava/PKG
    curl -L "$NUDGE_SUITE_URL" -o Cutucava/PKG/$(basename "$NUDGE_SUITE_URL")
}

# Install the .pkg downloaded above. Originally had a cleanup but realized you'll probably need that pkg file so just made it a comment
install_nudge() {
    echo "Installing Nudge Suite..."
    sudo installer -pkg "Cutucava/PKG/$(basename "$NUDGE_SUITE_URL")" -target /
}

# Check if Nudge installed 
check_installation() {
    if [ -d "/Applications/Utilities/Nudge.app" ]; then
        echo "Nudge Suite installed successfully!"
        return 0
    else
        echo "Nudge Suite installation failed."
        return 1
    fi
}

# Download example files into the "Examples" directory
download_examples() {
    echo "Creating 'Cutucava/Examples' directory..."
    mkdir -p Cutucava/Examples

    echo "Downloading example files..."
    curl -L "$EXAMPLE_JSON_URL" -o Cutucava/Examples/com.github.macadmins.Nudge.json
    curl -L "$EXAMPLE_MOBILECONFIG_URL" -o Cutucava/Examples/com.github.macadmins.Nudge.mobileconfig

    echo "Example files downloaded successfully."
}
# Actually pretty neato, I just grab the last file that shows in the file path of the Nudge download link and delete it

# cleanup() {
#     # Extracting the file name from the URL
#     local file_name=$(basename "$NUDGE_SUITE_URL")
#     echo "Cleaning up..."
#     rm "Cutucava/PKG/$file_name"
#     echo "$file_name deleted."
# }

# Main script execution
download_nudge
install_nudge

# Check if Nudge installed correctly and then download examples
if check_installation; then
    download_examples
fi

echo "Cutucava completed successfully!"
