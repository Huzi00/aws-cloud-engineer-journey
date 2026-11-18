# 1. ECS Cluster
resource "aws_ecs_cluster" "this" {
  name = "${var.environment}-ecs-cluster"

  tags = {
    Name        = "${var.environment}-ecs-cluster"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# 2. ECS Task Definition (Fargate / awsvpc)
resource "aws_ecs_task_definition" "web" {
  family                   = "${var.environment}-web-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = var.execution_role_arn

  container_definitions = jsonencode([
    {
      name      = "web"
      image     = var.container_image
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]
      command = [
        "/bin/sh",
        "-c",
        "dnf update -y && dnf install -y httpd && echo '<h1>Environment: ${var.environment} | ECS Fargate Container</h1>' > /var/www/html/index.html && httpd -D FOREGROUND"
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/aws/ec2/${var.environment}-web-app"
          "awslogs-region"        = "af-south-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# 3. ECS Service (Running tasks in private subnets behind ALB)
resource "aws_ecs_service" "web" {
  name            = "${var.environment}-web-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.web.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = var.ecs_security_group_ids
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "web"
    container_port   = var.container_port
  }

  lifecycle {
    ignore_changes = [desired_count]
  }

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
