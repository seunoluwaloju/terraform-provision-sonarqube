module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = var.vpc_name
  cidr = var.vpc_cidr
  azs  = var.vpc_azs

  # private subnet
  private_subnets       = var.private_subnets
  private_subnet_suffix = "private-subnet"

  # public ingress subnet
  public_subnets       = var.public_subnets
  public_subnet_suffix = "public-subnet"

  create_database_subnet_group    = true
  create_elasticache_subnet_group = false
  create_redshift_subnet_group    = false

  map_public_ip_on_launch = false
  enable_dns_hostnames    = true
  enable_dns_support      = true
  enable_nat_gateway      = true
  single_nat_gateway      = true

}