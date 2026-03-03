# CRIANDO A MÁQUINA (EC2) COM T3.MICRO
resource "aws_instance" "meu_primeiro_servidor" {
  ami           = "ami-0c7217cdde317cfec" 
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet_publica.id

  # 1. AQUI VOCÊ DIZ O NOME DA CHAVE (Sem o .pem no final)
  key_name      = "chave-igor-terraform"

  # 2. AQUI VOCÊ CONECTA O FIREWALL À MÁQUINA
  vpc_security_group_ids = [aws_security_group.meu_firewall.id]

  tags = {
    Name = "Servidor-Do-Igor-T3"
  }
}

# SEU SECURITY GROUP (O CÓDIGO CONTINUA IGUAL ABAIXO)
resource "aws_security_group" "meu_firewall" {
  name        = "acesso_ssh"
  description = "Permitir acesso SSH"
  vpc_id      = aws_vpc.meu_terreno_isolado.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}