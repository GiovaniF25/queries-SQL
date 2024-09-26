import psycopg2

def main():
    # Conectar ao banco de dados PostgreSQL
    conn = psycopg2.connect(
        dbname='teste',
        user='teste_user',
        password='teste_password',
        host='localhost'
    )

    cursor = conn.cursor()

    # Criar a tabela CATEGORIA
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS CATEGORIA (
        id SERIAL PRIMARY KEY,
        nome VARCHAR(100) NOT NULL
    );
    ''')

    # Inserir dados na tabela CATEGORIA
    cursor.execute('''
    INSERT INTO CATEGORIA (nome) VALUES
    ('Alimentos'),
    ('Bebidas'),
    ('Eletrônicos');
    ''')

    # Criar a tabela PRODUTO
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS PRODUTO (
        id SERIAL PRIMARY KEY,
        nome VARCHAR(100) NOT NULL,
        preco DECIMAL(10, 2) NOT NULL,
        categoria_id INT,
        FOREIGN KEY (categoria_id) REFERENCES CATEGORIA(id) ON DELETE CASCADE
    );
    ''')

    # Inserir dados na tabela PRODUTO
    cursor.execute('''
    INSERT INTO PRODUTO (nome, preco, categoria_id) VALUES
    ('Arroz', 20.50, 1),
    ('Feijão', 15.00, 1),
    ('Cerveja', 5.00, 2),
    ('TV', 1500.00, 3),
    ('Computador', 3000.00, 3);
    ''')

    # Criar a tabela CLIENTE
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS CLIENTE (
        id SERIAL PRIMARY KEY,
        nome VARCHAR(100) NOT NULL,
        email VARCHAR(100) UNIQUE NOT NULL
    );
    ''')

    # Inserir dados na tabela CLIENTE
    cursor.execute('''
    INSERT INTO CLIENTE (nome, email) VALUES
    ('Carlos Silva', 'carlos.silva@example.com'),
    ('Ana Costa', 'ana.costa@example.com'),
    ('Pedro Lima', 'pedro.lima@example.com');
    ''')

    # Criar a tabela VENDAS
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS VENDAS (
        id SERIAL PRIMARY KEY,
        cliente_id INT,
        produto_id INT,
        quantidade INT NOT NULL,
        FOREIGN KEY (cliente_id) REFERENCES CLIENTE(id) ON DELETE CASCADE,
        FOREIGN KEY (produto_id) REFERENCES PRODUTO(id) ON DELETE CASCADE
    );
    ''')

    # Inserir dados na tabela VENDAS
    cursor.execute('''
    INSERT INTO VENDAS (cliente_id, produto_id, quantidade) VALUES
    (1, 1, 2),
    (2, 3, 5),
    (1, 4, 1);
    ''')

    # Salvar (commit) as alterações
    conn.commit()

    # Fechar a conexão
    cursor.close()
    conn.close()

if __name__ == "__main__":
    main()
