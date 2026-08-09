module "ec2" {
  source             = "../modules"
  ami_ids            = var.ami_ids
  instance_type      = var.instance_type
  key_name           = var.key_name
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

