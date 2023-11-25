resource "aws_db_instance" "hackaton-emc-db" {
  identifier           = "hackaton-emc-db"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "fiap1234"
  allocated_storage    = 20
  storage_type         = "gp2"
  publicly_accessible  = false
  # Adicione outras configurações conforme necessário
}