#!/bin/bash

# Enhanced Shell Script for System Management Automation
# This script demonstrates directory creation and user management

echo "Starting system management automation..."
echo "========================================"

# Create directories
echo "Creating directories..."
mkdir -p Folder1 Folder2 Folder3

# Check if directories were created successfully
if [ -d "Folder1" ] && [ -d "Folder2" ] && [ -d "Folder3" ]; then
    echo "✓ All directories created successfully!"
    echo "  - Folder1: $(ls -ld Folder1)"
    echo "  - Folder2: $(ls -ld Folder2)"
    echo "  - Folder3: $(ls -ld Folder3)"
else
    echo "✗ Error: Failed to create one or more directories"
    exit 1
fi

echo ""
echo "Attempting user creation (Ubuntu/Linux specific)..."

# Check if we're on a Linux system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Linux system detected. Creating users..."
    
    # Create users (Ubuntu/Linux specific)
    for user in user1 user2 user3; do
        if sudo useradd "$user" 2>/dev/null; then
            echo "✓ User $user created successfully"
            # Verify user creation
            if id "$user" >/dev/null 2>&1; then
                echo "  - User verification: $(id $user)"
            fi
        else
            echo "✗ Failed to create user $user (may already exist)"
        fi
    done
    
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "macOS system detected. User creation requires different commands."
    echo "On macOS, you would use commands like:"
    echo "  sudo dscl . -create /Users/user1"
    echo "  sudo dscl . -create /Users/user2"
    echo "  sudo dscl . -create /Users/user3"
    echo "Note: These commands require administrative privileges and additional setup."
    
else
    echo "Unknown operating system. User creation commands may vary."
fi

echo ""
echo "========================================"
echo "Script execution completed!"
echo "Summary:"
echo "- Directories created: 3"
echo "- Operating System: $OSTYPE"
echo "- Script executed by: $(whoami)"
echo "- Execution time: $(date)"