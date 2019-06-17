resource "aws_key_pair" "ssh-test-key2" {
  key_name   = "ssh-test-key2"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

