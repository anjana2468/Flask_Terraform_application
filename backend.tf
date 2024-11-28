# state.tf
terraform {
  backend "s3" {
    bucket = "anjana-bucket" 
    key    = "terraform.tfstate"
    region = "us-west-2"
    encrypt= true
  }
}
