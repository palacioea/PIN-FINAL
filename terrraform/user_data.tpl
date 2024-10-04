#!/bin/bash

AWS_REGION="${region}"
CLUSTER_NAME="${cluster_name}"

# Instalar dependencias
bash ${install_dependencies_script}

# Configurar la aplicación
bash "${configure_app_script}" "$AWS_REGION" "$CLUSTER_NAME" 
