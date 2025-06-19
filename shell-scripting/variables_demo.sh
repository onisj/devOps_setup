#!/bin/bash

# Variables Demo Script
# This script demonstrates variable declaration and usage in shell scripting

echo "Shell Scripting Variables Demonstration"
echo "======================================="
echo ""

# Variable declarations
USER_NAME="DevOps Student"
PROJECT_NAME="Shell Scripting Assessment"
CURRENT_DATE=$(date +"%Y-%m-%d")
CURRENT_TIME=$(date +"%H:%M:%S")
SCRIPT_DIR=$(pwd)
TOTAL_DIRS=3
OS_TYPE=$(uname -s)

# Display variables
echo "=== Basic Variables ==="
echo "User Name: $USER_NAME"
echo "Project Name: $PROJECT_NAME"
echo "Current Date: $CURRENT_DATE"
echo "Current Time: $CURRENT_TIME"
echo ""

echo "=== System Information ==="
echo "Operating System: $OS_TYPE"
echo "Script Directory: $SCRIPT_DIR"
echo "Current User: $(whoami)"
echo "Home Directory: $HOME"
echo ""

echo "=== Project Statistics ==="
echo "Total Directories to Create: $TOTAL_DIRS"
echo "Script Version: 1.0"
echo "Shell: $SHELL"
echo ""

# Demonstrate variable manipulation
echo "=== Variable Manipulation ==="
FILE_PREFIX="demo"
FILE_EXTENSION="txt"
FULL_FILENAME="${FILE_PREFIX}_file.${FILE_EXTENSION}"
echo "File Prefix: $FILE_PREFIX"
echo "File Extension: $FILE_EXTENSION"
echo "Full Filename: $FULL_FILENAME"
echo ""

# Demonstrate arrays
echo "=== Array Variables ==="
FOLDER_NAMES=("Folder1" "Folder2" "Folder3")
USER_NAMES=("user1" "user2" "user3")

echo "Folder Names Array:"
for i in "${!FOLDER_NAMES[@]}"; do
    echo "  [$i]: ${FOLDER_NAMES[$i]}"
done

echo "User Names Array:"
for i in "${!USER_NAMES[@]}"; do
    echo "  [$i]: ${USER_NAMES[$i]}"
done
echo ""

# Demonstrate conditional variables
echo "=== Conditional Variables ==="
if [ "$OS_TYPE" = "Darwin" ]; then
    PLATFORM="macOS"
    PACKAGE_MANAGER="brew"
elif [ "$OS_TYPE" = "Linux" ]; then
    PLATFORM="Linux"
    PACKAGE_MANAGER="apt/yum"
else
    PLATFORM="Unknown"
    PACKAGE_MANAGER="Unknown"
fi

echo "Platform: $PLATFORM"
echo "Package Manager: $PACKAGE_MANAGER"
echo ""

# Demonstrate environment variables
echo "=== Environment Variables ==="
echo "PATH (first 100 chars): ${PATH:0:100}..."
echo "USER: ${USER:-$(whoami)}"
echo "LANG: ${LANG:-Not Set}"
echo ""

echo "======================================="
echo "Variables demonstration completed!"
echo "Total variables demonstrated: 15+"
echo "Script execution time: $(date)"