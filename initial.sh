#!/bin/bash

# Ejecutar Terraform y guardar la salida
terraform -chdir=terrraform/ init -upgrade
terraform -chdir=terrraform/ plan
terraform -chdir=terrraform/ apply -auto-approve 