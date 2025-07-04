#!/bin/bash

# Export environment variables
export ami_id="ami-05d3e0186c058c4dd"  
export count=1
export instance_type="t3.micro"
export key_name="ec2-key"     
export region="eu-north-1"              

# Function to create EC2 instance
create_ec2_instance() {
  echo "Launching EC2 Instance..."

  aws ec2 run-instances \
    --image-id "$ami_id" \
    --count "$count" \
    --instance-type "$instance_type" \
    --key-name "$key_name" \
    --region "$region"

  if [ $? -eq 0 ]; then
    echo "✅ EC2 instance created successfully."
  else
    echo "❌ Failed to create EC2 instance."
  fi
}

# Function to create S3 buckets using arrays
create_s3_buckets() {
  echo "Creating S3 Buckets..."
  departments=("Marketing" "Sales" "HR" "Operations" "Media")

  for dept in "${departments[@]}"; do
    bucket_name="datawise-${dept,,}-${RANDOM}-data-bucket"

    aws s3api create-bucket \
      --bucket "$bucket_name" \
      --region "$region" \
      --create-bucket-configuration LocationConstraint="$region"

    if [ $? -eq 0 ]; then
      echo "✅ $bucket_name created successfully."
    else
      echo "❌ Failed to create $bucket_name."
    fi
  done
}

# Call the functions
create_ec2_instance
create_s3_buckets
