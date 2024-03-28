# Plano de Teste de Performance Baseline - Easy Travel 

## 1. Introdução
O objetivo deste documento é delinear o plano para a realização de testes de desempenho para o aplicativo EasyTravel. Este documento fornecerá uma visão geral dos seguintes componentes:
- Contexto;
- objetivos de teste;
- escopo;
- ambiente de teste;
- cenários de teste;
- métricas de desempenho a serem medidas.

## 2. Contexto
O Easy Travel é uma plataforma de viagem que oferece aos usuários um portal web intuitivo e acessível. Através deste portal, os usuários podem explorar uma variedade de opções de viagens e efetuar suas compras de forma conveniente, utilizando cartão de crédito.

Tom, o responsável pelo lançamento da aplicação, está revisando os últimos detalhes antes de disponibilizar a plataforma para o público. Ele compreende que o sucesso do EasyTravel não só depende da sua funcionalidade, mas também da sua capacidade de lidar com uma alta demanda de usuários.

Diante desse cenário, Tom e sua equipe planejam realizar uma certificação técnica para medir até quantos usuários simultâneos a aplicação consegue suportar em dois cenários distintos: um utilizando uma instância t2.medium e outro t2.large no provedor de nuvem AWS.

## 2. Objetivos de Teste
Os principais objetivos dos testes de desempenho são:
- Criar uma métrica inicial do desempenho do sistema em sua configuração atual.
- Servir como base para comparação com resultados futuros após alterações no sistema.
- Criar critérios de aceite para futuras modificações no sistema.
- Garantir que o sistema atenda às expectativas de performance dos usuários.

## 3. Metodologia
A metodologia de teste de Performance será a de baseline, que consiste em estabelecer um ponto de referência inicial para o desempenho do sistema, aplicação ou componente antes de qualquer alteração significativa. Isso ajuda a entender o estado atual do desempenho e fornece uma base para comparação após a implementação de mudanças, atualizações ou otimizações.


## 3. Escopo
Os testes de desempenho serão focados nas seguintes áreas:
- Home
- Login e autenticação do usuário.
- Pesquisa e reserva de viagens.
- Processamento de pagamento com cartão de crédito.


## 4. Ambiente de Teste
Os testes de desempenho serão realizados em ambientes com a seguintes configurações:

- **Ambiente 01**: Amazon EC2 T2.Medium:
  - **CPU**: 2 vCPUs
  - **Memória**: 4 GiB de memória RAM.
  - **Armazenamento**: 20GB.

- **Ambiente 02**: Amazon EC2 T2.Large:
  - **CPU**: 2 vCPUs
  - **Memória**: 8 GiB de memória RAM.
  - **Armazenamento**: 20GB.

A Máquina Injetora terá a seguinte configuração:
- Amazon EC2 T2.Medium:
  - **CPU**: 2 vCPUs
  - **Memória**: 4 GiB de memória RAM.
  - **Armazenamento**: 20GB.

## 5. Cenários de Teste
Os seguintes cenários de teste serão executados durante os testes de desempenho:
- **Cenário 1**: Simular 30 usuários concorrentes realizando login, pesquisando e reservando viagens no Ambiente 01.
- **Cenário 2**: Simular 30 usuários concorrentes realizando login, pesquisando e reservando viagens no Ambiente 02.

## 6. Métricas de Desempenho
As seguintes métricas de desempenho serão medidas durante os testes:
- Tempo de resposta: O tempo necessário para o aplicativo responder às solicitações do usuário.
- Taxa de transferência: O número de solicitações processadas por unidade de tempo.
- Taxa de erro: A porcentagem de solicitações falhadas.
- Utilização de CPU e memória: O uso dos recursos do sistema durante os testes.

## 7. Execução dos Testes
Os testes de desempenho serão executados nas seguintes etapas:
1. Configurar o ambiente de teste.
2. Configurar a ferramenta de teste de carga.
3. Executar os cenários de teste.
4. Monitorar e coletar métricas de desempenho.
5. Analisar os resultados dos testes.
6. Identificar quaisquer problemas de desempenho e gargalos.
7. Fornecer recomendações para otimização de desempenho.


