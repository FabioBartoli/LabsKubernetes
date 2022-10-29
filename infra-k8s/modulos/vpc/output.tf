output "private_subnets" {
  value = aws_subnet.private.*.id
}

output "public_subnets" {
  value = aws_subnet.public.*.id
}

output "vpc_id" {
  value = aws_vpc.k8s.id
}

output "sg_ssh_id" {
  value = aws_security_group.allow_ssh.id
}
