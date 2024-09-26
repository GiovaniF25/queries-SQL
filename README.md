# Projeto de Banco de Dados - Sistema de Vendas

Este repositório foi criado por mim para treinar a linguagem SQL. Ele contém um projeto de banco de dados que simula um sistema de vendas, desenvolvido utilizando PostgreSQL. O projeto inclui tabelas para categorias, produtos, clientes e vendas.

## Estrutura do Banco de Dados

### Tabelas

- **CATEGORIA**
  - `id`: Identificador único da categoria (Série).
  - `nome`: Nome da categoria (VARCHAR).

- **PRODUTO**
  - `id`: Identificador único do produto (Série).
  - `nome`: Nome do produto (VARCHAR).
  - `preco`: Preço do produto (DECIMAL).
  - `categoria_id`: Identificador da categoria associada (INT, FK).

- **CLIENTE**
  - `id`: Identificador único do cliente (Série).
  - `nome`: Nome do cliente (VARCHAR).
  - `email`: Email do cliente (VARCHAR, único).

- **VENDAS**
  - `id`: Identificador único da venda (Série).
  - `cliente_id`: Identificador do cliente que realizou a compra (INT, FK).
  - `produto_id`: Identificador do produto vendido (INT, FK).
  - `quantidade`: Quantidade do produto vendido (INT).

## Consultas SQL

As consultas SQL foram realizadas e estão salvas no arquivo `consultas.sql`, que também foi enviado para o GitHub.
