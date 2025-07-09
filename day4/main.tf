provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "aayush" {
  instance_type = "t2.micro"
  ami = "ami-05ffe3c48a9991133"
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Environment = "dev"
    Name        = "Terraform Lock Table"
  }
}