#!/bin/bash

# Variáveis de configuração
DYNATRACE_ENVIRONMENT=""
DYNATRACE_API_TOKEN=""

# Verificar se o agente já está instalado
if [ -d "/opt/dynatrace/oneagent" ]; then
  echo "Dynatrace OneAgent already installed."
  exit 0
fi

# Download do OneAgent
wget -O Dynatrace-OneAgent-Linux.sh "https://${DYNATRACE_ENVIRONMENT}.live.dynatrace.com/api/v1/deployment/installer/agent/unix/default/latest?Api-Token=${DYNATRACE_API_TOKEN}"

# Instalação do OneAgent
sudo /bin/sh Dynatrace-OneAgent-Linux.sh APP_LOG_CONTENT_ACCESS=1

# Verificar o status do OneAgent
/opt/dynatrace/oneagent/dynatrace-agent status

# Limpeza
rm -f Dynatrace-OneAgent-Linux.sh

echo "Dynatrace OneAgent installation completed."