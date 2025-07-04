# AWS Auto Scaling with ALB using Launch Template - Complete Guide

## Project Overview

This project demonstrates how to set up automatic scaling of EC2 instances using AWS Auto Scaling Groups with an Application Load Balancer (ALB) and Launch Templates. The infrastructure will automatically scale based on demand while maintaining high availability.

## Prerequisites

- AWS Account with appropriate permissions
- Basic understanding of AWS EC2, VPC, and Load Balancers
- AWS CLI configured (optional but recommended)

## Architecture Overview

## Step-by-Step Implementation

### Task 1: Create Launch Template

#### Step 1.1: Access EC2 Dashboard
1. Log in to the AWS Management Console
2. Navigate to EC2 service by searching "EC2" in the search bar
3. Click on "EC2" to open the EC2 Dashboard

![EC2 Dashboard](img/Ec2-dashboard.png)

#### Step 1.2: Create Launch Template
1. In the left navigation pane, click on "Launch Templates"
2. Click the "Create launch template" button

![Launch Templates Menu](img/launch-template-start.png)

#### Step 1.3: Configure Launch Template Settings

**Basic Configuration:**
1. **Launch template name**: `my-asg-launch-template`
2. **Template version description**: `Initial version for ASG with ALB`
3. **Application and OS Images (Amazon Machine Image)**: 
   - Select "Amazon Linux 2023 AMI" (free tier eligible)
   - Architecture: 64-bit (x86)

![Launch Template Basic Config](img/launch-template-start-basic-config.png)
**Instance Configuration:**
1. **Instance type**: `t3.micro` (free tier eligible)
2. **Key pair**: Select an existing key pair or create new one
3. **Network settings**:
   - Security groups: Create new security group or select existing
   - Allow HTTP (port 80) and SSH (port 22) traffic

![Instance Configuration](img/instance-configuration.png)

#### Step 1.4: Configure Security Group
1. Click "Create security group"
2. **Security group name**: `asg-web-sg`
3. **Description**: `Security group for ASG web servers`
4. **Inbound rules**:
   - HTTP (80) from anywhere (0.0.0.0/0)
   - SSH (22) from your IP
   - Custom TCP (3000) from anywhere (for Node.js app)

![Security Group Configuration](img/security-group-config.png)

#### Step 1.5: Add User Data Script
In the "Advanced details" section, add the following user data script:

```bash
#!/bin/bash
yum update -y
yum install -y nodejs npm
npm install -g pm2

# Create a simple Node.js application
mkdir /opt/webapp
cd /opt/webapp

cat > app.js << 'EOF'
const http = require('http');
const os = require('os');

const server = http.createServer((req, res) => {
    const instanceId = process.env.INSTANCE_ID || 'unknown';
    const availabilityZone = process.env.AVAILABILITY_ZONE || 'unknown';
    
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.end(`
        <html>
            <head><title>Auto Scaling Demo</title></head>
            <body style="font-family: Arial, sans-serif; margin: 40px;">
                <h1>Auto Scaling Group Demo</h1>
                <h2>Instance Information:</h2>
                <p><strong>Instance ID:</strong> ${os.hostname()}</p>
                <p><strong>Availability Zone:</strong> ${availabilityZone}</p>
                <p><strong>Timestamp:</strong> ${new Date().toISOString()}</p>
                <p><strong>Load Test:</strong> <button onclick="loadTest()">Generate Load</button></p>
                <script>
                    function loadTest() {
                        for(let i = 0; i < 100000; i++) {
                            Math.random() * Math.random();
                        }
                        alert('Load test completed!');
                    }
                </script>
            </body>
        </html>
    `);
});

server.listen(3000, () => {
    console.log('Server running on port 3000');
});
EOF

# Start the application
pm2 start app.js --name "webapp"
pm2 startup
pm2 save
```

![User Data Script](img/user-data-script.png)

#### Step 1.6: Create Launch Template
1. Review all settings
2. Click "Create launch template"
3. Verify the template was created successfully

![Launch Template Created](img/launch-template-start1.png)

### Task 2: Create Application Load Balancer

Before creating the Auto Scaling Group, we need to create an ALB.

#### Step 2.1: Navigate to Load Balancers
1. In the EC2 left navigation pane, click on "Load Balancers"
2. Click "Create Load Balancer"
3. Select "Application Load Balancer"

![Create Load Balancer](img/create-load-balancer.png)

#### Step 2.2: Configure ALB Settings
1. **Name**: `my-asg-alb`
2. **Scheme**: Internet-facing
3. **IP address type**: IPv4
4. **VPC**: Select default VPC
5. **Availability Zones**: Select at least 2 AZs with public subnets

![ALB Configuration](img/alb-configuration.png)

#### Step 2.3: Configure Security Group for ALB
1. Create new security group: `alb-sg`
2. **Inbound rules**:
   - HTTP (80) from anywhere (0.0.0.0/0)
   - HTTPS (443) from anywhere (0.0.0.0/0)

![ALB Security Group](img/alb-security-group.png)

#### Step 2.4: Configure Target Group
1. **Target type**: Instances
2. **Target group name**: `asg-targets`
3. **Protocol**: HTTP
4. **Port**: 3000
5. **Health check path**: `/`
6. **Health check interval**: 30 seconds
7. **Healthy threshold**: 2
8. **Unhealthy threshold**: 5

![Target Group Configuration](img/target-group-config.png)

#### Step 2.5: Create ALB
1. Review settings
2. Click "Create load balancer"
3. Wait for the ALB to become active

![ALB Created](img/alb-created.png)

### Task 3: Set Up Auto Scaling Group

#### Step 3.1: Navigate to Auto Scaling Groups
1. In the EC2 left navigation pane, click on "Auto Scaling Groups"
2. Click "Create Auto Scaling group"

