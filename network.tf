
# CRIANDO A VPC (O TERRENO)
# O cidr_block "10.0.0.0/16" define que teremos mais de 65 mil IPs disponíveis.
resource "aws_vpc" "meu_terreno_isolado" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "VPC-Treinamento-Dia4"
  }
}

# CRIANDO A SUBNET (O QUARTO COM JANELA)
# vpc_id associa este quarto ao terreno que criamos acima.
resource "aws_subnet" "subnet_publica" {
  vpc_id            = aws_vpc.meu_terreno_isolado.id
  cidr_block        = "10.0.1.0/24" # Um pedaço menor do terreno
  map_public_ip_on_launch = true    # Isso dá um IP público para quem morar aqui

  tags = {
    Name = "Quarto-Com-Janela"
  }
}

# CRIANDO O GATEWAY (A PORTA DA RUA)
resource "aws_internet_gateway" "porta_da_rua" {
  vpc_id = aws_vpc.meu_terreno_isolado.id

  tags = {
    Name = "Porta-Principal"
  }
}