resource "aws_security_group" "security_group" {
  name        = "sonarqube_security_group"
  description = "security group for the sonarqube server"
  vpc_id      = module.vpc.vpc_id

  ingress = [
    for port in [22, 80, 8080, 9000, 443] : {
      description      = "inbound rules"
      from_port        = port # Corrected attribute name
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ebs_volume" "sonarqube_volume" {
  availability_zone = "us-east-1a"
  size              = 10

  tags = {
    Name = "sonarqube_volume"
  }
}
# resource "aws_instance" "sonarqube_server" {
#   ami                         = "ami-063d43db0594b521b"
#   instance_type               = "t2.medium"
#   associate_public_ip_address = true
#   vpc_security_group_ids      = [aws_security_group.security_group.id]
#   iam_instance_profile        = aws_iam_instance_profile.sonarqube_instance_profile.name
#   user_data                   = file("${path.module}/init.sh")
#   subnet_id = module.vpc.public_subnets[0]
#   tags = {
#     Name = "sonarqube"
#   }
# }

resource "aws_iam_instance_profile" "sonarqube_instance_profile" {
  name = "sonarqube_profile"
  role = aws_iam_role.sonarqube_instance_role.name
}

