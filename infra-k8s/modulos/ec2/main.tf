data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Ubuntu
}

resource "aws_instance" "web" {
  count           = 3
  ami             = var.image_id
  instance_type   = count.index < 1 ? "t3.medium" : "t3.small"
  key_name        = "k8s-key"
  subnet_id       = var.subnet_id
  security_groups = [var.security_groups]

  tags = {
    Name = "K8s-Cluster"
  }
}
