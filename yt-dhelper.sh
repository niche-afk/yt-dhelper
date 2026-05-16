#!/bin/bash

clear

# Bold title using standard ANSI escape codes
echo -e "\033[1m=== YT-DLP AUDIO EXTRACTION UTILITY ===\033[0m"
echo ""

#Prompt for destination
read -p "Enter destination path: " destination_directory

#Directory check and optional creation
if [ ! -d "$destination_directory" ]; then
    echo ""
    read -p "Directory '$destination_directory' not found. Create? (y/n): " confirm_create

    # Standard POSIX-style comparison
    if [ "$confirm_create" = "y" ] || [ "$confirm_create" = "Y" ]; then
        mkdir -p "$destination_directory"
        echo "Directory created."
    else
        echo "Exiting..."
        exit 1
    fi
fi

echo ""

#Prompt for URL
read -p "Enter source video/playlist URL: " source_URL
echo ""

echo "Starting download..."
echo "----------------------------------------"

#Final command execution and extraction
yt-dlp -x --audio-format m4a -P "$destination_directory" "$source_URL"
