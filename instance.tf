resource "aws_instance" "pipeline" {
  ami           = var.AMI_ID
  instance_type = "t2.micro"

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
  #############################################################################

  provisioner "remote-exec" {
    inline = ["echo 'Hello World'"]

    connection {
      type        = "ssh"
      user        = "${var.ssh_user}"
      private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i '${aws_instance.pipeline.private_ip},' --private-key ${var.PATH_TO_PRIVATE_KEY} ansible-terraform/gitlab-install-playbook.yml"
  }
}

