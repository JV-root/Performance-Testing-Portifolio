#!/bin/bash

# Variáveis de configuração
DYNATRACE_ENVIRONMENT="ghe69892"
DYNATRACE_API_TOKEN="dt0c01.L2K4A7D22CVJVOKPW5JCGOCE.OXHNGCH2CYU4SZJTAD6S6JYGWI7PBQRUTFKBZUOTZ5TBV5G2PZ4QVNL3SM4P2KBM"

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