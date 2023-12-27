
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE produtos_categorias (
    produto_id INTEGER REFERENCES produtos(id),
    categoria_id INTEGER REFERENCES categorias(id),
    PRIMARY KEY (produto_id, categoria_id)
);



--3
SELECT nome as Produto, preco as Valor FROM produtos where preco > 100 order by preco, nome;

--4
SELECT id, preco from produtos where preco > (SELECT AVG(preco) FROM produtos);

--5
SELECT c.id AS categoria_id, c.nome AS categoria_nome, AVG(p.preco) AS preco_medio
FROM categorias c
LEFT JOIN produtos_categorias pc ON c.id = pc.categoria_id
LEFT JOIN produtos p ON pc.produto_id = p.id
GROUP BY
    c.id, c.nome
HAVING
    COUNT(p.id) > 0
ORDER BY
    c.nome;