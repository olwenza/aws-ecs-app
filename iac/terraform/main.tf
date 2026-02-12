provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name = "vpc-ivan-1"
  vpc_cidr = "10.0.0.0/16"
} 

module "subnet" {
  source = "./modules/subnet"

  vpc_id                = "vpc-0464cab12e83b760c" # Created in the previous git commit
  public_subnet_1_cidr  = "10.0.1.0/24"
  public_subnet_2_cidr  = "10.0.2.0/24"
  az_1                  = "us-east-1a"
  az_2                  = "us-east-1b"
}
