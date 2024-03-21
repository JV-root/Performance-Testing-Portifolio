#!/bin/bash

# Atualiza os pacotes do sistema operacional
sudo yum update -y

# Instala o Java Development Kit (JDK)
sudo yum install -y java-1.8.0-openjdk

# Baixa o pacote binário do Apache JMeter
wget https://downloads.apache.org/jmeter/binaries/apache-jmeter-5.4.1.tgz

# Extrai o pacote do JMeter
tar -xvf apache-jmeter-5.4.1.tgz

# Navega para o diretório do JMeter
cd apache-jmeter-5.4.1/

# Executa o JMeter com o plano de teste específico
# ./bin/jmeter.sh -n -t /path/to/your/testplan.jmx
