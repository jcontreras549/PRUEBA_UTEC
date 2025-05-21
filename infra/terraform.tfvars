region         = "us-east-1"
cluster_name   = "eks-***-cluster-utec"
key_name       = "node-alumnos-utec"
vpc_id           = "vpc-***"  # VPC ID
public_subnet_id  = "subnet-***"    # Public subnet ID
private_subnet_ids = ["subnet-***"]  # Private subnet IDs
alumno_prefix    = "***_utec"   # nombre de alumno
ec2_name         = "ec2-***-utec"   # Nombre de la instancia EC2
ecr_names        = ["***-app", "***-app2"]  # Lista de nombres para los repositorios ECR
tags = {
  Name        = "UTEC"
  Environment = "LAB"
}