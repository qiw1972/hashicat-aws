module "vpc" {
  #source = "terraform-aws-modules/vpc/aws"
  source  = "app.terraform.io/BigCat/vpc/aws"
  version = "2.21.0"

  database_subnet_assign_ipv6_address_on_creation = "false"
  elasticache_subnet_assign_ipv6_address_on_creation = "false"
  enable_classiclink = "false"
  enable_classiclink_dns_support = "false"
  intra_subnet_assign_ipv6_address_on_creation = "false"
  private_subnet_assign_ipv6_address_on_creation = "false"
  public_subnet_assign_ipv6_address_on_creation = "false"
  redshift_subnet_assign_ipv6_address_on_creation = "false"
  
  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}