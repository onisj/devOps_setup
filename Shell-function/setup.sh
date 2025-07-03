#!/bin/bash

# Set the environment variable
ENVIRONMENT=$1

# Function to check script argument
check_num_of_args() {
  if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <environment>"
    exit 1
  fi
}

# Function to check AWS CLI installation
check_aws_cli_installed() {
  if ! command -v aws &> /dev/null; then
    echo "AWS CLI not installed. Please install it to proceed."
    exit 1
  fi
}

# Function to check AWS_PROFILE variable
check_aws_profile_set() {
  if [ -z "$AWS_PROFILE" ]; then
    echo "AWS_PROFILE environment variable not set. Use: export AWS_PROFILE=<profile_name>"
    exit 1
  fi
}

# Function to handle environment logic
execute_environment_logic() {
  case "$ENVIRONMENT" in
    local)
      echo "Running script for Local Environment..."
      ;;
    testing)
      echo "Running script for Testing Environment..."
      ;;
    production)
      echo "Running script for Production Environment..."
      ;;
    *)
      echo "Invalid environment specified. Use 'local', 'testing', or 'production'."
      exit 2
      ;;
  esac
}

# Call all the functions
check_num_of_args "$@"
check_aws_cli_installed
check_aws_profile_set
execute_environment_logic
