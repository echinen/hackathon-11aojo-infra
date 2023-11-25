# Hackaton Fiap Infra as Code project (AWS)

Estamos criando todos os recursos na AWS via Terraform usando infra as code.

1- Primeiramente instale o Terraform em sua máquina seguindo o documento abaixo:
https://developer.hashicorp.com/terraform/install

PS: se você estiver usando Visual Studio Code você pode instalar a extensão chamada: `HashiCorp Terraform` que o ajudará a criar todos os recursos.

2- Configure as suas credencias da AWS.

`aws_access_key_id=
aws_secret_access_key=
aws_session_token=`

3- Para atualizar ou criar um recurso execute o comando abaixo:

- S3
`terraform apply -target=aws_s3_bucket.hackaton-11aojo-emc`

- RDS
`terraform apply -target=aws_db_instance.hackaton-emc-db`

- ECS
`terraform apply -target=`
