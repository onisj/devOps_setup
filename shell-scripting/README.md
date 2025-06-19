# Shell Scripting Assessment

This directory contains the completed shell scripting assessment for the DevOps course.

## Project Overview

This assessment demonstrates understanding of shell scripting fundamentals, including:

- Creating and executing shell scripts
- Understanding file permissions
- Directory automation
- Shebang usage

## Files Created

### my_first_shell_script.sh
An enhanced bash script that demonstrates comprehensive system management automation:
- Creates three directories: Folder1, Folder2, Folder3 with error checking
- Includes cross-platform user management commands (Ubuntu/Linux and macOS)
- Features proper error handling and validation
- Provides detailed execution feedback and system information
- Includes proper shebang declaration

### variables_demo.sh
A comprehensive script demonstrating variable usage in shell scripting:
- Basic variable declaration and usage
- System information variables
- Array variables and manipulation
- Conditional variable assignment
- Environment variable demonstration
- String manipulation and concatenation

## Assessment Tasks Completed

- **Task 1**: Created `shell-scripting` directory
- **Task 2**: Created `my_first_shell_script.sh` file
- **Task 3**: Added shell script code with proper shebang
- **Task 4**: Saved the file successfully
- **Task 5**: Navigated to shell-scripting directory
- **Task 6**: Verified file creation with `ls -latr`
- **Task 7**: Added execute permissions using `chmod +x`
- **Task 8**: Successfully executed the script
- **Task 9**: Verified creation of 3 directories

## File Permissions Analysis

Initial permissions: `-rw-r--r--`

- Owner: read (r) and write (w)
- Group: read (r) only
- Others: read (r) only
- No execute (x) permission initially

After chmod +x: `-rwxr-xr-x`

- Owner: read (r), write (w), and execute (x)
- Group: read (r) and execute (x)
- Others: read (r) and execute (x)

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

## Improvements Based on Feedback

### Enhanced User Management
The updated script now includes:
- Cross-platform user creation commands for both Ubuntu/Linux and macOS
- Proper error handling and system detection
- Educational comments explaining platform differences
- Alternative approaches for restricted environments

### Added Variable Demonstration
Created `variables_demo.sh` to address the missing requirement:
- Comprehensive variable declaration examples
- System information gathering
- Array manipulation and conditional logic
- Environment variable usage demonstration

### Improved Validation
Both scripts now include:
- Enhanced error checking and validation
- Detailed execution feedback
- System information reporting
- Cross-platform compatibility awareness

## Note on Cross-Platform Compatibility

The scripts are designed to work across different operating systems:
- **Ubuntu/Linux**: Uses `useradd` commands for user creation
- **macOS**: Uses `dscl` commands and provides educational guidance
- **Error Handling**: Includes proper validation and feedback mechanisms

For production Ubuntu environments, the user creation commands will execute successfully with appropriate sudo privileges.
