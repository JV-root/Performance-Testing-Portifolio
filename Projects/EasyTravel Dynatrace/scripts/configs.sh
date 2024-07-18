#!/bin/bash

# Atualizar os pacotes do sistema
sudo apt update -y
sudo apt upgrade -y

# Verificar se o OpenJDK 11 já está instalado
if ! java -version 2>&1 | grep -q "openjdk version"; then

# Instalar o OpenJDK 11
sudo apt install -y openjdk-11-jre
fi

# Verificar se o Easy Travel já está baixado
if [ ! -f "dynatrace-easytravel-linux-x86_64.jar" ]; then

# Baixar o Easy Travel do Dynatrace
wget https://etinstallers.demoability.dynatracelabs.com/latest/dynatrace-easytravel-linux-x86_64.jar
fi

# Executar o Easy Travel
java -jar dynatrace-easytravel-linux-x86_64.jar

# entrar no diretório do easy_travel
cd easytravel-2.0.0-x64/weblauncher/

chmod 777 weblauncher.sh 

./weblauncher.sh &
