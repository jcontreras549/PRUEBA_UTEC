terraform {
  backend "s3" {
    bucket = "bucket-terraform-utec"
    key    = "infra/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ecr_repo" {
  source           = "../modules/ecr"
  ecr_name         = var.ecr_names
  tags             = var.tags
  image_mutability = "IMMUTABLE"
}


module "ec2" {
  source             = "../modules/ec2"
  ami                = "ami-0c02fb55956c7d316"
  instance_type      = "t3.micro"
  subnet_id          = var.public_subnet_id
  key_name           = var.key_name
  security_group_ids = []
  tags = {
    Name        = var.ec2_name
    Environment = "demo"
  }
}

module "eks" {
  source = "../modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = var.vpc_id
  private_subnets = var.private_subnet_ids
  key_name        = var.key_name

  tags = {
    Environment = "demo"
    Terraform   = "true"
  }
}


