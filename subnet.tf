resource "aws_subnet" "PublicSunebt1" {
  vpc_id                                      = aws_vpc.myvpc.id
  cidr_block                                  = var.subnet1cidr
  enable_resource_name_dns_a_record_on_launch = "true"
  map_public_ip_on_launch                     = "true"
  #count                                       = "3"

  tags = {
    Name = "PublicSunebt1"
  }
}

resource "aws_subnet" "PrivateSunebt1" {
  vpc_id                                      = aws_vpc.myvpc.id
  cidr_block                                  = var.subnet2cidr
  enable_resource_name_dns_a_record_on_launch = "true"
  map_public_ip_on_launch                     = "true"

  tags = {
    Name = "PrivateSunebt1"
  }
}




