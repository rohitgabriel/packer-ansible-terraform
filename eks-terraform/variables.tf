variable "region" {
  default = "ap-southeast-2"
}


variable "instance-type" {
  default = "m5.large"
}

# variable "map_accounts" {
#   description = "Additional AWS account numbers to add to the aws-auth configmap."
#   type        = list(string)

#   default = [
#     "777777777777",
#     "888888888888",
#   ]
# }

# variable "map_roles" {
#   description = "Additional IAM roles to add to the aws-auth configmap."
#   type        = list(map(string))

#   default = [
#     {
#       role_arn = "arn:aws:iam::66666666666:role/role1"
#       username = "role1"
#       group    = "system:masters"
#     },
#   ]
# }

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type        = list(map(string))

  default = [
    {
      user_arn = "arn:aws:iam::832247244038:user/devops-admin"
      username = "devops-admin"
      group    = "system:masters"
    }
#     },
#     {
#       user_arn = "arn:aws:iam::66666666666:user/user2"
#       username = "user2"
#       group    = "system:masters"
#     },
  ]
}