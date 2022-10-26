terraform {
  backend "s3" {
    profile = "linuxtips-terraform"
    bucket  = "descomplicando-kubernetes-fabio-bartoli"
    key     = "k8s-aulas.tfstate"
    region  = "us-east-1"
  }
}

module "vpc" {
  source          = "../modulos/vpc"
  vpc_cidr        = var.vpc_cidr
  vpc_name        = var.vpc_name
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets
  nat_ips         = module.vpc.nat_ips
  nat_gateway     = module.vpc.nat_gateway
}

module "ec2" {
  source          = "../modulos/ec2"
  security_groups = module.vpc.sg_ssh_id
  subnet_id       = module.vpc.public_subnets[0]
}
