-- 1. Contar total de produtos por categoria
SELECT c.nome AS categoria, COUNT(p.id) AS total_produtos
FROM CATEGORIA c
LEFT JOIN PRODUTO p ON c.id = p.categoria_id
GROUP BY c.id, c.nome;
-- Resultado:
-- | Categoria     | Total Produtos |
-- |---------------|----------------|
-- | Alimentos     | 2              |
-- | Bebidas       | 1              |
-- | Eletrônicos   | 2              |

-- 2. Calcular média de preço dos produtos por categoria
SELECT c.nome AS categoria, AVG(p.preco) AS media_preco
FROM CATEGORIA c
JOIN PRODUTO p ON c.id = p.categoria_id
GROUP BY c.id, c.nome;
-- Resultado:
-- | Categoria     | Média Preço |
-- |---------------|-------------|
-- | Alimentos     | 17.75       |
-- | Bebidas       | 5.00        |
-- | Eletrônicos   | 2250.00     |

-- 3. Obter produtos com preço acima da média
WITH media AS (
    SELECT AVG(preco) AS preco_medio FROM PRODUTO
)
SELECT p.nome, p.preco
FROM PRODUTO p
JOIN media m ON p.preco > m.preco_medio;
-- Resultado:
-- | Nome        | Preço   |
-- |-------------|---------|
-- | TV          | 1500.00 |
-- | Computador  | 3000.00 |

-- 4. Listar clientes e quantos produtos compraram
SELECT cl.nome AS cliente, COUNT(v.id) AS total_compras
FROM CLIENTE cl
LEFT JOIN VENDAS v ON cl.id = v.cliente_id
GROUP BY cl.id, cl.nome;
-- Resultado:
-- | Cliente          | Total Compras |
-- |------------------|----------------|
-- | Carlos Silva     | 2              |
-- | Ana Costa        | 1              |
-- | Pedro Lima       | 0              |

-- 5. Produtos mais vendidos
SELECT p.nome, SUM(v.quantidade) AS total_vendido
FROM PRODUTO p
JOIN VENDAS v ON p.id = v.produto_id
GROUP BY p.id, p.nome
ORDER BY total_vendido DESC;
-- Resultado:
-- | Nome        | Total Vendido |
-- |-------------|---------------|
-- | Feijão      | 5             |
-- | Cerveja     | 5             |
-- | Arroz       | 2             |
-- | TV          | 1             |
-- | Computador  | 0             |

-- 6. Vendas por cliente e produto
SELECT cl.nome AS cliente, p.nome AS produto, SUM(v.quantidade) AS total_comprado
FROM CLIENTE cl
JOIN VENDAS v ON cl.id = v.cliente_id
JOIN PRODUTO p ON v.produto_id = p.id
GROUP BY cl.id, p.id
ORDER BY cl.nome, p.nome;
-- Resultado:
-- | Cliente          | Produto  | Total Comprado |
-- |------------------|----------|-----------------|
-- | Carlos Silva     | Arroz    | 2               |
-- | Carlos Silva     | TV       | 1               |
-- | Ana Costa        | Cerveja  | 5               |

-- 7. Clientes que não realizaram compras
SELECT cl.nome, cl.email
FROM CLIENTE cl
LEFT JOIN VENDAS v ON cl.id = v.cliente_id
WHERE v.id IS NULL;
-- Resultado:
-- | Nome         | Email                    |
-- |--------------|--------------------------|
-- | Pedro Lima   | pedro.lima@example.com   |

-- 8. Total de vendas por categoria
SELECT c.nome AS categoria, SUM(v.quantidade) AS total_vendas
FROM CATEGORIA c
JOIN PRODUTO p ON c.id = p.categoria_id
JOIN VENDAS v ON p.id = v.produto_id
GROUP BY c.id, c.nome;
-- Resultado:
-- | Categoria     | Total Vendas |
-- |---------------|---------------|
-- | Alimentos     | 2             |
-- | Bebidas       | 5             |
-- | Eletrônicos   | 1             |

