resource "aws_db_subnet_group" "rds_db_subnet_group" {
  name       = "rds_db_subnet_group"
  subnet_ids = module.vpc.private_subnets
}

module "postgres_rds_security_group" {
  source = "terraform-aws-modules/security-group/aws"
  name   = "sonarqube_postgres_rds_sg"
  vpc_id = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
    {
      rule        = "postgresql-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

module "sonarqube_rds" {
  source  = "terraform-aws-modules/rds/aws"
  engine         = "postgres"
  family         = "postgres13"
  engine_version = "13"
  instance_class = "db.t3.micro"
  identifier     = "sonarqube-postgres"
  allocated_storage      = 10
  username               = "sonar"
  password               = "SuperSecretPassword123" # Use a secure password
  create_db_subnet_group = false
  db_subnet_group_name = aws_db_subnet_group.rds_db_subnet_group.name
  vpc_security_group_ids = [module.postgres_rds_security_group.security_group_id]
  # Optional RDS settings
  multi_az            = false
  publicly_accessible = false
  skip_final_snapshot = true
}