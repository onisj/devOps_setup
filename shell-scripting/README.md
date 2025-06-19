# Shell Scripting Assessment

This directory contains the completed shell scripting assessment demonstrating basic automation concepts for DevOps tasks.

## Overview

The assessment focuses on creating and executing simple shell scripts that automate basic system management tasks:
- Directory creation
- User creation
- Basic variable usage
- Understanding of shebang declarations
- File permissions and script execution

## Files Created

### my_first_shell_script.sh
A basic bash script that automates fundamental system tasks:
- Creates three directories: Folder1, Folder2, Folder3
- Creates three users: user1, user2, user3 (Ubuntu/Linux)
- Includes proper shebang declaration
- Demonstrates basic shell scripting concepts

### variables_demo.sh
A simple script demonstrating basic variable usage:
- Variable declaration (name="John")
- Variable output using echo
- Basic shell scripting structure

## Assessment Tasks Completed

✅ **Creating the shell-scripting folder**: Successfully created directory structure
✅ **Creating my_first_shell_script.sh**: Script file created with proper content
✅ **Saving the script**: File saved in the correct location
✅ **Navigating to the directory**: Changed to shell-scripting directory
✅ **Confirming file creation**: Verified script exists using ls command
✅ **Adding execute permissions**: Used chmod +x to make script executable
✅ **Running the script**: Successfully executed ./my_first_shell_script.sh
✅ **Verifying folder creation**: Confirmed three folders were created
✅ **Creating variable script**: Created variables_demo.sh with basic variable usage

## File Permissions

The `chmod +x` command adds execute permissions to the script file, allowing it to be run directly with `./my_first_shell_script.sh`.

## What is a Shebang (#!/bin/bash)?

The shebang `#!/bin/bash` is a special notation at the beginning of shell scripts that:

1. **Specifies the interpreter**: Tells the system which program should execute the script
2. **Absolute path**: `/bin/bash` is the full path to the Bash shell executable
3. **Cross-platform compatibility**: Ensures the script runs with the correct shell
4. **Execution method**: Allows the script to be executed directly (e.g., `./script.sh`)

### Why is the Shebang Important?

- **Interpreter Selection**: Without it, the system may not know how to execute the script
- **Consistency**: Ensures the script runs with the intended shell across different systems
- **Portability**: Makes scripts more reliable when moved between environments

### Alternative Shebangs

- `#!/bin/sh` - Uses the system's default shell
- `#!/usr/bin/env bash` - Uses the first bash found in PATH
- `#!/bin/zsh` - Uses the Z shell

## Script Execution Process

### Main Script Execution
```bash
# Navigate to the shell-scripting directory
cd shell-scripting

# Make the script executable
chmod +x my_first_shell_script.sh

# Execute the script
./my_first_shell_script.sh
```

The enhanced script successfully:
- Created all three directories with proper error checking
- Demonstrated cross-platform user management awareness
- Provided comprehensive execution feedback
- Displayed system information and execution summary

### Variables Demo Script Execution
```bash
# Make the variables demo script executable
chmod +x variables_demo.sh

# Execute the variables demo script
./variables_demo.sh
```

The variables demo script successfully demonstrated:
- 15+ different types of variables
- System information gathering
- Array manipulation
- Conditional logic
- Environment variable usage

### System Process Overview

1. **Permission Check**: System verifies execute permissions
2. **Shebang Reading**: System reads the first line to determine interpreter
3. **Interpreter Launch**: System launches `/bin/bash`
4. **Script Execution**: Bash interprets and executes the script commands

## Directory Structure Created

```
shell-scripting/
├── Folder1/
├── Folder2/
├── Folder3/
├── my_first_shell_script.sh
└── README.md
```

## Note on Ubuntu Execution

This script is designed for Ubuntu/Linux systems where the `useradd` commands will work properly with sudo privileges. The script demonstrates basic shell scripting concepts for automating directory and user creation tasks.
