# AWS Secure Authentication Setup - My Learning Journey

This repository documents my step-by-step process of setting up secure authentication to AWS API using IAM users, roles, and policies, along with AWS CLI configuration. This was a hands-on learning project where I implemented secure AWS access for automation purposes.

## Table of Contents
- [What I Accomplished](#what-i-accomplished)
- [My Prerequisites](#my-prerequisites)
- [Step 1: Creating My IAM Policy](#step-1-creating-my-iam-policy)
- [Step 2: Creating My IAM Role](#step-2-creating-my-iam-role)
- [Step 3: Creating My IAM User](#step-3-creating-my-iam-user)
- [Step 4: Assigning My User to IAM Role](#step-4-assigning-my-user-to-iam-role)
- [Step 5: Attaching Policy to My User](#step-5-attaching-policy-to-my-user)
- [Step 6: Creating My Programmatic Access Credentials](#step-6-creating-my-programmatic-access-credentials)
- [Step 7: Installing AWS CLI on My System](#step-7-installing-aws-cli-on-my-system)
- [Step 8: Configuring My AWS CLI](#step-8-configuring-my-aws-cli)
- [Step 9: Testing My Configuration](#step-9-testing-my-configuration)
- [What I Learned About Security](#what-i-learned-about-security)
- [Challenges I Faced](#challenges-i-faced)

## What I Accomplished

Through this project, I successfully built a secure authentication system for AWS API access. Here's what I achieved:

- ✅ Created a custom IAM policy granting full access to EC2 and S3 services
- ✅ Built an IAM role for secure permissions management
- ✅ Set up an IAM user called `automation_user` for my scripts
- ✅ Properly configured role assignments and policy attachments
- ✅ Generated secure programmatic access credentials
- ✅ Installed and configured AWS CLI on my local machine
- ✅ Successfully tested my complete authentication setup

## My Prerequisites

Before starting this project, I had:
- An active AWS account with administrative access
- Basic understanding of cloud computing concepts
- Access to terminal/command line on my system
- A stable internet connection for downloading tools

## Step 1: Creating My IAM Policy

I started by creating a custom IAM policy that would give my automation user the necessary permissions.

### Navigating to IAM Console

First, I logged into my AWS Management Console and searched for "IAM" to access the Identity and Access Management service.

![My navigation to IAM](img/navigate-to-iam.png)

### Building My Policy

I clicked on "Policies" in the left navigation and then "Create policy". I chose to work with the JSON editor because it gave me more control over the permissions. Here's the policy I created:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:*",
                "s3:*"
            ],
            "Resource": "*"
        }
    ]
}
```

![My policy creation process](img/create-policy-json.png)

I named my policy `EC2-S3-FullAccess-Policy` and added a description explaining its purpose for my automation tasks.

![My policy review screen](img/policy-review.png)

Successfully created my first custom IAM policy!

## Step 2: Creating My IAM Role

Next, I needed to create an IAM role that my automation user could assume when needed.

### Starting My Role Creation

I navigated to "Roles" in the IAM console and clicked "Create role".

![My role creation start](img/create-role.png)

### Configuring My Role's Trust Policy

Initially, I selected "AWS service" and "EC2" as the use case, knowing I'd modify this later to work with my specific user.

![My role trust policy setup](img/role-trust-policy.png)

### Attaching My Custom Policy

I searched for and attached the `EC2-S3-FullAccess-Policy` I had just created.

![Attaching my policy to the role](img/attach-policy-to-role.png)

### Finalizing My Role

I named my role `AutomationRole` and provided a clear description of its purpose.

![My role creation completion](img/role-creation-final.png)

## Step 3: Creating My IAM User

Time to create the user that my automation scripts would use.

### Setting Up My User

I went to "Users" in the IAM console and clicked "Create user".

![My user creation start](img/create-user.png)

### Configuring User Details

I named my user `automation_user` - this would be the identity my scripts use to interact with AWS.

![My user details configuration](img/user-details.png)

### Handling Permissions Initially

During user creation, AWS presented me with three permission options:
- Add user to group
- Copy permissions from existing user  
- Attach policies directly

Since I planned to attach my custom policy in a later step for better organization and learning purposes, I chose **"Attach policies directly"** but didn't select any policies at this stage.

![My user permissions handling](img/user-permission-skip.png)

### Completing User Creation

My automation user was successfully created!

![My completed user creation](img/user-created.png)

## Step 4: Assigning My User to IAM Role

Now I needed to modify my role so that my automation_user could assume it.

### Editing My Role's Trust Policy

I went back to my "AutomationRole" and clicked on the "Trust relationships" tab to edit the trust policy.

![My trust policy editing](img/edit-trust-policy.png)

### Updating the Trust Relationship

I replaced the default trust policy with one that specifically allows my automation_user to assume the role. I had to find my AWS Account ID first by clicking on my username in the top-right corner.

Here's the trust policy I implemented:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::MY-ACCOUNT-ID:user/Automation_user"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
```

![My updated trust policy](img/trust-policy-updated.png)

## Step 5: Attaching Policy to My User

I needed to give my automation_user direct access to the permissions defined in my custom policy.

### Accessing My User's Permissions

I navigated back to my automation_user and went to the "Permissions" tab.

![Selecting my user for permissions](img/select-user.png)

### Adding Direct Policy Attachment

I clicked "Add permissions" and chose to attach policies directly.

![My permissions addition process](img/add-permissions.png)

I searched for and selected my `EC2-S3-FullAccess-Policy`.

Successfully attached the policy to my user!

![My completed permissions setup](img/permission-added.png)

## Step 6: Creating My Programmatic Access Credentials

This was a crucial step - creating the access keys that my scripts would use to authenticate with AWS.

### Generating My Access Key

In my automation_user's "Security credentials" tab, I found the "Access keys" section and clicked "Create access key".

![My access key creation start](img/create-access-key.png)

### Selecting My Use Case

I chose "Command Line Interface (CLI)" since I planned to use these credentials with AWS CLI and scripts.

### Adding Description and Creating

I added a meaningful description to help me remember the purpose of these keys.

### Securing My Credentials

This was the critical moment - AWS showed me both the Access Key ID and Secret Access Key. I immediately copied both and saved them securely, knowing this would be the only time I'd see the secret key.

![My access key credentials](img/access-key-created.png)

**Important**: I made sure to save these credentials in a secure location and never share them!

## Step 7: Installing AWS CLI on My System

Now I needed to install the AWS CLI to interact with AWS from my terminal.

### My Installation Process

Since I'm using Linux, I followed the appropriate installation method:

**For Linux (my system):**
```bash
# I downloaded the AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# I unzipped the installer
unzip awscliv2.zip

# I ran the installer
sudo ./aws/install

# I verified my installation
aws --version
```

## Step 8: Configuring My AWS CLI

Time to configure my AWS CLI with the credentials I created.

### Running My Configuration

I executed the AWS configure command:

```bash
aws configure
```

### Entering My Configuration Details

When prompted, I entered:
1. **AWS Access Key ID**: [My Access Key ID from Step 6]
2. **AWS Secret Access Key**: [My Secret Access Key from Step 6]
3. **Default region name**: `us-east-1` (I chose this as my preferred region)
4. **Default output format**: `json` (I prefer JSON for programmatic processing)

![My AWS CLI configuration](img/aws-configure.png)

### Verifying My Configuration Files

I confirmed that my configuration was properly stored in the AWS credential files on my system.

![My AWS config files](img/aws-cred.png)

## Step 9: Testing My Configuration

The moment of truth - testing whether everything I set up actually works!

### Testing My Basic Authentication

First, I verified my identity with AWS:

```bash
aws sts get-caller-identity
```

This successfully returned my user information, confirming my authentication was working!

![My caller identity test](img/test-caller-identity.png)

### Testing My EC2 Access

I tested my EC2 permissions by listing AWS regions:

```bash
aws ec2 describe-regions --output table
```

Perfect! I could access EC2 services and got a nice table of all AWS regions.

![My EC2 access test](img/test-ec2-access.png)

### Testing My S3 Access

I verified my S3 permissions:

```bash
aws s3 ls
```

This worked as expected, listing my S3 buckets (or showing an empty list if I had no buckets).

![My S3 access test](img/test-s3-access.png)

### Creating My Test Script

To make future testing easier, I created a comprehensive test script:

```bash
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
```

I saved this as `scripts/test-aws-connection.sh` and made it executable:

```bash
chmod +x scripts/test-aws-connection.sh
./scripts/test-aws-connection.sh
```

![My test script results](img/test-script-results.png)

Everything worked perfectly! My setup was complete and functional.

## What I Learned About Security

Through this project, I gained valuable insights into AWS security best practices:

### 🔐 Credential Management Lessons
- I learned never to commit AWS credentials to version control
- I understand the importance of rotating access keys regularly (every 90 days)
- I discovered that using IAM roles is preferable to access keys when possible
- I now know how to securely store credentials using AWS credential files

### 🛡️ Permission Management Insights
- I implemented the principle of least privilege by creating specific policies
- I learned to regularly audit IAM policies and permissions
- I understand the importance of using specific resource ARNs instead of wildcards

## Challenges I Faced

### Challenge 1: Understanding IAM Relationships
Initially, I was confused about the relationship between users, roles, and policies. I learned that:
- Policies define permissions
- Roles are assumable identities with attached policies
- Users are permanent identities that can have direct policy attachments or assume roles

### Challenge 2: Trust Policy Configuration
Getting the trust policy syntax correct was tricky. I had to:
- Find my exact AWS Account ID
- Use the correct ARN format for my user
- Understand the difference between trust policies and permission policies

### Challenge 3: Credential Security
I initially wasn't sure about the best practices for storing credentials. I learned:
- Never to screenshot or save the actual secret keys
- To use the AWS credentials file system
- To understand when and how to rotate keys

### Challenge 4: Testing and Verification
Knowing whether my setup worked correctly required:
- Learning basic AWS CLI commands
- Understanding how to interpret error messages
- Creating systematic tests to verify each component

## My Project Outcomes

This project was incredibly valuable for my understanding of AWS security and automation. I now have:

1. **Practical AWS Security Skills**: I can set up secure authentication for any AWS automation project
2. **IAM Expertise**: I understand how to create and manage users, roles, and policies effectively
3. **AWS CLI Proficiency**: I'm comfortable using the command line to interact with AWS services
4. **Security Best Practices**: I know how to implement and maintain secure AWS access
5. **Troubleshooting Abilities**: I can diagnose and fix common authentication issues
---