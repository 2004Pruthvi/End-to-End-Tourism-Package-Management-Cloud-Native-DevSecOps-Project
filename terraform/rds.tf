resource "aws_db_instance" "wild_tour" {
  identifier             = "database-wild-tour"
  engine                 = "mysql"
  engine_version         = "8.4.9"
  instance_class         = "db.t4g.micro"
  allocated_storage      = 20
  storage_encrypted      = true
  copy_tags_to_snapshot  = true
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.db.id]
  db_subnet_group_name   = "default-vpc-01e3efe41c36635eb"

  skip_final_snapshot = true
}
