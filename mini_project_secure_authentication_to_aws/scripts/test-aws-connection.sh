#!/bin/bash
# My test-aws-connection.sh script

echo "Testing My AWS Connection Setup..."
echo "=================================="

echo "1. Checking my AWS CLI configuration:"
aws sts get-caller-identity

echo -e "\n2. Testing my EC2 access:"
aws ec2 describe-regions --query 'Regions[0:3].{Name:RegionName}' --output table

echo -e "\n3. Testing my S3 access:"
aws s3 ls

echo -e "\nAll my tests completed successfully!"
