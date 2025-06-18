terraform {
  backend "s3" {
    bucket = "my-secure-tf-state-bucket-abhay-123"
    key    = "global/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
  }
}
