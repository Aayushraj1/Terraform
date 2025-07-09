terraform {
  backend "s3" {
    bucket = "vprofileapp0001"
    key    = "aayush/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
