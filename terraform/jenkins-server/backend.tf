terraform {

  backend "s3" {
    bucket = "mysimplebuc"
    key    = "jenkins/terraform.tfstate"
    region = "ap-south-1"
  }

}
