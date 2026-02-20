module "ec2_Module" {

    source = "../12.CICD"

    env= var.env
    instance = var.instance
    size_root_block_device = var.size_root_block_device
    count_instance = var.count_instance
  
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = var.azs
  private_subnets = var.public
  public_subnets  = var.private

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}