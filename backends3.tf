terraform {
  backend "s3" {
    bucket = "terraformnewst"
    key    = "statefile/terraform.tfstate"
    region = "us-east-1"
  }
}
