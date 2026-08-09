# AWS Infrastructure Automation with Terraform & GitHub Actions

## 📌 Project Overview

This project demonstrates how to **automate AWS infrastructure provisioning using Terraform and GitHub Actions**.

The infrastructure is created and managed as **Infrastructure as Code (IaC)**, allowing AWS resources to be provisioned, modified, and destroyed using Terraform commands and an automated CI/CD pipeline.

### 🚀 Technologies Used

* **AWS**
* **Terraform**
* **GitHub Actions**
* **Git & GitHub**
* **YAML**
* **Linux / Ubuntu**

---

🏗️ AWS Infrastructure

This project creates the following AWS infrastructure:

1 VPC
1 Public Subnet
1 Internet Gateway
1 Public Route Table
1 Route Table Association
1 Security Group
EC2 Instance(s)
AWS infrastructure automated through GitHub Actions

---

## 📂 Project Structure

aws-infra-automation/
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── environment/
│   │
│   ├── dev/
│   │   └── # Development environment configuration
│   │
│   ├── prod/
│   │   └── # Production environment configuration
│   │
│   └── modules/
│       ├── vpc.tf
│       ├── subnet.tf
│       ├── internate_gate.tf
│       ├── route_table.tf
│       ├── route_asso.tf
│       ├── sg.tf
│       ├── ec2.tf
│       └── variable.tf
│
├── README.md
└── .gitignore

---

## 🔄 CI/CD Workflow

GitHub Actions is used to automatically execute Terraform whenever changes are pushed to the repository.


Developer
    │
    │ git push
    ▼
GitHub Repository
    │
    ▼
GitHub Actions
    │
    ├── Checkout Code
    │
    ├── Configure AWS Credentials
    │
    ├── Setup Terraform
    │
    ├── Terraform Init
    │
    ├── Terraform Validate
    │
    ├── Terraform Plan
    │
    └── Terraform Apply
    │
    ▼
                         AWS
                          │
                          ▼
                    ┌───────────┐
                    │    VPC    │
                    │10.0.0.0/16│
                    └─────┬─────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │  Public Subnet  │
                 │   10.0.0.0/24   │
                 │   ap-south-1a   │
                 └────────┬────────┘
                          │
              ┌───────────┴───────────┐
              │                       │
              ▼                       ▼
        ┌─────────────┐        ┌──────────────┐
        │ EC2 Instance│        │ Security     │
        │   / EC2s    │        │ Group        │
        └──────┬──────┘        └──────────────┘
               │
               ▼
        ┌──────────────┐
        │ Public Route │
        │    Table     │
        └──────┬───────┘
               │
               ▼
        ┌──────────────┐
        │   Internet   │
        │   Gateway    │
        └──────┬───────┘
               │
               ▼
            Internet
```


 ⚙️ Terraform Workflow

Terraform follows the standard Infrastructure as Code workflow:

```bash
terraform init
```

Initializes the Terraform working directory and downloads required providers.

```bash
terraform validate
```

Checks whether the Terraform configuration is valid.

```bash
terraform plan
```

Shows what resources Terraform will create, modify, or destroy.

```bash
terraform apply
```

Creates or updates the AWS infrastructure.

```bash
terraform destroy
```

Destroys the infrastructure managed by Terraform.

---

## 🔐 GitHub Actions AWS Authentication

AWS credentials should **not** be hardcoded inside Terraform files or the GitHub Actions workflow.

GitHub repository secrets can be configured for AWS authentication.

Example secrets:

```text
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

The GitHub Actions workflow can then configure AWS credentials before executing Terraform.

> For production environments, using **GitHub OIDC with an AWS IAM role** is recommended instead of storing long-lived AWS access keys.

---

## 📝 GitHub Actions Pipeline

The workflow file is located at:

```text
.github/workflows/terraform.yml
```

The pipeline performs tasks such as:

