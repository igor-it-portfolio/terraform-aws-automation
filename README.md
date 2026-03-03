# Cloud Provisioning Automation: Infraestrutura como Código (IaC)

## 🚀 Sobre o Projeto
Este é um **projeto base de IaC com Terraform**. Este repositório serve como a minha fundação para automações na nuvem: a partir de agora, toda a minha infraestrutura será provisionada exclusivamente via código, eliminando configurações manuais e garantindo a padronização e escalabilidade dos ambientes.

## 🏗️ Arquitetura do Projeto
O código foi estruturado de forma modular (separação de responsabilidades) para facilitar a manutenção:
- **`main.tf`**: Configuração do provider AWS e versões do Terraform.
- **`network.tf`**: Definição da camada de rede (VPC, Subnet Pública e Internet Gateway).
- **`compute.tf`**: Provisionamento da instância EC2 (Ubuntu) e regras de Firewall (Security Group).

## 🛠️ Tecnologias Utilizadas
- **Terraform** (HCL - HashiCorp Configuration Language)
- **AWS** (Amazon Web Services)
- **Git & GitHub** (Controle de versão)

## 🛡️ Segurança e Boas Práticas
- Utilização de `.gitignore` para impedir o envio de ficheiros sensíveis (`.tfstate`, `.pem`).
- Separação de recursos por ficheiros de responsabilidade.
- Princípio do privilégio mínimo no Security Group (SSH - Porta 22).

## 📖 Como utilizar
1. Configure as suas credenciais AWS localmente (`aws configure`).
2. Execute `terraform init` para descarregar os plugins.
3. Execute `terraform plan` para validar a infraestrutura.
4. Execute `terraform apply` para criar os recursos de forma automatizada.