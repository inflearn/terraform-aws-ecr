resource "aws_ecr_repository" "this" {
  image_tag_mutability = var.image_tag_mutability
  name                 = var.name
  tags                 = var.tags

  encryption_configuration {
    encryption_type = var.encryption_type
  }

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
}

resource "aws_ecr_lifecycle_policy" "this" {
  count      = var.expire_count != null ? 1 : 0
  repository = aws_ecr_repository.this.name

  policy = jsonencode({
    "rules" : [
      {
        "action" : {
          "type" : "expire"
        },
        "description" : "Delete old ECR images except last ${var.expire_count}.",
        "rulePriority" : 1,
        "selection" : {
          "countNumber" : var.expire_count,
          "countType" : "imageCountMoreThan",
          "tagStatus" : "any"
        }
      }
    ]
  })
}
