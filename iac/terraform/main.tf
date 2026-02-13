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

  vpc_id                = var.vpc_id
  public_subnet_1_cidr  = "10.0.1.0/24"
  public_subnet_2_cidr  = "10.0.2.0/24"
  az_1                  = "us-east-1a"
  az_2                  = "us-east-1b"
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id        = var.vpc_id
  ami_id        = "ami-0c02fb55956c7d316"   # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"
  key_name      = var.key_name

  instances = {
    ec2-1 = {
      subnet_id = module.subnet.public_subnet_1_id
    }
    ec2-2 = {
      subnet_id = module.subnet.public_subnet_2_id
    }
  }
}
