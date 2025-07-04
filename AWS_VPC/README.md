# Network Mastery with AWS VPC - DevOps Learning Project

## Table of Contents
- [Project Overview](#project-overview)
- [Learning Objectives](#learning-objectives)
- [Prerequisites](#prerequisites)
- [Core Concepts](#core-concepts)
- [Project Implementation](#project-implementation)
- [Project Reflection](#project-reflection)
- [Additional Resources](#additional-resources)

## Project Overview

This hands-on project focuses on mastering Amazon Web Services (AWS) Virtual Private Cloud (VPC) fundamentals. Through practical implementation, I explore core networking concepts including subnets, gateways, and routing tables while building a secure, scalable network infrastructure for the fictional company **GatoGrowFast.com**.

## Learning Objectives

- Gain practical experience with AWS VPC service
- Understand VPC, Subnets, Internet Gateway, and NAT Gateway concepts
- Configure secure network architecture in AWS
- Implement proper routing and connectivity
- Establish VPC peering connections
- Apply cloud networking best practices

## Prerequisites

- AWS Account with appropriate permissions
- Basic understanding of networking concepts
- Familiarity with AWS Management Console
- Understanding of IP addressing and CIDR notation

## Core Concepts

### What is a VPC?

A Virtual Private Cloud (VPC) is like creating a private room in the cloud just for your company's use. Think of it as GatoGrowFast.com's virtual office building where different departments can communicate securely while maintaining isolation from other companies.


### Subnets

Subnets are like different departments within GatoGrowFast.com's office building - HR, Finance, and IT. Each department has its own area with specific access rules and security requirements.

### Internet Gateway

An Internet Gateway acts like a router that controls data flow between your VPC and the internet, similar to how a building's main entrance controls access to the outside world.

### NAT Gateway

A NAT (Network Address Translation) Gateway functions as a secret agent between your private resources and the internet. It allows outbound internet access while keeping your resources hidden and secure.

### IP Addresses and CIDR

**IP Address**: A unique identifier for devices on a network, like a phone number for computers.

- **Public IP**: Like your home address - visible to the outside world
- **Private IP**: Like an internal extension number - only used within your network

**CIDR Notation**: A shorthand way to describe groups of IP addresses. For example, `192.168.1.0/24` represents all addresses from 192.168.1.0 to 192.168.1.255.

**Formula for calculating available IPs in a CIDR block:**
```
Number of IPs = 2^(32 - prefix length) - 2
```
The "-2" excludes the network and broadcast addresses.

**Example**: For `192.168.1.0/24`:
- Available IPs = 2^(32-24) - 2 = 2^8 - 2 = 256 - 2 = 254 addresses

## Project Implementation

### Part 1: Setting Up a Virtual Private Cloud (VPC)

#### Step 1: Navigate to VPC Service
1. Log into your AWS Management Console
2. In the search bar, type "VPC" and click on the VPC service

![AWS Console VPC Search](img/01-aws-console-vpc-search.png)

#### Step 2: Create VPC
1. Click on "Create VPC"
2. Choose "VPC only" option
3. Configure the following settings:
   - **Name**: `GatoGrowFast-VPC`
   - **IPv4 CIDR block**: `10.0.0.0/16`
   - **IPv6 CIDR block**: No IPv6 CIDR block
   - **Tenancy**: Default

![VPC Creation Form](img/02-vpc-creation-form.png)

4. Click "Create VPC"

![VPC Created Successfully](img/03-vpc-created.png)

> **Note**: If you encounter an error about CIDR block size, ensure your CIDR block is between /16 and /28.

### Part 2: Configuring Subnets within the VPC

#### Step 1: Navigate to Subnets
1. In the VPC dashboard, click on "Subnets" in the left navigation panel
2. Click "Create subnet"

![Subnets Navigation](img/04-subnets-navigation.png)

#### Step 2: Create Public Subnet
1. Select your VPC: `GatoGrowFast-VPC`
2. Configure the first subnet:
   - **Subnet name**: `my-public-subnet-1`
   - **Availability Zone**: Choose an AZ (e.g., `us-east-1a`)
   - **IPv4 CIDR block**: `10.0.1.0/24`

![Public Subnet Configuration](img/05.png)

#### Step 3: Add Private Subnet
1. Click "Add subnet"
2. Configure the second subnet:
   - **Subnet name**: `my-private-subnet-1`
   - **Availability Zone**: Choose a different AZ (e.g., `us-east-1b`)
   - **IPv4 CIDR block**: `10.0.2.0/24`

![Private Subnet Configuration](img/06-private-subnet-config.png)

3. Click "Create subnet"

![Subnets Created Successfully](img/07-subnets-created.png)

### Part 3: Creating Internet Gateway and Attaching to VPC

#### Step 1: Create Internet Gateway
1. In the VPC dashboard, click on "Internet gateways"
2. Click "Create internet gateway"

![Internet Gateway Navigation](img/08-igw-navigation.png)

3. Configure:
   - **Name**: `GatoGrowFast-IGW`
4. Click "Create internet gateway"

![IGW Creation](img/09-igw-creation.png)

#### Step 2: Attach Internet Gateway to VPC
1. Select your newly created Internet Gateway
2. Click "Actions" → "Attach to VPC"

![IGW Attach Action](img/10-igw-attach-action.png)

3. Select `GatoGrowFast-VPC`
4. Click "Attach internet gateway"

![IGW Attachment](img/11-igw-attachment.png)

![IGW Attached Successfully](img/12-igw-attached.png)

### Part 4: Enabling Internet Connectivity with Route Tables

#### Step 1: Create Route Table for Public Subnet
1. Navigate to "Route tables" in the VPC dashboard
2. Click "Create route table"

![Route Table Navigation](img/13-route-table-navigation.png)

3. Configure:
   - **Name**: `public-route-table`
   - **VPC**: Select `GatoGrowFast-VPC`
4. Click "Create route table"

![Route Table Creation](img/14-route-table-creation.png)

#### Step 2: Configure Routes for Internet Access
1. Select your route table
2. Click on "Routes" tab
3. Click "Edit routes"

![Edit Routes](img/15-edit-routes.png)

4. Click "Add route"
5. Configure:
   - **Destination**: `0.0.0.0/0` (all IPv4 traffic)
   - **Target**: Internet Gateway → Select `GatoGrowFast-IGW`
6. Click "Save changes"

![Add Internet Route](img/16-add-internet-route.png)

#### Step 3: Associate Public Subnet
1. Click on "Subnet associations" tab
2. Click "Edit subnet associations"

![Subnet Associations](img/17-subnet-associations.png)

3. Select `my-public-subnet-1`
4. Click "Save associations"

![Associate Public Subnet](img/18-associate-public-subnet.png)

### Part 5: Enabling Outbound Internet Access through NAT Gateway

#### Step 1: Create NAT Gateway
1. Navigate to "NAT gateways" in the VPC dashboard
2. Click "Create NAT gateway"

![NAT Gateway Navigation](img/19-nat-gateway-navigation.png)

3. Configure:
   - **Name**: `GatoGrowFast-NAT`
   - **Subnet**: Select `my-private-subnet-1` 
   - **Connectivity type**: Private


![NAT Gateway Creation](img/20-nat-gateway-creation.png)

4. Click "Create NAT gateway"

![NAT Gateway Created](img/21-nat-gateway-created.png)

5. Select your NAT Gateway
6. Then navigate to the "Details" tab
7. From there, locate the subnet ID and click on it.

![NAT Gateway Details](img/22.png)

8. In the subnet page, navigate to the "Route Table" tab
9. Click on the route table ID to open it
10. Proceed to the "Routes" tab, then click "Edit routes"
    
![NAT Route Table](img/23.png)

#### Step 2: Add Route for NAT Gateway
1.  Add route:
   - **Destination**: `0.0.0.0/0`
   - **Target**: NAT Gateway → Select `GatoGrowFast-NAT`
2.  Click "Save changes"

![Add NAT Route](img/24.png)

#### Step 3: Verify Subnet Associations
1. Click "Subnet associations" tab
2. Ensure `my-private-subnet-1` is associated
3. If not, click "Edit subnet associations" and associate it

![Private Subnet Association](img/25.png)

### Part 6: Establishing VPC Peering Connections

#### Step 1: Create Second VPC (for demonstration)
1. Create another VPC with CIDR `192.168.0.0/16`
2. Name it `Requester-VPC` or similar

![Requester VPC Creation](img/26.png

3. Create another VPC with CIDR `172.16.0.0/16`
4. Name it `Accepter-VPC` or similar

![Accepter VPC Creation](img/27.png)

#### Step 2: Create VPC Peering Connection
1. Navigate to "Peering connections"
2. Click "Create peering connection"

![VPC Peering Navigation](img/28.png)

3. Configure:
   - **Name**: `GatoGrowFast-Peering`
   - **VPC (Requester)**: `Requester-VPC`
   - **Account**: My account
   - **Region**: This Region
   - **VPC (Accepter)**: `Accepter-VPC`

![Peering Connection Configuration](img/29.png)

4. Click "Create peering connection"

![Peering Connection Created](img/30.png)

#### Step 3: Accept Peering Connection
1. Select the peering connection
2. Click "Actions" → "Accept request"

![Accept Peering Request](img/30.png)

3. Click "Accept request"

![Peering Request Accepted](img/31.png)

#### Step 4: Update Route Tables for Peering
1. Go to route tables for both VPCs
2. Add routes pointing to each other's CIDR blocks through the peering connection

**For Requester-VPC route table:**
- **Destination**: `192.168.0.0/16`
- **Target**: Peering Connection → `GatoGrowFast-Peering`

**For Accepter-VPC route table:**
- **Destination**: `172.16.0.0/16`
- **Target**: Peering Connection → `GatoGrowFast-Peering`

![Peering Routes Configuration](img/32.png)


## Key Differences: Internet Gateway vs NAT Gateway

| Feature | Internet Gateway | NAT Gateway |
|---------|------------------|-------------|
| **Direction** | Bidirectional (in/out) | Unidirectional (out only) |
| **Public Access** | Resources get public IPs | Resources remain private |
| **Use Case** | Web servers, public apps | Private servers, databases |
| **Security** | Direct internet exposure | Hidden from internet |

## VPC Peering Best Practices

- **CIDR Blocks**: Must not overlap between peered VPCs
- **Region Compatibility**: Can peer across regions and accounts
- **Security Groups**: Configure to allow traffic between VPCs
- **Routing**: Update route tables in both VPCs
- **Limitations**: No transitive routing through peering connections

## Understanding VPC Endpoints

VPC endpoints provide a secure, private connection between your VPC and AWS services without routing traffic over the internet. This is crucial for sensitive data transfers, such as backing up EC2 data to S3.


## Project Reflection

### Achievements
- ✅ Successfully created and configured VPC infrastructure
- ✅ Implemented secure networking with public and private subnets
- ✅ Configured internet connectivity through Internet Gateway
- ✅ Enabled secure outbound access via NAT Gateway
- ✅ Established VPC peering for inter-VPC communication
- ✅ Gained hands-on experience with AWS networking concepts

### Challenges Overcome
- **CIDR Block Sizing**: Learned about /16 to /28 limitations
- **Route Table Configuration**: Understanding traffic flow and routing
- **Security Considerations**: Balancing accessibility with security

### Key Learnings
- Network architecture design principles
- AWS VPC service capabilities and limitations
- Security best practices for cloud networking
- Importance of proper subnet design and routing

### Skills Developed
- AWS Management Console navigation
- Network troubleshooting and configuration
- Cloud security implementation
- Infrastructure documentation

## Additional Resources

- [AWS VPC Documentation](https://docs.aws.amazon.com/vpc/)
- [AWS VPC Peering Guide](https://docs.aws.amazon.com/vpc/latest/peering/)
- [AWS Networking Best Practices](https://aws.amazon.com/architecture/well-architected/)
- [CIDR Calculator Tools](https://www.subnet-calculator.com/)
``
