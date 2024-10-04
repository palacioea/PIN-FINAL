#!/bin/bash

#Configurar kubctl
AWS_REGION="$1"
CLUSTER_NAME="$2"

aws eks update-kubeconfig --name $CLUSTER_NAME --region $AWS_REGION