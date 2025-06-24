resource "aws_security_group" "jump_sg" {
  name        = "jump-server-sg"
  description = "Security group for the jump server"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jump-server-sg"
  }
}

resource "aws_instance" "jump_server" {
  ami           = "ami-0c2d94d94a7ff4f77" 
  instance_type = "t2.medium"
  subnet_id     = aws_subnet.public[0].id
  key_name      = "jenkins-server-key"
  security_groups = [aws_security_group.jump_sg.id]

  user_data =  file("userfile.sh")

  tags = {
    Name = "jump-server-via-terraform"
  }
}


# resource "aws_security_group_rule" "eks_allow_jump_443" {
#   type                     = "ingress"
#   from_port               = 443
#   to_port                 = 443
#   protocol                = "tcp"
#   security_group_id       = "eks-control-plane-sg-id" 
#   source_security_group_id = aws_security_group.jump_sg.id
# }

# resource "aws_security_group_rule" "eks_allow_jump_33080" {
#   type                     = "ingress"
#   from_port               = 33080
#   to_port                 = 33080
#   protocol                = "tcp"
#   security_group_id       = "eks-control-plane-sg-id"
#   source_security_group_id = aws_security_group.jump_sg.id
# }
