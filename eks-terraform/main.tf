terraform {
  backend "remote" {
    organization = "eit-demo"

    workspaces {
      name = "gitlab-server-workspace"
    }
  }
}

data "aws_availability_zones" "available" {
}

locals {
  cluster_name = "uat-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 5
  special = false
}






# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "2.6.0"


module "eks" {
  source       = "terraform-aws-modules/eks/aws"
  cluster_name = local.cluster_name
  
  subnets      = [
      # aws_subnet.main-SubnetAPrivate.id,
      # aws_subnet.main-SubnetBPrivate.id,
      # aws_subnet.main-SubnetCPrivate.id,
      aws_subnet.main-SubnetAPublic.id,
      aws_subnet.main-SubnetBPublic.id,
      aws_subnet.main-SubnetCPublic.id
      
    ]

  tags = {
    Environment = "uat"
    GithubRepo  = "terraform-aws-eks"
    GithubOrg   = "terraform-aws-modules"
  }

  vpc_id = aws_vpc.main.id


  worker_groups = [
    {
      name                          = "worker-group-1"
      ami_id     = "ami-01bfe815f644becc0"
      instance_type                 = var.instance-type
      additional_userdata           = "echo foo bar"
      asg_desired_capacity          = 2
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    },
    # {
    #   name                          = "worker-group-2"
    #   instance_type                 = "t2.medium"
    #   additional_userdata           = "echo foo bar"
    #   additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
    #   asg_desired_capacity          = 1
    # },
  ]
  #map_roles                            = var.map_roles
  #map_users                            = var.map_users
  #map_accounts                         = var.map_accounts
}