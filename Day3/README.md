# AWS EC2 Terraform Project

This project provisions an AWS EC2 instance using Terraform. It utilizes a custom module for EC2 instance creation, allowing you to specify the AMI and instance type.

## Project Structure

```
.
├── main.tf
├── module_ec2/
│   └── ec2_instance/
│       ├── main.tf
│       ├── variables.tf
│       └── output.tf
├── terraform.tfstate
├── terraform.tfstate.backup
```

- **main.tf**: Root Terraform configuration, includes the AWS provider and the EC2 module.
- **module_ec2/ec2_instance/**: Custom module for EC2 instance creation.
  - **main.tf**: Resource definition for the EC2 instance.
  - **variables.tf**: Input variables for the module.
  - **output.tf**: Outputs from the module (e.g., public IP).

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) >= 1.12.2
- AWS account and credentials configured (e.g., via environment variables or AWS CLI)

## Usage

1. **Clone the repository**
2. **Initialize Terraform**
   ```sh
   terraform init
   ```
3. **Apply the configuration**
   ```sh
   terraform apply
   ```
   Confirm the action when prompted.

## Variables

The EC2 module accepts the following variables:

| Name                | Description           | Type   | Example                |
|---------------------|----------------------|--------|------------------------|
| `ami_value`         | AMI ID for instance  | string | "ami-05ffe3c48a9991133" |
| `instance_type_value` | EC2 instance type    | string | "t2.micro"             |

These are set in the root `main.tf` when calling the module.

## Outputs

| Name           | Description                |
|----------------|----------------------------|
| `public_ip_add`| The public IP of the EC2 instance |

Example output (from previous state):
```
public_ip_add = "13.222.170.158"
```

## Example

A minimal `main.tf` to use this module:

```hcl
provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./module_ec2/ec2_instance"
  ami_value = "ami-05ffe3c48a9991133"
  instance_type_value = "t2.micro"
}
```

## Cleanup

To destroy the resources created by this project:
```sh
terraform destroy
```

## License

This project is for educational/demo purposes. 