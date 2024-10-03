#!/bin/bash

#Configurar kubctl
aws eks update-kubeconfig --name ${aws_eks_cluster.eks_cluster.name} --region ${var.region}