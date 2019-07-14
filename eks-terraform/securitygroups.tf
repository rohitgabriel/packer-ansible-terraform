##Original##
resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "worker_group_mgmt_one"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.1.0.0/16",
    ]
  }
}
# ####
# resource "aws_security_group" "uat-cluster_to_nodes" {
#   name        = "uat-cluster_to_nodes"
#   description = "Cluster communication with worker nodes"
#   vpc_id      = "${aws_vpc.main.id}"

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "uat-cluster_to_nodes"
#   }
# }

# # OPTIONAL: Allow inbound traffic from your local workstation external IP
# #           to the Kubernetes. You will need to replace A.B.C.D below with
# #           your real IP. Services like icanhazip.com can help you find this.
# resource "aws_security_group_rule" "uat-cluster-ingress-workstation-https" {
#   cidr_blocks       = ["111.69.244.198/32"]
#   description       = "Allow workstation to communicate with the cluster API Server"
#   from_port         = 443
#   protocol          = "tcp"
#   security_group_id = "${aws_security_group.uat-cluster_to_nodes.id}"
#   to_port           = 443
#   type              = "ingress"
# }

# resource "aws_security_group" "uat-node" {
#   name        = "uat-node"
#   description = "Security group for all nodes in the cluster"
#   vpc_id      = "${aws_vpc.main.id}"

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = "${
#     map(
#      "Name", "uat-node",
#      "kubernetes.io/cluster/${local.cluster_name}", "owned",
#     )
#   }"
# }

# resource "aws_security_group_rule" "uat-node-ingress-self" {
#   description              = "Allow node to communicate with each other"
#   from_port                = 0
#   protocol                 = "-1"
#   security_group_id        = "${aws_security_group.uat-node.id}"
#   source_security_group_id = "${aws_security_group.uat-node.id}"
#   to_port                  = 65535
#   type                     = "ingress"
# }

# resource "aws_security_group_rule" "uat-node-ingress-cluster" {
#   description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
#   from_port                = 1025
#   protocol                 = "tcp"
#   security_group_id        = "${aws_security_group.uat-node.id}"
#   source_security_group_id = "${aws_security_group.uat-cluster_to_nodes.id}"
#   to_port                  = 65535
#   type                     = "ingress"
# }

# resource "aws_security_group_rule" "uat-cluster-ingress-node-https" {
#   description              = "Allow pods to communicate with the cluster API Server"
#   from_port                = 443
#   protocol                 = "tcp"
#   security_group_id        = "${aws_security_group.uat-cluster_to_nodes.id}"
#   source_security_group_id = "${aws_security_group.uat-node.id}"
#   to_port                  = 443
#   type                     = "ingress"
# }