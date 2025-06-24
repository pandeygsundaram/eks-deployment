#vpc
module "vpc" {

  source = "terraform-aws-modules/vpc/aws"

  name = "jenkins-vpc"
  cidr = var.vpc_cidr

  azs                     = data.aws_availability_zones.azs.names
  public_subnets          = var.public_subnets
  map_public_ip_on_launch = true


  enable_dns_hostnames = true

  tags = {
    Name        = "jenkins-vpc"
    Terraform   = "true"
    Environment = "dev"
  }

  public_subnet_tags = {
    Name = "jenkins-subnet"
  }

}



#sg


module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "jenkins-sg"
  description = "Security group for jenkins server"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
      }, {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 9000
      to_port     = 9000
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  egress_with_cidr_blocks = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  }]


  tags = {
    Name = "jenkins-sg"
  }

}


#ec2


resource "aws_instance" "jenkins" {
  ami                         = data.aws_ami.example.image_id
  instance_type               = var.instance_type
  key_name                    = "jenkins-server-key"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.sg.security_group_id]
  associate_public_ip_address = true
  monitoring = true
  user_data =          file("jenkins-install.sh")

  tags = {
    Name        = "Jenkins-Server"
    Terraform   = "true"
    Environment = "dev"
  }
}












# module "ec2_instance"  {
#   source = "terraform-aws-modules/ec2-instance/aws"
#   version = "5.8.0"
# #   name = "Jenkins-Server"
#   ami = data.aws_ami.example.image_id 
#   instance_type          = "t2.micro"
#   key_name               = "jenkins-server-key"
# #   monitoring             = true
#   subnet_id              = module.vpc.public_subnets[0]
#   vpc_security_group_ids = [module.sg.security_group_id]
#   #   associate_public_ip_address = true
# #   user_data         = file("jenkins-install.sh")
# #   availability_zone = data.aws_availability_zones.azs.names[0]

#   tags = {
#     Name        = "Jenkins-Server"
#     # Terraform   = "true"
#     # Environment = "dev"
#   }
# }


# resource "aws_instance" "test" {
#   ami           = data.aws_ami.example.image_id
#   instance_type = "t2.micro"
#   key_name      = "jenkins-server-key"
#   subnet_id     = module.vpc.public_subnets[0]
#   vpc_security_group_ids = [module.sg.security_group_id]

#   tags = {
#     Name = "debug-test"
#   }
# }