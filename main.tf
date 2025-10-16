###########################################
# Provider Configuration
###########################################
provider "aws" {
  region = var.aws_region
}

###########################################
# Key Pair (for SSH Access)
###########################################
# resource "aws_key_pair" "mykey" {
#   key_name   = var.key_name
#   public_key = file(var.public_key_path)
# }

###########################################
# Security Group (Allow SSH + HTTP)
###########################################
resource "aws_security_group" "web_sg" {
  name        = var.security_group_name
  description = "Allow SSH and HTTP access"

  # SSH - Restricted to your IP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  # HTTP - Open to all
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound - Allow all
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

###########################################
# EC2 Instance (Ubuntu + Nginx)
###########################################
resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name      # <-- existing key use ho rahi hai
  user_data     = file("userdata.sh")

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "portfolio-ec2"
  }
}


###########################################
# Elastic IP (Static Public IP)
###########################################
resource "aws_eip" "ip" {
  instance = aws_instance.web.id
}
