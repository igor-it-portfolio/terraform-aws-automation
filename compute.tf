# Busca a imagem mais recente do Ubuntu 22.04 na AWS automaticamente
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["033614744213"] # ID da Canonical (criadora do Ubuntu)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_security_group" "ssh_access" {
  name        = "ssh_access"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

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

resource "aws_instance" "web" {
  # Aqui está a mágica: ele usa o ID que o 'data' encontrou acima
  ami           = data.aws_ami.ubuntu.id 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main_subnet.id
  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  tags = {
    Name = "Terraform-Instance-Automated"
  }
}