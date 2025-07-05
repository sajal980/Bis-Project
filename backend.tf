terraform {
  backend "s3" {
    bucket = "bistracker"
    key    = "terraform/terraform.tfstate"
    region = "ap-south-1"
  }
}