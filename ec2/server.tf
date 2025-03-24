
variable "operating_system" {
  default = "ami-08b5b3a93ed654d19"
}
variable "instance_name" {
  default = "t2.micro"
}
resource "aws_instance" "sams_server" {
  count = 3
  ami = var.operating_system
  instance_type = var.instance_name

  /*
  network_interface {
    network_interface_id = aws_network_interface.primary_interface.id
    device_index = 0
  }
  */
  tags = {
    Name = "sams simple server ${count.index}"
  }
}

resource "aws_network_interface" "primary_interface" {
  subnet_id = aws_subnet.subnet_1.id
  private_ips = ["10.0.1.20"]
  tags = {
    Name = "Primary Interface"
  }
}

terraform {
  backend "s3" {
    bucket = "sam-304-bucket"
    key = "DEV/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
