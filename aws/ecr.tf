resource "aws_ecr_repository" "container_repository" {
  name                 = "${var.app_name}-${var.app_environment}-repository"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "${var.app_name}-repository"
    Environment = var.app_environment
  }

  lifecycle {
    prevent_destroy = false
  }
}
