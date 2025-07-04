# 🛠️ Shell-to-Cloud Automation: 5 Essential Shell Scripting Skills for AWS Deployment

## 📍 Project Objective

This project demonstrates how to use **Shell Scripting** to automate the provisioning of **AWS EC2 instances** and **S3 buckets**, while integrating **five foundational scripting concepts**:

- Functions  
- Arrays  
- Environment Variables  
- Command Line Arguments  
- Error Handling  

These concepts prepare you for real-world DevOps and cloud automation tasks such as infrastructure provisioning, CI/CD pipeline scripting, and automated deployment workflows.

---

## 🧩 Project Scenario

**DataWise Solutions**, a data science consultancy, supports an e-commerce startup that needs a secure, repeatable AWS environment to run analytics. This environment should be automatically deployed using a script that:

- Launches EC2 instances for computation  
- Creates S3 buckets for customer behavior datasets  
- Accepts user input for flexibility  
- Handles errors gracefully  

---

## 🧠 Key Concepts Applied in This Project

### 🔧 1. Functions
Shell functions modularize actions into reusable units.

```bash
create_ec2_instance() {
  aws ec2 run-instances --image-id "$AMI_ID" --count 1 --instance-type "$INSTANCE_TYPE" \
    --key-name "$KEY_PAIR" --security-groups "$SECURITY_GROUP" --region "$AWS_REGION" \
    || { echo "❌ EC2 instance creation failed"; exit 1; }
}
````

---

### 📦 2. Arrays

Arrays will track the IDs of resources created during the script run.

```bash
created_instances=()
created_buckets=()
```

This allows easy post-deployment validation or cleanup.

---

### 🔐 3. Environment Variables

Environment variables store reusable values securely.

```bash
export AWS_REGION="us-east-1"
export AMI_ID="ami-0abcd1234efgh5678"
export INSTANCE_TYPE="t2.micro"
```

Sensitive variables like `AWS_ACCESS_KEY_ID` should be exported securely from `.env` or injected at runtime.

---

### 🧾 4. Command Line Arguments

Input values are parsed to make the script dynamic.

```bash
if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <instance-type> <bucket-name>"
  exit 1
fi

INSTANCE_TYPE=$1
BUCKET_NAME=$2
```

Input validation prevents invalid AWS requests.

---

### 🚨 5. Error Handling

We use conditional checks after AWS CLI commands to handle failures gracefully.

```bash
create_s3_bucket() {
  aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$AWS_REGION" \
    --create-bucket-configuration LocationConstraint="$AWS_REGION"
  
  if [[ $? -ne 0 ]]; then
    echo "❌ Failed to create S3 bucket: $BUCKET_NAME"
    exit 1
  fi
}
```

We can extend this to log errors to a file, implement retries, or notify a monitoring service.

---

## 🔬 Testing & Validation Strategy

**Test Environment:**

* Use AWS CLI with an IAM user that has full EC2 and S3 permissions
* Test in a free-tier or sandbox AWS account

**Validation Steps:**

1. Check EC2 instance status via AWS Console or:

   ```bash
   aws ec2 describe-instances --region "$AWS_REGION"
   ```
2. Verify S3 bucket creation:

   ```bash
   aws s3 ls
   ```
3. Confirm script logs success and handles invalid input (e.g., duplicate bucket name)

---

## 🚀 Roadmap

| Phase | Task                                                               |
| ----- | ------------------------------------------------------------------ |
| ✅ 1   | Write project objectives and requirements                          |
| ✅ 2   | Outline and explain shell scripting concepts                       |
| 🔜 3  | Develop script in parts using Git commits                          |
| 🔜 4  | Test deployment in AWS                                             |
| 🔜 5  | Add screenshots and documentation                                  |
| 🔜 6  | Optional enhancements (e.g., logging, retry logic, destroy script) |

---

## 🧱 Project Structure (Planned)

```
shell-to-cloud-automation/
│
├── README.md
├── deploy.sh                  # Main automation script
├── .env                       # (Optional) AWS credentials and region
├── screenshots/               # Deployment and test output
└── logs/                      # Script error logs (optional)
```

---

## ✨ Outcome

This project bridges scripting fundamentals with cloud infrastructure automation. Mastering these five concepts in a cloud context sets the stage for:

* Writing deployment scripts for real DevOps workflows
* Building CI/CD automation
* Managing cloud resources efficiently using infrastructure-as-code principles

---

