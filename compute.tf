# SECURITY GROUP (O FIREWALL)
resource "aws_security_group" "meu_firewall" {
  name        = "acesso_ssh_igor"
  description = "Permitir acesso SSH"
  vpc_id      = aws_vpc.minha_primeira_vpc.id

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

# A MÁQUINA (EC2)
resource "aws_instance" "meu_primeiro_servidor" {
  ami           = "ami-0c7217cdde317cfec" # Ubuntu 22.04 LTS
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet_publica.id

  vpc_security_group_ids = [aws_security_group.meu_firewall.id]

  tags = {
    Name = "Servidor-Do-Igor-Final"
  }
}