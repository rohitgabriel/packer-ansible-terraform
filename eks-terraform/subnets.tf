
resource "aws_subnet" "intercity-vpc-network-uat-SubnetAPublic" {
  vpc_id                  = aws_vpc.intercity-vpc-network-uat-VPC.id
  cidr_block              = "10.1.0.0/20"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-southeast-2a"

tags                            = {
          "Name"                                   = "TourCatalog-uat-A-Public",
          "Reach"                                  = "public",
          "kubernetes.io/cluster/${local.cluster_name}" = "shared"
        #  "kubernetes.io/cluster/uat-ekscluster-1" = "shared" 
        }
}

resource "aws_subnet" "intercity-vpc-network-uat-SubnetBPublic" {
  vpc_id                  = aws_vpc.intercity-vpc-network-uat-VPC.id
  cidr_block              = "10.1.32.0/20"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-southeast-2b"

tags                            = {
          "Name"                                   = "TourCatalog-uat-B-Public",
          "Reach"                                  = "public",
          "kubernetes.io/cluster/${local.cluster_name}" = "shared"
          #"kubernetes.io/cluster/uat-ekscluster-1" = "shared" 
        }
}

resource "aws_subnet" "intercity-vpc-network-uat-SubnetCPublic" {
  vpc_id                  = aws_vpc.intercity-vpc-network-uat-VPC.id
  cidr_block              = "10.1.64.0/20"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-southeast-2c"

tags                            = {
          "Name"                                   = "TourCatalog-uat-C-Public",
          "Reach"                                  = "public",
          "kubernetes.io/cluster/${local.cluster_name}" = "shared"
          #"kubernetes.io/cluster/uat-ekscluster-1" = "shared" 
        }
}

resource "aws_subnet" "intercity-vpc-network-uat-SubnetAPrivate" {
  vpc_id                  = aws_vpc.intercity-vpc-network-uat-VPC.id
  cidr_block              = "10.1.16.0/20"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-southeast-2a"

tags                            = {
          "Name"                                   = "TourCatalog-uat-A-Private",
          "Reach"                                  = "private",
          "kubernetes.io/cluster/${local.cluster_name}" = "shared",
          "kubernetes.io/role/internal-elb"             = "true"
          #"kubernetes.io/role/internal-elb"        = "1"
        }
}

resource "aws_subnet" "intercity-vpc-network-uat-SubnetBPrivate" {
  vpc_id                  = aws_vpc.intercity-vpc-network-uat-VPC.id
  cidr_block              = "10.1.48.0/20"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-southeast-2b"

tags                            = {
          "Name"                                   = "TourCatalog-uat-B-Private",
          "Reach"                                  = "private",
          "kubernetes.io/cluster/${local.cluster_name}" = "shared",
          "kubernetes.io/role/internal-elb"             = "true"
          #"kubernetes.io/role/internal-elb"        = "1"
        }
}

resource "aws_subnet" "intercity-vpc-network-uat-SubnetCPrivate" {
  vpc_id                  = aws_vpc.intercity-vpc-network-uat-VPC.id
  cidr_block              = "10.1.80.0/20"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-southeast-2b"

tags                            = {
          "Name"                                   = "TourCatalog-uat-C-Private",
          "Reach"                                  = "private",
          "kubernetes.io/cluster/${local.cluster_name}" = "shared",
          "kubernetes.io/role/internal-elb"             = "true"
          #"kubernetes.io/role/internal-elb"        = "1"
        }
}