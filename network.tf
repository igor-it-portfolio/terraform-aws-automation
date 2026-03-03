# CRIANDO A SUBNET
resource "aws_subnet" "subnet_publica" {
  vpc_id                  = aws_vpc.minha_primeira_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet-Estudo-Igor"
  }
}

# CRIANDO O GATEWAY (INTERNET)
resource "aws_internet_gateway" "porta_da_rua" {
  vpc_id = aws_vpc.minha_primeira_vpc.id

  tags = {
    Name = "IGW-Estudo-Igor"
  }
}

# TABELA DE ROTAS (CAMINHO PARA A INTERNET)
resource "aws_route_table" "rota_internet" {
  vpc_id = aws_vpc.minha_primeira_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.porta_da_rua.id
  }
}

resource "aws_route_table_association" "associacao" {
  subnet_id      = aws_subnet.subnet_publica.id
  route_table_id = aws_route_table.rota_internet.id
}