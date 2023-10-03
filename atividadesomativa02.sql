CREATE DATABASE atividade_somativa_02;
USE atividade_somativa_02;

-- Criando tabelas

CREATE TABLE regiao (
	codRegiao BIGINT NOT NULL AUTO_INCREMENT,
    nomeRegiao VARCHAR(100) NOT NULL,
    descricaoRegiao TEXT,
    PRIMARY KEY (codRegiao)
);

CREATE TABLE vinicola (
	codVinicola BIGINT NOT NULL AUTO_INCREMENT,
    nomeVinicola VARCHAR(100) NOT NULL,
    descricaoVinicola TEXT,
    foneVinicola VARCHAR(15),
    emailVinicola VARCHAR(15),
    codRegiao BIGINT NOT NULL,
    PRIMARY KEY (codVinicola),
    FOREIGN KEY (codRegiao) REFERENCES regiao (codRegiao)
);

CREATE TABLE vinho (
	codVinho BIGINT NOT NULL AUTO_INCREMENT,
    nomeVinho VARCHAR(50) NOT NULL,
    tipoVinho VARCHAR(30) NOT NULL,
    anoVinho INT NOT NULL,
    descricaoVinho TEXT,
    codVinicola BIGINT NOT NULL,
    PRIMARY KEY (codVinho),
    FOREIGN KEY (codVinicola) REFERENCES vinicola (codVinicola)
);

-- Inserindo Regiões

INSERT INTO regiao (nomeRegiao, descricaoRegiao) VALUES ("Vale dos Vinhedos", "Clima Umido, temperado, com terreno arenoso");
INSERT INTO regiao (nomeRegiao, descricaoRegiao) VALUES ("Vale Central", "Clima Seco, desertico, com terreno de calcário");
INSERT INTO regiao (nomeRegiao, descricaoRegiao) VALUES ("Vale Europeu", "Clima Umido, subtropical, com terreno humoso");
INSERT INTO regiao (nomeRegiao, descricaoRegiao) VALUES ("Vale do Paraíba", "Clima Seco, tropical, com terreno argiloso");
INSERT INTO regiao (nomeRegiao, descricaoRegiao) VALUES ("Vale do São Francisco", "Clima Seco, tropical, com terreno arenoso");

-- Inserindo Vinicolas

INSERT INTO vinicola (nomeVinicola, descricaoVinicola, foneVinicola, emailVinicola, codRegiao) VALUES ("Vinhos do Vale", "Vinicola especializada em vinhos com teores de taninos mais altos", "54330127842", "vale@vinhos.com", 1);
INSERT INTO vinicola (nomeVinicola, descricaoVinicola, foneVinicola, emailVinicola, codRegiao) VALUES ("Vinhos del Chile", "Vinicola especializada em vinhos com baixos teores de taninos", "88302901523", "vino@chile.com", 2);
INSERT INTO vinicola (nomeVinicola, descricaoVinicola, foneVinicola, emailVinicola, codRegiao) VALUES ("Europa Vinhos", "Vinicola especializada em vinhos doces e frisantes", "47319800158", "euro@vinhos.com", 3);
INSERT INTO vinicola (nomeVinicola, descricaoVinicola, foneVinicola, emailVinicola, codRegiao) VALUES ("Uvas do Paraíba", "Vinicola especializada em vinhos brancos", "12339901577", "uvas@vinhos.com", 4);
INSERT INTO vinicola (nomeVinicola, descricaoVinicola, foneVinicola, emailVinicola, codRegiao) VALUES ("Vinhos do Nordeste", "Vinicola generalista com diversos tipos de vinhos", "35305897447", "nor@vinhos.com", 5);

-- Inserindo Vinhos

INSERT INTO vinho (nomeVinho, tipoVinho, anoVinho, descricaoVinho, codVinicola) VALUES ("Tannat do Vale", "Tannat", 2017, "Vinho Tannat envelhecido por 5 anos, frutado com tabaco", 1);
INSERT INTO vinho (nomeVinho, tipoVinho, anoVinho, descricaoVinho, codVinicola) VALUES ("Casillero Carmenere", "Carmenere", 2022, "Vinho suave, leve, com notas de frutas citricas", 2);
INSERT INTO vinho (nomeVinho, tipoVinho, anoVinho, descricaoVinho, codVinicola) VALUES ("Euro Noir", "Pinnot Noir", 2021, "Vinho Rose com notas de amora e ameixa", 3);
INSERT INTO vinho (nomeVinho, tipoVinho, anoVinho, descricaoVinho, codVinicola) VALUES ("Paraiba's White Wine", "Chardonnay", 2018, "Vinho leve, de alta acidez com notas de frutas tropicais", 4);
INSERT INTO vinho (nomeVinho, tipoVinho, anoVinho, descricaoVinho, codVinicola) VALUES ("Gran Merlot", "Merlot", 2020, "Vinho de média acidez, envelhecido por 2 anos.", 5);

-- Fazendo uma consulta que liste o nome e ano dos vinhos, bem como o nome da vinicola e a regiao

SELECT v.nomeVinho, v.anoVinho, i.nomeVinicola, r.nomeRegiao FROM vinho AS v, vinicola AS i, regiao AS r WHERE v.codVinicola = i.codVinicola AND i.codRegiao = r.codRegiao;

-- Criando o usuário Sommelier

CREATE USER 'Sommelier'@'localhost' IDENTIFIED BY 'Sommelier'
	WITH MAX_QUERIES_PER_HOUR 120
		 MAX_UPDATES_PER_HOUR 60
         MAX_CONNECTIONS_PER_HOUR 30
         MAX_USER_CONNECTIONS 6;
         
-- Garantindo acesso de seleção as tabelas

GRANT SELECT ON atividade_somativa_02.vinho TO 'Sommelier'@'localhost';
GRANT SELECT ON atividade_somativa_02.vinicola TO 'Sommelier'@'localhost';
GRANT SELECT ON atividade_somativa_02.regiao TO 'Sommelier'@'localhost';







