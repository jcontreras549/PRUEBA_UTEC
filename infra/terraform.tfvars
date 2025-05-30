region         = "us-east-1"
cluster_name   = "eks-lab-cluster-utec-v2"
key_name       = "node-alumnos-utec"
vpc_id           = "vpc-04073a3d1773d2a8a"  # VPC ID
public_subnet_id  = "subnet-07e4b11693ca60caa"    # Public subnet ID
private_subnet_ids = ["subnet-0d700d543c3abd0b2","subnet-05d4340e67d9faddb"]  # Private subnet IDs 
alumno_prefix    = "lab_utec"   # nombre de alumno
ec2_name         = "ec2-lab-utec"   # Nombre de la instancia EC2
ecr_names        = ["app_01", "app_02"]  # Lista de nombres para los  repositorios ECR
tags = {
  Name        = "UTEC"
  Environment = "LAB"
}

name_sg       = "ec2-default-sg-jcontreras_v2"