variable "vpc_id" {
  description = "The ID of the VPC in which the endpoint will be used"
  type        = string
}

variable "subnet_ids" {
  description = "The ID of the VPC in which the endpoint will be used"
  type        = list(string)
}

variable "env" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "project_name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "ec_node_type" {
  description = "Node type for Elasticache"
  type        = string
}

variable "cache_nodes_num" {
  description = "Node type for Elasticache"
  type        = number
}

variable "sg_ingress" {
  description = "The ID of the VPC in which the endpoint will be used"
  type        = list(string)
  default     = null
}

variable "cidr_ingress" {
  description = "The ID of the VPC in which the endpoint will be used"
  type        = list(string)
  default     = null
}

variable "engine_version" {
  description = "Node type for Elasticache"
  type        = string
  default     = "7.x"
}

variable "parameter_group_name" {
  description = "Node type for Elasticache"
  type        = string
  default     = "default.redis7"
}

variable "snapshot_retention_limit" {
  description = "Node type for Elasticache"
  type        = number
  default     = 7
}

variable "maintenance_window" {
  description = "Node type for Elasticache"
  type        = string
  default     = "thu:15:30-thu:16:30"
}
