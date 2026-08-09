# 🚀 AWS Infrastructure Automation with Terraform & GitHub Actions

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI%2FCD-2088FF)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-black)
![YAML](https://img.shields.io/badge/YAML-Configuration-red)
![Git](https://img.shields.io/badge/Git-Version%20Control-F05032)

## 📌 Project Overview

**AWS Infrastructure Automation with Terraform & GitHub Actions** is a practical DevOps project that demonstrates how to provision and manage AWS infrastructure using **Infrastructure as Code (IaC)** and automate the deployment process through **GitHub Actions**.

Instead of manually creating AWS resources through the AWS Management Console, infrastructure is defined using Terraform configuration files and deployed through an automated CI/CD pipeline.

### 🔄 High-Level Workflow

```text
Developer
    │
    │ git push
    ▼
GitHub Repository
    │
    ▼
GitHub Actions
    │
    ├── Checkout
    ├── AWS Authentication
    ├── Terraform Setup
    ├── Terraform Init
    ├── Terraform Format Check
    ├── Terraform Validate
    ├── Terraform Plan
    └── Terraform Apply
    │
    ▼
AWS Infrastructure
```

---

# 🎯 Project Objectives

This project was created to gain practical experience with:

* AWS networking
* Infrastructure as Code
* Terraform
* Git and GitHub
* GitHub Actions
* CI/CD automation
* AWS IAM
* EC2 provisioning
* VPC architecture
* Terraform state management
* YAML-based pipeline configuration
* Infrastructure deployment and lifecycle management

---

# 🛠️ Technologies Used

| Technology         | Purpose                         |
| ------------------ | ------------------------------- |
| **AWS**            | Cloud infrastructure            |
| **Terraform**      | Infrastructure as Code          |
| **GitHub Actions** | CI/CD automation                |
| **Git**            | Version control                 |
| **GitHub**         | Source code management          |
| **YAML**           | GitHub Actions configuration    |
| **Linux / Ubuntu** | CI/CD runner and administration |

---

# 🏗️ AWS Infrastructure

The project provisions the following AWS resources:

* VPC
* Public Subnet
* Internet Gateway
* Public Route Table
* Route Table Association
* Security Group
* EC2 Instance(s)

### AWS Architecture

```text
                         AWS
                          │
                          ▼
                ┌───────────────────┐
                │       VPC         │
                │    10.0.0.0/16    │
                └─────────┬─────────┘
                          │
                          ▼
                ┌───────────────────┐
                │   Public Subnet   │
                │    10.0.1.0/24    │
                │   ap-south-1a     │
                └─────────┬─────────┘
                          │
                 ┌────────┴────────┐
                 │                 │
                 ▼                 ▼
        ┌────────────────┐  ┌────────────────┐
        │  EC2 Instance  │  │ Security Group│
        └────────┬───────┘  └────────────────┘
                 │
                 ▼
        ┌──────────────────┐
        │  Public Route    │
        │      Table       │
        └────────┬─────────┘
                 │
                 ▼
        ┌──────────────────┐
        │ Internet Gateway │
        └────────┬─────────┘
                 │
                 ▼
              Internet
```

---

# 🌐 VPC Networking

The VPC uses the CIDR:

```text
10.0.0.0/16
```

The public subnet uses:

```text
10.0.1.0/24
```

Example architecture:

```text
VPC
10.0.0.0/16
│
└── Public Subnet
    10.0.1.0/24
    ap-south-1a
    │
    ├── EC2
    │
    └── Route Table
          │
          └── 0.0.0.0/0
                │
                ▼
         Internet Gateway
```

### Public Subnet

The public subnet is associated with a route table containing:

```text
Destination       Target

10.0.0.0/16       local
0.0.0.0/0         Internet Gateway
```

This allows resources in the public subnet to communicate with the internet when the required public IP and security-group rules are configured.

---

# 🖥️ EC2 Instance

Terraform provisions an EC2 instance inside the VPC.

The EC2 configuration can include:

* AMI ID
* Instance type
* Subnet ID
* Security Group
* Key Pair
* IAM Instance Profile
* Root EBS volume

Example:

```text
VPC
 │
 └── Public Subnet
       │
       └── EC2 Instance
             │
             └── Security Group
```

---

# 🔐 Security Group

The Security Group acts as a virtual firewall for the EC2 instance.

Example rules can include:

```text
Inbound
────────────────────────────
SSH     → Port 22
HTTP    → Port 80
HTTPS   → Port 443

Outbound
────────────────────────────
All traffic
```

> In a production environment, SSH should preferably be restricted to trusted IP addresses or replaced with a more secure access mechanism such as AWS Systems Manager.

---

# 📂 Project Structure

```text
aws-infrastructure-automation/
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── environment/
│   │
│   ├── dev/
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── prod/
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── modules/
│       ├── vpc.tf
│       ├── subnet.tf
│       ├── internet_gateway.tf
│       ├── route_table.tf
│       ├── route_association.tf
│       ├── security_group.tf
│       ├── ec2.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── .gitignore
├── README.md
└── LICENSE
```

### Structure Explanation

| Directory/File         | Purpose                                      |
| ---------------------- | -------------------------------------------- |
| `.github/workflows/`   | GitHub Actions workflows                     |
| `environment/dev/`     | Development environment                      |
| `environment/prod/`    | Production environment                       |
| `modules/`             | Reusable Terraform infrastructure components |
| `vpc.tf`               | VPC configuration                            |
| `subnet.tf`            | Subnet configuration                         |
| `internet_gateway.tf`  | Internet Gateway                             |
| `route_table.tf`       | Route table                                  |
| `route_association.tf` | Subnet-route table association               |
| `security_group.tf`    | EC2 security group                           |
| `ec2.tf`               | EC2 configuration                            |
| `variables.tf`         | Input variables                              |
| `outputs.tf`           | Terraform outputs                            |
| `terraform.yml`        | CI/CD workflow                               |

---

# 🧩 Terraform Module Design

The infrastructure is organized into logical Terraform components.

```text
Environment
     │
     ▼
Terraform Modules
     │
     ├── VPC
     ├── Subnet
     ├── Internet Gateway
     ├── Route Table
     ├── Security Group
     └── EC2
          │
          ▼
         AWS
```

This approach improves:

* Reusability
* Maintainability
* Organization
* Environment separation
* Scalability

---

# ⚙️ Terraform Workflow

Terraform follows the standard Infrastructure as Code lifecycle.

## 1. Terraform Init

```bash
terraform init
```

Initializes the working directory and downloads the required Terraform providers and modules.

---

## 2. Terraform Format

```bash
terraform fmt
```

Formats Terraform configuration files according to Terraform's standard formatting rules.

For CI validation:

```bash
terraform fmt -check
```

---

## 3. Terraform Validate

```bash
terraform validate
```

Checks whether the Terraform configuration is syntactically and structurally valid.

---

## 4. Terraform Plan

```bash
terraform plan
```

Creates an execution plan showing what Terraform intends to:

```text
Create
Update
Destroy
```

---

## 5. Terraform Apply

```bash
terraform apply
```

Creates or updates the infrastructure defined in the Terraform configuration.

---

## 6. Terraform Destroy

```bash
terraform destroy
```

Removes the infrastructure managed by Terraform.

---

# 🔄 GitHub Actions CI/CD Pipeline

The GitHub Actions workflow automatically executes Terraform when changes are pushed to the repository.

### Pipeline

```text
                  Git Push
                     │
                     ▼
              GitHub Repository
                     │
                     ▼
              GitHub Actions
                     │
              ┌──────┴──────┐
              │             │
              ▼             ▼
          Checkout      AWS Auth
              │             │
              └──────┬──────┘
                     ▼
              Setup Terraform
                     │
                     ▼
              Terraform Init
                     │
                     ▼
             Terraform Format
                     │
                     ▼
             Terraform Validate
                     │
                     ▼
              Terraform Plan
                     │
                     ▼
              Terraform Apply
                     │
                     ▼
                    AWS
```

---

# 📝 GitHub Actions Workflow

The workflow is located at:

```text
.github/workflows/terraform.yml
```

A typical pipeline performs:

```yaml
Checkout Code
      ↓
Configure AWS Credentials
      ↓
Setup Terraform
      ↓
Terraform Init
      ↓
Terraform Format Check
      ↓
Terraform Validate
      ↓
Terraform Plan
      ↓
Terraform Apply
```

This provides automated infrastructure deployment whenever approved changes are pushed.

---

# 🔐 AWS Authentication

AWS credentials should **never be hardcoded** inside Terraform files or GitHub Actions workflows.

### ❌ Never do this

```yaml
AWS_ACCESS_KEY_ID: "AKIA..."
AWS_SECRET_ACCESS_KEY: "..."
```

### Recommended approaches

For learning/testing:

```text
GitHub Secrets
     │
     ▼
AWS Access Key
AWS Secret Key
```

For production:

```text
GitHub Actions
      │
      ▼
GitHub OIDC
      │
      ▼
AWS IAM Role
      │
      ▼
AWS Resources
```

### 🔒 Recommended Production Authentication

**GitHub OIDC + AWS IAM Role** is preferred because it avoids storing long-lived AWS access keys in GitHub.

---

# 🗄️ Terraform State

Terraform uses a state file to keep track of infrastructure resources.

Local state:

```text
terraform.tfstate
```

The state contains important information about the resources managed by Terraform.

Therefore, it should **not be committed to GitHub**.

### Production Architecture

A production implementation can use:

```text
GitHub Actions
       │
       ▼
Terraform
       │
       ▼
S3 Remote Backend
       │
       ▼
Terraform State
```

A remote backend provides centralized state management for CI/CD and team environments.

---

# 🔒 `.gitignore`

Sensitive and generated Terraform files should be excluded from Git.

Example:

```gitignore
# Terraform
.terraform/
*.tfstate
*.tfstate.*
*.tfplan
crash.log
crash.*.log

# Terraform variable files
*.tfvars
*.tfvars.json

# Override files
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# Environment files
.env

# Credentials
*.pem
*.key

# IDE
.vscode/
.idea/

# OS
.DS_Store
Thumbs.db
```

> Never commit AWS credentials, private keys, Terraform state files, or other secrets.

---

# 🚀 Local Setup

## Prerequisites

Install:

* AWS CLI
* Terraform
* Git
* GitHub account
* AWS account

Verify installations:

```bash
terraform version
```

```bash
aws --version
```

```bash
git --version
```

---

# 1️⃣ Clone Repository

```bash
git clone <YOUR-GITHUB-REPOSITORY-URL>
```

Move into the project:

```bash
cd aws-infrastructure-automation
```

---

# 2️⃣ Configure AWS Authentication

For local development, configure AWS CLI:

```bash
aws configure
```

Then verify:

```bash
aws sts get-caller-identity
```

---

# 3️⃣ Move to Environment

For development:

```bash
cd environment/dev
```

---

# 4️⃣ Initialize Terraform

```bash
terraform init
```

---

# 5️⃣ Format Configuration

```bash
terraform fmt
```

---

# 6️⃣ Validate Configuration

```bash
terraform validate
```

---

# 7️⃣ Review Infrastructure

```bash
terraform plan
```

---

# 8️⃣ Deploy Infrastructure

```bash
terraform apply
```

Confirm:

```text
yes
```

Terraform will then provision the configured AWS infrastructure.

---

# 🧹 Destroy Infrastructure

When the infrastructure is no longer required:

```bash
terraform destroy
```

> Always verify the Terraform plan before destroying infrastructure, especially when working with production resources.

---

# 📊 Infrastructure Lifecycle

```text
Terraform Configuration
        │
        ▼
    terraform init
        │
        ▼
  terraform validate
        │
        ▼
    terraform plan
        │
        ▼
   terraform apply
        │
        ▼
     AWS Cloud
        │
        ▼
   Infrastructure
        │
        ▼
  terraform destroy
```

---

# 🔁 Git Workflow

The project follows a basic Git-based workflow:

```text
Developer
   │
   ▼
Create / Modify Terraform Code
   │
   ▼
git add .
   │
   ▼
git commit
   │
   ▼
git push
   │
   ▼
GitHub
   │
   ▼
GitHub Actions
   │
   ▼
Terraform
   │
   ▼
AWS
```

Example:

```bash
git add .
```

```bash
git commit -m "Add AWS infrastructure automation"
```

```bash
git push origin main
```

---

# 🧪 Validation and Quality Checks

The CI/CD pipeline can perform the following checks before deployment:

```text
terraform fmt -check
        ↓
terraform validate
        ↓
terraform plan
        ↓
terraform apply
```

This helps catch configuration and formatting issues before infrastructure changes are deployed.

---

# 🔐 Security Best Practices

This project follows basic infrastructure security principles.

### Credentials

* Never hardcode AWS credentials.
* Use GitHub Secrets for learning environments.
* Prefer GitHub OIDC for production.

### Terraform State

* Do not commit `.tfstate` files.
* Use a remote backend for team environments.
* Restrict access to Terraform state.

### EC2

* Restrict SSH access.
* Allow only required ports.
* Use IAM roles where possible.
* Keep AMIs and operating systems updated.

### GitHub

* Protect the `main` branch.
* Use pull requests.
* Require CI checks before merging.
* Use environment protection for production deployments.

---

# 📈 DevOps Concepts Demonstrated

```text
                 DevOps Workflow

                      Git
                       │
                       ▼
                    GitHub
                       │
                       ▼
               GitHub Actions
                       │
                       ▼
                    CI/CD
                       │
                       ▼
                  Terraform
                       │
                       ▼
               Infrastructure
                  as Code
                       │
                       ▼
                     AWS
                       │
          ┌────────────┼────────────┐
          ▼            ▼            ▼
         VPC          EC2       Networking
```

### Key Concepts

* Infrastructure as Code
* Configuration Management
* CI/CD
* Cloud Automation
* Version Control
* Infrastructure Provisioning
* AWS Networking
* IAM and Security
* Terraform State
* Environment Management
* Automation

---

# 💼 Real-World Use Case

In a real organization, infrastructure changes should not depend on engineers manually creating resources through the AWS Console.

Instead:

```text
Developer creates Terraform change
              │
              ▼
        Pull Request
              │
              ▼
       GitHub Actions
              │
       ┌──────┴──────┐
       ▼             ▼
    Validate        Plan
       │             │
       └──────┬──────┘
              ▼
          Code Review
              │
              ▼
            Merge
              │
              ▼
            Apply
              │
              ▼
             AWS
```

This provides a repeatable and auditable infrastructure deployment process.

---

# 🏭 Production Improvements

The current project provides a foundation for AWS infrastructure automation.

For a production-ready implementation, the architecture can be extended with:

### Terraform

* Reusable modules
* Remote S3 backend
* State locking
* Multiple environments
* Terraform workspaces where appropriate
* Input validation
* Outputs
* Data sources

### GitHub Actions

* Pull Request validation
* Terraform plan on PR
* Manual approval for production
* Protected environments
* AWS OIDC authentication
* Automated security scanning
* Terraform linting

### AWS

* Private subnets
* NAT Gateway
* Application Load Balancer
* Auto Scaling Group
* RDS
* EKS
* CloudWatch
* IAM roles
* VPC endpoints

### Security

* Least-privilege IAM
* Secrets management
* Security scanning
* Branch protection
* Restricted security groups

---

# 🔮 Future Architecture

The project can eventually be expanded into a more production-like architecture:

```text
                         GitHub
                            │
                            ▼
                    GitHub Actions
                            │
                    GitHub OIDC
                            │
                            ▼
                       AWS IAM
                            │
                            ▼
                       Terraform
                            │
                            ▼
                         VPC
                ┌───────────┴───────────┐
                │                       │
         Public Subnets           Private Subnets
                │                       │
                ▼                       ▼
             ALB                  Application
                │                       │
                ▼                       ▼
              EC2/ASG                    RDS
                                       
                         + CloudWatch
                         + S3 Backend
                         + Security
```

---

# 📚 What I Learned

Through this project, I gained practical experience in:

* Designing basic AWS VPC infrastructure
* Creating AWS resources using Terraform
* Managing infrastructure using IaC
* Creating reusable Terraform components
* Writing GitHub Actions workflows
* Automating Terraform deployments
* Managing AWS authentication
* Understanding Terraform state
* Using Git and GitHub for infrastructure code
* Troubleshooting Terraform configuration
* Understanding CI/CD infrastructure workflows

---

# 🎤 Interview Explanation

If asked **"Explain your Terraform project"**, a concise explanation would be:

> I developed an AWS infrastructure automation project using Terraform and GitHub Actions. I defined AWS resources such as a VPC, public subnet, Internet Gateway, route table, security group, and EC2 instance as Infrastructure as Code. I organized the Terraform configuration into reusable components and used GitHub Actions to automate Terraform initialization, validation, planning, and deployment whenever infrastructure changes are pushed to GitHub. For authentication, AWS credentials can be managed through GitHub Secrets, while for production I would use GitHub OIDC with an AWS IAM role. The project helped me understand AWS networking, Terraform state, CI/CD, IAM, and automated infrastructure provisioning.

---

# ⭐ Key Project Highlights

```text
✅ AWS Infrastructure as Code
✅ Terraform
✅ GitHub Actions CI/CD
✅ AWS VPC Networking
✅ EC2 Automation
✅ Security Groups
✅ Terraform Modules
✅ Git & GitHub
✅ YAML
✅ AWS IAM
✅ Terraform State
✅ Infrastructure Automation
```

---

# 👨‍💻 Author

## Harshad Shinde

**AWS | Terraform | DevOps | Cloud Computing**

---

# ⭐ Conclusion

This project demonstrates how cloud infrastructure can be managed using modern DevOps practices.

Instead of manually creating AWS resources through the AWS Console:

```text
Terraform Code
      │
      ▼
    GitHub
      │
      ▼
GitHub Actions
      │
      ▼
   Terraform
      │
      ▼
     AWS
```

The result is a **repeatable, version-controlled, and automated infrastructure deployment workflow**.

⭐ If you find this project useful, consider giving the repository a star.
