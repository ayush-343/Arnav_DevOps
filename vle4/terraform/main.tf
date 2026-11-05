terraform {
  required_version = ">= 1.6.0"
  required_providers { aws = { source = "hashicorp/aws", version = "~> 6.0" } }
}
provider "aws" { region = var.region }
data "aws_ssm_parameter" "ami" { name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64" }
resource "aws_vpc" "lab" {
  cidr_block = "10.40.0.0/16"
  enable_dns_hostnames = true
  tags = { Name = "VLE4-Dev-VPC", Project = "vle-4-5" }
}
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.lab.id
  cidr_block = "10.40.1.0/24"
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true
  tags = { Name = "VLE4-Public" }
}
resource "aws_internet_gateway" "lab" { vpc_id = aws_vpc.lab.id }
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.lab.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab.id
  }
}
resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
resource "aws_key_pair" "lab" {
  key_name = "vle45-lab-key"
  public_key = file(var.public_key_path)
}
resource "aws_security_group" "lab" {
  name = "vle45-lab"
  vpc_id = aws_vpc.lab.id
  ingress {
    description = "SSH from lab controller only"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.controller_cidr]
  }
  ingress {
    description = "Lab web application"
    from_port = 30080
    to_port = 30080
    protocol = "tcp"
    cidr_blocks = [var.controller_cidr]
  }
  ingress {
    description = "HTTP demonstration"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.controller_cidr]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "lab" {
  count = 2
  ami = data.aws_ssm_parameter.ami.value
  instance_type = "t3.small"
  subnet_id = aws_subnet.public.id
  key_name = aws_key_pair.lab.key_name
  vpc_security_group_ids = [aws_security_group.lab.id]
  root_block_device {
    volume_size = 16
    volume_type = "gp3"
    encrypted = true
  }
  metadata_options { http_tokens = "required" }
  tags = { Name = "VLE4-Server-${count.index + 1}", Project = "vle-4-5" }
}
