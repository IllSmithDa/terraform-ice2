resource "aws_vpc" "vpc_01" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.vpc_01.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Subnet One"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    name = "Subnet Two"
  }
}

