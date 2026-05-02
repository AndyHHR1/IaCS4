variable "aws_region" {
    description = "Región destino de AWS"
    type        = string
    default     = "us-east-1"
}

variable "environment" {
    description = "Entorno (dev, qa, prod)"
    type        = string
}

variable "project_name" {
    description = "Prefijo para nombrar recursos"
    type        = string
    default     = "image-processor"
}

variable "vpc_cidr" {
    description = "CIDR de la VPC"
    type        = string
    default     = "10.0.0.0/16"
}