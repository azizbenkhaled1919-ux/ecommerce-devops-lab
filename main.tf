# 1. Configuration du fournisseur AWS
provider "aws" {
  region = "us-east-1"
}

# 2. Création du VPC
resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = { Name = "VPC-Mini-Projet" }
}

# 3. Sous-réseaux (Subnets)
resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = { Name = "Private-Subnet-A" }
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = { Name = "Private-Subnet-B" }
}

# 4. Instance EC2 (Exemple pour l'instance 1)
resource "aws_instance" "ec2_1" {
  ami           = "ami-0c101f26f147fa7fd" # AMI Amazon Linux 2023 (us-east-1)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_a.id
  tags = { Name = "EC2-Instance-1" }
}