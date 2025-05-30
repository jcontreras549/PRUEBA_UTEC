terraform {
  backend "s3" {
    bucket = "bucket-terraform-utec"
    key    = "infra/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ecr_repo" {
  source          = "git::https://github.com/jcontreras549/MODULE_ECR_AWS.git?ref=main"
  ecr_name         = var.ecr_names
  tags             = var.tags
  image_mutability = "IMMUTABLE"
}

resource "aws_security_group" "default" {
  name        = var.name_sg
  description = "Default security group for EC2"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "ec2" {
  source          = "git::https://github.com/jcontreras549/MODULE_EC2_AWS.git?ref=main"
  ami                = "ami-0c02fb55956c7d316"
  instance_type      = "t3.micro"
  subnet_id          = var.public_subnet_id
  key_name           = var.key_name
  security_group_ids = [aws_security_group.default.id]
  tags = {
    Name        = var.ec2_name
    Environment = "demo"
  }
}

module "eks" {
  source          = "git::https://github.com/jcontreras549/MODULE_EKS_AWS.git?ref=main"

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