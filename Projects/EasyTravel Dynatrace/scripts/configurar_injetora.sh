#!/bin/bash

# Atualiza os pacotes do sistema operacional
sudo apt-get update && sudo apt-get upgrade -y

# Instala o Java Development Kit (JDK)
sudo apt install -y openjdk-11-jre

# Baixa o pacote binário do Apache JMeter
wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.4.2.tgz

# Extrai o pacote do JMeter
tar -xvf apache-jmeter-5.4.2.tgz

# Navega para o diretório do JMeter
cd apache-jmeter-5.4.1/

# Executa o JMeter com o plano de teste específico
# ./bin/jmeter.sh -n -t /path/to/your/testplan.jmx
