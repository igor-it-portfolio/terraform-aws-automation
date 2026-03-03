provider "aws" {
  region = "us-east-1"
}

# Criando a VPC (O Terreno)
resource "aws_vpc" "minha_primeira_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "VPC-Estudo-Igor"
  }
}