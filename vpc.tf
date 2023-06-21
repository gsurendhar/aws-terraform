resource "aws_vpc" "myvpc" {

  cidr_block           = var.vpccidr
  enable_dns_hostnames = "true"
  tags = {
    Name = "VPC1"
  }
}


resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "MyIGW"
  }
}

resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
  tags = {
    Name = "Public_route"
  }
}

resource "aws_route_table" "private-route" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "Private_route"
  }
}

resource "aws_route_table_association" "public-rta" {
  subnet_id      = aws_subnet.PublicSunebt1.id
  route_table_id = aws_route_table.public-route.id
}

resource "aws_route_table_association" "private-rta" {
  subnet_id      = aws_subnet.PrivateSunebt1.id
  route_table_id = aws_route_table.private-route.id
}


resource "aws_security_group" "mysg" {
  name        = "mysg"
  description = "Allow all traffic"
  vpc_id      = aws_vpc.myvpc.id

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


