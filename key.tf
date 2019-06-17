resource "aws_key_pair" "pipeline-key" {
  key_name   = "pipeline-key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}
