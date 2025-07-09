# 🚀 Terraform AWS Infrastructure Project

Welcome to the **Terraform AWS Infrastructure Project**! This repository demonstrates modern Infrastructure as Code (IaC) practices using [Terraform](https://www.terraform.io/) to provision and manage cloud resources on AWS. It is designed for reliability, scalability, and best practices in state management and automation.

---

## 🌟 Features

- **AWS EC2 Instance**: Deploys a cost-effective, always-free tier `t2.micro` EC2 instance using a specified Amazon Machine Image (AMI).
- **DynamoDB Table for State Locking**: Implements a DynamoDB table to ensure safe, concurrent Terraform operations with state locking.
- **Remote State Management**: Stores Terraform state securely in an S3 bucket, enabling team collaboration and disaster recovery.
- **Modular & Extensible**: Easily extend this project to add more AWS resources as your infrastructure grows.

---

## 🏗️ Architecture Overview

```mermaid
graph TD;
  A[Terraform CLI] -->|applies| B[AWS Provider]
  B --> C[EC2 Instance (t2.micro)]
  B --> D[DynamoDB Table (terraform-locks)]
  B --> E[S3 Bucket (Remote State)]
```

---

## 📂 Project Structure

- `main.tf` — Defines AWS provider, EC2 instance, and DynamoDB table resources.
- `backend.tf` — Configures remote state backend (S3 + DynamoDB for locking).
- `terraform.tfstate*` — State files (should be remote in production).

---

## 🚦 Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.12.2
- AWS account with programmatic access (Access Key ID & Secret Access Key)
- S3 bucket (`vprofileapp0001`) and DynamoDB table (`terraform-locks`) in `us-east-1` (created automatically)

---

## ⚡ Quick Start

1. **Clone the repository:**
   ```sh
   git clone <this-repo-url>
   cd day4
   ```
2. **Initialize Terraform:**
   ```sh
   terraform init
   ```
3. **Review the plan:**
   ```sh
   terraform plan
   ```
4. **Apply the configuration:**
   ```sh
   terraform apply
   ```

---

## 🔒 State Management & Locking

- **Remote State**: State is stored in S3 for reliability and team access.
- **Locking**: DynamoDB table prevents concurrent modifications, ensuring safe deployments.

---

## 🛡️ Best Practices

- Never commit sensitive data (like AWS credentials) to version control.
- Use remote state for all team-based or production deployments.
- Regularly review and update provider versions for security.
- Tag resources for cost tracking and environment management.

---

## 🤝 Contributing

Contributions are welcome! Please open issues or pull requests for improvements, bug fixes, or new features.

---

## 📜 License

This project is licensed under the [Mozilla Public License 2.0](.terraform/providers/registry.terraform.io/hashicorp/aws/6.2.0/windows_amd64/LICENSE.txt).

---

## 🙏 Acknowledgements

- [HashiCorp Terraform](https://www.terraform.io/)
- [Amazon Web Services](https://aws.amazon.com/) 