# route tables
resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }

  tags = {
    Name = "main-public-1"
  }
}

resource "aws_route_table" "main-RouteTableAPublic" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-internetgw.id
  }

  tags = {
    Name = "main-B-Public"
  }
}

resource "aws_route_table" "main-RouteTableBPublic" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-internetgw.id
  }

  tags = {
    Name = "main-B-Public"
  }
}

resource "aws_route_table" "main-RouteTableCPublic" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-internetgw.id
  }

  tags = {
    Name = "main-C-Public"
  }
}

resource "aws_route_table" "main-RouteTableAPrivate" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-A-Private"
  }
}

resource "aws_route_table" "main-RouteTableBPrivate" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-B-Private"
  }
}

resource "aws_route_table" "main-RouteTableCPrivate" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-C-Private"
  }
}



# route associations public
resource "aws_route_table_association" "main-public-1-a" {
  subnet_id      = aws_subnet.main-public-1.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table_association" "main-public-2-a" {
  subnet_id      = aws_subnet.main-public-2.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table_association" "main-public-3-a" {
  subnet_id      = aws_subnet.main-public-3.id
  route_table_id = aws_route_table.main-public.id
}
