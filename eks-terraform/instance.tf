resource "aws_instance" "pipeline" {
  ami           = var.AMI_ID
  instance_type = "t2.medium"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.pipeline-instance.id]

  # the public SSH key
  key_name = aws_key_pair.pipeline-key.key_name

  tags = {
    Name = "pipeline-centos"
  }

  #############################################################################
  # This is the 'local exec' method.  
  # Ansible runs from the same host you run Terraform from
  # But this needs hostname to be added in the inventory file
  #############################################################################

  # provisioner "remote-exec" {
  #   inline = ["echo 'Hello World'"]

  #   connection {
  #     host = self.public_ip
  #     type        = "ssh"
  #     user        = "${var.ssh_user}"
  #     private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  #   }
  # }
  # provisioner "local-exec" {
  #   command = "ansible-playbook -u '${var.ssh_user}' -i ansible-terraform/hosts.yml --private-key ${var.PATH_TO_PRIVATE_KEY} ansible-terraform/gitlab-install-playbook.yml --extra-vars 'variable_host=${aws_instance.pipeline.public_dns}'"
  # }
}

