###########################################
# AWS Provider Variables
###########################################
variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "ap-south-1"
}

###########################################
# EC2 Configuration
###########################################
variable "ami_id" {
  description = "Ubuntu 20.04 AMI for ap-south-1"
  default     = "ami-02d26659fd82cf299"
}


variable "instance_type" {
  description = "EC2 instance type (Free tier)"
  default     = "t3.micro" # or t2.micro (safe choice)
}

###########################################
# Key Pair Configuration
###########################################
variable "key_name" {
  description = "Key name for EC2 access"
  default     = "mahesh"
}

variable "public_key_path" {
  description = "Path to your public SSH key (.pub)"
  default     = "C:/Users/Admin/Portfolio-on-AWS-EC2/mahesh.pub"
}

###########################################
# Security Group
###########################################
variable "security_group_name" {
  description = "Security group name"
  default     = "web-sg"
}

variable "my_ip" {
  description = "Your IP address with /32 for SSH restriction"
  default     = "202.179.94.20/32" # <-- your current IP is fine
}
