module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  single_nat_gateway  = true
  enable_vpn_gateway = false
  enable_dns_hostnames = true
  enable_dns_support   = true

   tags = {
    "kubernetes.io/cluster/${var.democluster}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.democluster}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.democluster}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}
