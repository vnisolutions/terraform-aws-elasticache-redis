resource "aws_elasticache_cluster" "elasticache-cluster" {
  cluster_id               = "${var.env}-${var.project_name}-redis"
  subnet_group_name        = aws_elasticache_subnet_group.elasticache-subnets.name
  engine                   = "redis"
  node_type                = var.ec_node_type
  num_cache_nodes          = var.cache_nodes_num
  snapshot_retention_limit = var.snapshot_retention_limit
  parameter_group_name     = var.parameter_group_name
  engine_version           = var.engine_version
  port                     = 6379
  security_group_ids       = aws_security_group.sg-elasticache[*].id
  maintenance_window       = var.maintenance_window

  tags = {
    Name        = "${var.env}-${var.project_name}-redis"
    Environment = "${var.env}"
    Management  = "terraform"
  }
}

resource "aws_elasticache_subnet_group" "elasticache-subnets" {
  name       = "${var.env}-${var.project_name}-elasticache-subnet"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "sg-elasticache" {
  name        = "${var.env}-${var.project_name}-elasticache-sg"
  description = "Allow Fargate to access elasticache"
  vpc_id      = var.vpc_id

  ingress = [
    {
      description      = "Allow server access"
      from_port        = 0
      to_port          = 0
      protocol         = -1
      cidr_blocks      = var.cidr_ingress
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = var.sg_ingress
      self             = null
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null

    }
  ]

  tags = {
    Name        = "${var.env}-${var.project_name}-elasticache-sg"
    Environment = "${var.env}"
    Management  = "terraform"
  }
}
