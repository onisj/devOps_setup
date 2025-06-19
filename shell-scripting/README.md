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

A bash script that automates directory creation with the following functionality:

- Creates three directories: Folder1, Folder2, Folder3
- Includes proper shebang declaration
- Demonstrates basic shell scripting concepts

## Assessment Tasks Completed

**Task 1**: Created `shell-scripting` directory
**Task 2**: Created `my_first_shell_script.sh` file
**Task 3**: Added shell script code with proper shebang
**Task 4**: Saved the file successfully
**Task 5**: Navigated to shell-scripting directory
**Task 6**: Verified file creation with `ls -latr`
**Task 7**: Added execute permissions using `chmod +x`
**Task 8**: Successfully executed the script
**Task 9**: Verified creation of 3 directories

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

## Note on User Creation

The original assessment included user creation commands (`sudo useradd`), but these are:

- Ubuntu/Linux specific commands
- Not available on macOS systems
- Require administrative privileges

For demonstration purposes, the script focuses on directory creation which successfully demonstrates shell scripting automation concepts.