```text
Checkout
   ↓
AWS Authentication
   ↓
Terraform Setup
   ↓
Terraform Init
   ↓
Terraform Validate
   ↓
Terraform Plan
   ↓
Terraform Apply
```

---

## 🌐 VPC Architecture

The project creates a basic AWS VPC architecture.

```text
                    AWS VPC
                 10.0.0.0/16
                       │
          ┌────────────┴────────────┐
          │                         │
    Public Subnet              Private Subnet
      10.0.1.0/24                10.0.2.0/24
          │                         │
     Internet Gateway             NAT Gateway
          │                         │
       Internet                  Internet
          │
      EC2 Instance
```

### Public Subnet

The public subnet is associated with a route table that contains a route to the Internet Gateway.

### Private Subnet

The private subnet does not have direct access from the internet. Outbound internet connectivity can be provided through a NAT Gateway.

---

## 🖥️ EC2 Instance

The project provisions an EC2 instance inside the VPC.

The EC2 instance can be configured with:

* AMI ID
* Instance type
* Subnet
* Security Group
* Key Pair
* IAM Instance Profile

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

## 🔒 Security

Sensitive information should never be committed to GitHub.

Do not commit:

```text
*.tfstate
*.tfstate.*
.terraform/
terraform.tfvars
.env
AWS credentials
private keys
```

The `.gitignore` file should contain appropriate Terraform and credential exclusions.

---

## 📊 Terraform State

Terraform uses a state file to track infrastructure resources.

For local development:

```text
terraform.tfstate
```

For a real production project, a **remote S3 backend with state locking** should be considered so that the Terraform state can be securely shared between team members and CI/CD pipelines.

---

## 🚀 How to Run Locally

### 1. Clone the repository

```bash
git clone <YOUR-GITHUB-REPOSITORY-URL>
```

### 2. Enter the project

```bash
cd aws-infrastructure-automation
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Validate the configuration

```bash
terraform validate
```

### 5. Review the infrastructure

```bash
terraform plan
```

### 6. Create the infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

when Terraform asks for confirmation.

---

## 🧹 Destroy Infrastructure

When the infrastructure is no longer required:

```bash
terraform destroy
```

This removes the AWS resources managed by Terraform.

---

## 🎯 Project Objectives

The main objectives of this project are:

* Learn AWS Infrastructure as Code
* Automate AWS infrastructure using Terraform
* Create VPC networking using Terraform
* Provision EC2 instances using Terraform
* Implement Terraform CI/CD using GitHub Actions
* Understand automated infrastructure deployment
* Practice AWS IAM and security
* Learn GitHub Actions workflow automation

---

## 💡 DevOps Concepts Demonstrated

This project demonstrates practical knowledge of:


Infrastructure as Code
        ↓
Terraform
        ↓
AWS
        ↓
Git
        ↓
GitHub
        ↓
GitHub Actions
        ↓
CI/CD
        ↓
Automated Infrastructure
```

---

## 🔮 Future Improvements

The project can be extended with:

* Terraform modules
* Separate Dev / Staging / Production environments
* S3 remote Terraform backend
* Terraform state locking
* GitHub Actions with AWS OIDC
* Terraform plan on Pull Request
* Manual approval before production deployment
* EKS cluster
* Application Load Balancer
* Auto Scaling Group
* RDS
* CloudWatch monitoring
* Security scanning
* Terraform formatting and validation checks

---

## 👨‍💻 Author

**Harshad Shinde**

AWS | Terraform | DevOps | Cloud Computing

---

## ⭐ Conclusion

This project demonstrates how AWS infrastructure can be managed using **Terraform** and automatically deployed through **GitHub Actions**.

Instead of manually creating AWS resources through the AWS Management Console, the infrastructure is defined as code and deployed through an automated CI/CD pipeline.

```text
Code → GitHub → GitHub Actions → Terraform → AWS
```

⭐ If you find this project useful, consider giving the repository a star.
