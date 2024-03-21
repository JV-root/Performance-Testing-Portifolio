terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
      }
    }
}


# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
}



# Criação da VPC, subnet, gateway de internet e tabela de rotas
resource "aws_vpc" "Easy_Travel_VPC" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "Easy_Travel_Subnet" {
  vpc_id     = aws_vpc.Easy_Travel_VPC.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_internet_gateway" "Easy_Travel_internet_gateway" {
  vpc_id = aws_vpc.Easy_Travel_VPC.id
}

resource "aws_route_table" "Easy_Travel_route_table" {
  vpc_id = aws_vpc.Easy_Travel_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Easy_Travel_internet_gateway.id
  }
}

resource "aws_route_table_association" "Easy_Travel_route_table_association" {
  subnet_id      = aws_subnet.Easy_Travel_Subnet.id
  route_table_id = aws_route_table.Easy_Travel_route_table.id
}

# Criação do security group
resource "aws_security_group" "Easy_Travel_security_group" {
  name        = "Easy_Travel_security_group"
  description = "Allow all traffic"
  vpc_id      = aws_vpc.Easy_Travel_VPC.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



# Criação da instância EC2
resource "aws_instance" "Easy_Travel_Instance" {
  ami           = "ami-020b67a2ac4c2c3b6"
  instance_type = "t2.medium"
  key_name = "Easy_Travel_Terraform"

  subnet_id     = aws_subnet.Easy_Travel_Subnet.id
  vpc_security_group_ids = [aws_security_group.Easy_Travel_security_group.id]

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 30
  }


  tags = {
    Name = "Easy_Travel_instance"
  }

}



# Criação do Elastic IP
resource "aws_eip" "Easy_Travel_eip" {
  vpc = true
}

# Associação do Elastic IP à instância EC2
resource "aws_eip_association" "Easy_Travel_eip_association" {
  instance_id   = aws_instance.Easy_Travel_Instance.id
  allocation_id = aws_eip.Easy_Travel_eip.id
}

resource "null_resource" "Easy_Travel_trigger" {
  depends_on = [aws_instance.Easy_Travel_Instance]
}