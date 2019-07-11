resource "aws_internet_gateway" "intercity-vpc-network-uat-internetgw" {
  vpc_id = aws_vpc.intercity-vpc-network-uat-VPC.id

  tags = {
    Name = "TourCatalog-uat-10.1.0.0/16"
  }
}