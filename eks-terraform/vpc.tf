
resource "aws_vpc" "intercity-vpc-network-uat-VPC" {
  cidr_block           = "10.1.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    "Name" = "10.1.0.0/16 - TourCatalog-uat"
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }
}

