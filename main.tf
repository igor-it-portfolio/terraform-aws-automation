provider "aws" {
  region = "us-east-1"
}

# Aqui pedimos para criar uma VPC (Rede)
resource "aws_vpc" "minha_primeira_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "VPC-Estudo-Igor"
  }
}