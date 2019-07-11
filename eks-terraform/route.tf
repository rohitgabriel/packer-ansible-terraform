# route tables
resource "aws_route_table" "intercity-vpc-network-uat-RouteTableAPublic" {
  vpc_id = aws_vpc.intercity-vpc-network-uat-VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.intercity-vpc-network-uat-internetgw.id
  }

  tags = {
    Name = "TourCatalog-uat-A-Public"
  }
}

resource "aws_route_table" "intercity-vpc-network-uat-RouteTableBPublic" {
  vpc_id = aws_vpc.intercity-vpc-network-uat-VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.intercity-vpc-network-uat-internetgw.id
  }

  tags = {
    Name = "TourCatalog-uat-B-Public"
  }
}

resource "aws_route_table" "intercity-vpc-network-uat-RouteTableCPublic" {
  vpc_id = aws_vpc.intercity-vpc-network-uat-VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.intercity-vpc-network-uat-internetgw.id
  }

  tags = {
    Name = "TourCatalog-uat-C-Public"
  }
}

resource "aws_route_table" "intercity-vpc-network-uat-RouteTableAPrivate" {
  vpc_id = aws_vpc.intercity-vpc-network-uat-VPC.id

  tags = {
    Name = "TourCatalog-uat-A-Private"
  }
}

resource "aws_route_table" "intercity-vpc-network-uat-RouteTableBPrivate" {
  vpc_id = aws_vpc.intercity-vpc-network-uat-VPC.id

  tags = {
    Name = "TourCatalog-uat-B-Private"
  }
}

resource "aws_route_table" "intercity-vpc-network-uat-RouteTableCPrivate" {
  vpc_id = aws_vpc.intercity-vpc-network-uat-VPC.id

  tags = {
    Name = "TourCatalog-uat-C-Private"
  }
}
# route associations 
resource "aws_route_table_association" "intercity-vpc-network-uat-RouteTableCPublic" {
  subnet_id      = aws_subnet.intercity-vpc-network-uat-SubnetCPublic.id
  route_table_id = aws_route_table.intercity-vpc-network-uat-RouteTableCPublic.id
}

