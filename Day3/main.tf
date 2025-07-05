provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./module_ec2/ec2_instance"
  ami_value = "ami-05ffe3c48a9991133"
  instance_type_value = "t2.micro"
}