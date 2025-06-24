terraform {

  backend "s3" {
    bucket = "mysimplebuc"
    key    = "learn-eks/terraform.tfstate"
    region = "ap-south-1"
  }

}
