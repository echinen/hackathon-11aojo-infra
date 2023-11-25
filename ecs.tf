provider "aws" {
  region = "us-east-1"  # Substitua pela sua região desejada
}

resource "aws_ecs_cluster" "my_cluster" {
  name = "my-ecs-cluster"
}

resource "aws_ecs_task_definition" "my_task" {
  family                   = "my-task-family"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"  # Substitua com os recursos da CPU necessários
  memory                   = "512"  # Substitua com a memória necessária

  execution_role_arn = aws_iam_role.execution_role.arn

  container_definitions = jsonencode([{
    name  = "my-container"
    image = "nginx:latest"  # Substitua pelo seu contêiner Docker desejado
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
}

resource "aws_ecs_service" "my_service" {
  name            = "my-ecs-service"
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets = ["subnet-xxxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyyy"]  # Substitua pelos IDs das suas subnets
    security_groups = ["sg-xxxxxxxxxxxxxxxx"]  # Substitua pelos IDs dos seus security groups
  }
}

resource "aws_iam_role" "execution_role" {
  name = "ecs_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}
