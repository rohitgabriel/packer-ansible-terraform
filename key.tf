resource "aws_key_pair" "ssh-test-key" {
  key_name   = "ssh-test-key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