![Auto Scaling Groups Menu](img/asg-menu.png)

#### Step 3.2: Choose Launch Template
1. **Auto Scaling group name**: `my-web-asg`
2. **Launch template**: Select `my-asg-launch-template`
3. **Version**: Latest
4. Click "Next"

![ASG Launch Template Selection](img/asg-launch-template.png)

#### Step 3.3: Configure Instance Launch Options
1. **VPC**: Select default VPC
2. **Availability Zones and subnets**: Select at least 2 public subnets in different AZs
3. Click "Next"

![ASG Network Configuration](img/asg-network-config.png)

#### Step 3.4: Configure Advanced Options
1. **Load balancing**: Check the box "Attach to an existing load balancer
2. **Choose from your load balancer target groups**: Select `asg-targets`
3. **Health checks**: 
   - Turn on Elastic Load Balancing health checks
   - Health check grace period: 300 seconds
4. Click "Next"

![ASG Advanced Options](img/asg-advanced-options.png)

#### Step 3.5: Configure Group Size and Scaling
1. **Desired capacity**: 2
2. **Minimum capacity**: 1
3. **Maximum capacity**: 6
4. **Scaling policies**: Target tracking scaling policy
5. **Target tracking policy**:
   - Metric type: Average CPU Utilization
   - Target value: 50%
   - Instance warmup: 300 seconds

![ASG Group Size Configuration](img/asg-group-size.png)

#### Step 3.6: Add Notifications (Optional)
1. Skip this step for now or configure SNS notifications
2. Click "Next"

#### Step 3.7: Add Tags
1. Add tags for better resource management:
   - Key: `Name`, Value: `ASG-Web-Server`
   - Key: `Environment`, Value: `Demo`
   - Key: `Project`, Value: `AutoScaling-Demo`

![ASG Tags](img/asg-tags.png)

#### Step 3.8: Review and Create
1. Review all configurations
2. Click "Create Auto Scaling group"

![ASG Created](img/asg-created.png)

### Task 4: Configure Additional Scaling Policies

#### Step 4.1: Access Scaling Policies
1. Select your Auto Scaling group
2. Click on the "Automatic scaling" tab
3. Click "Create dynamic scaling policy"

![Scaling Policies](img/scaling-policies.png)

#### Step 4.2: Create Scale-Out Policy
1. **Policy type**: Simple scaling
2. **Scaling policy name**: `scale-out-policy`
3. **CloudWatch alarm**: Create new alarm
4. **Metric**: CPU Utilization
5. **Threshold**: Greater than 70%
6. **Action**: Add 1 instance
7. **Cooldown period**: 300 seconds

![Scale Out Policy](img/scale-out-policy.png)

#### Step 4.3: Create Scale-In Policy
1. **Policy type**: Simple scaling
2. **Scaling policy name**: `scale-in-policy`
3. **CloudWatch alarm**: Create new alarm
4. **Metric**: CPU Utilization
5. **Threshold**: Less than 30%
6. **Action**: Remove 1 instance
7. **Cooldown period**: 300 seconds

![Scale In Policy](img/scale-in-policy.png)

### Task 5: Test Auto Scaling

#### Step 5.1: Verify Initial Setup
1. Check that 2 instances are running
2. Verify instances are healthy in the target group
3. Test the ALB DNS name in a browser

![Initial Setup Verification](img/initial-verification.png)

#### Step 5.2: Generate Load for Scale-Out Test
1. Connect to one of the instances via SSH
2. Install stress testing tool:
```bash
sudo yum install -y stress
```
3. Generate CPU load:
```bash
stress --cpu 2 --timeout 600s
```

![Load Generation](img/load-generation.png)

#### Step 5.3: Monitor Scaling Activity
1. Go to Auto Scaling Groups console
2. Select your ASG
3. Click on "Activity" tab
4. Monitor scaling activities

![Scaling Activity](img/scaling-activity.png)

#### Step 5.4: Verify Scale-Out
1. Check CloudWatch metrics
2. Verify new instances are launched
3. Confirm instances are added to target group

![Scale Out Verification](img/scale-out-verification.png)

#### Step 5.5: Test Scale-In
1. Stop the stress test
2. Wait for CPU utilization to drop
3. Monitor scale-in activity

![Scale In Verification](img/scale-in-verification.png)

## Monitoring and Troubleshooting

### CloudWatch Metrics
Monitor these key metrics:
- CPU Utilization
- Network In/Out
- Target Group Health
- ALB Request Count

![CloudWatch Metrics](img/cloudwatch-metrics.png)

### Common Issues and Solutions

1. **Instances not launching**:
   - Check security group settings
   - Verify subnet configurations
   - Review launch template settings

2. **Health checks failing**:
   - Ensure application is running on correct port
   - Check security group rules
   - Verify health check path

3. **Scaling not triggered**:
   - Review CloudWatch alarms
   - Check scaling policies
   - Verify cooldown periods

## Cleanup

To avoid unnecessary charges, clean up resources in this order:

1. **Delete Auto Scaling Group**:
   - Set desired capacity to 0
   - Wait for instances to terminate
   - Delete the ASG

2. **Delete Load Balancer**:
   - Delete the ALB
   - Delete target groups

3. **Delete Launch Template**:
   - Delete the launch template

4. **Delete Security Groups**:
   - Delete custom security groups

![Cleanup Process](images/cleanup-process.png)


## Conclusion

You have successfully implemented an Auto Scaling Group with Application Load Balancer using Launch Templates. This setup provides:

- Automatic scaling based on demand
- High availability across multiple AZs
- Load distribution across healthy instances
- Infrastructure as Code approach with Launch Templates

