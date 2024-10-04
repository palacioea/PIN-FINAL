#!/bin/bash

#Configurar kubctl
AWS_REGION="us-east-1"
CLUSTER_NAME="eks-mundos-e01"

# Actualizar el caché de paquetes
sudo apt update

# Instalar unzip
sudo apt install -y unzip

# Instalar awscli
curl -L "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
    
# Descomprimir el instalador de AWS CLI
unzip /tmp/awscliv2.zip -d /tmp/
    
# Instalar AWS CLI
sudo /tmp/aws/install

# Descargar kubectl
curl -L "https://s3.us-west-2.amazonaws.com/amazon-eks/1.26.2/2023-03-17/bin/linux/amd64/kubectl" -o "/usr/local/bin/kubectl"
sudo chmod +x /usr/local/bin/kubectl

# Añadir kubectl a la PATH
echo 'export PATH=$PATH:/usr/local/bin' >> /home/$USER/.bashrc

# Instalar eksctl
curl -L "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" -o "/tmp/eksctl.tar.gz"

# Extraer e instalar eksctl
tar -zxvf /tmp/eksctl.tar.gz -C /tmp/
sudo mv /tmp/eksctl /usr/local/bin/

# Instalar dependencias de Docker
sudo apt install -y ca-certificates curl

# Agregar la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Agregar el repositorio de Docker
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instalar Docker
sudo apt update
sudo apt install -y docker-ce

# Iniciar y habilitar el servicio de Docker
sudo systemctl enable docker
sudo systemctl start docker

# Agregar la clave de Helm
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null

# Agregar repositorio de Helm
echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

# Actualizar la lista de paquetes y instalar Helm
sudo apt update
sudo apt install -y helm

# Añadir llave de firma de HashiCorp para Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

# Añadir el repositorio de Terraform
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Instalar Terraform
sudo apt update
sudo apt install -y terraform

# Limpiar
rm -rf /tmp/awscliv2.zip /tmp/aws /tmp/eksctl.tar.gz


## Configurar kubectl
aws eks update-kubeconfig --name $CLUSTER_NAME --region $AWS_REGION