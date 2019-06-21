output "pipeline-publicip" {
  value = aws_instance.pipeline.public_ip
}

output "pipeline-publicdns" {
  value = aws_instance.pipeline.public_dns
}