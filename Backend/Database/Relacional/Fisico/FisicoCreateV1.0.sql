CREATE DATABASE api5;
USE api5;

CREATE TABLE usuario (
	id_usuario INT PRIMARY KEY NOT NULL,
	nome VARCHAR(256) NOT NULL,
	email VARCHAR(256) NOT NULL,
	senha INT NOT NULL
);

CREATE TABLE ponto (
	id_ponto INT PRIMARY KEY NOT NULL,
	id_usuario INT NOT NULL,
	apelido VARCHAR(256),
    	historico VARCHAR(256),
    	lat_long INT NOT NULL,
   	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE notificacao (
	id_notificacao INT PRIMARY KEY NOT NULL,
    	id_usuario INT NOT NULL,
    	id_ponto INT NOT NULL,
   	data_hora TIMESTAMP,
    	mensagem VARCHAR(256),
    	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    	FOREIGN KEY (id_ponto) REFERENCES ponto(id_ponto)
);

CREATE TABLE relatorio (
	id_relatorio INT PRIMARY KEY NOT NULL,
   	id_notificacao INT NOT NULL,
   	id_usuario INT NOT NULL,
    	id_ponto INT NOT NULL,
    	data_hora TIMESTAMP,
   	titulo VARCHAR (256),
   	conclusao VARCHAR(256),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    	FOREIGN KEY (id_ponto) REFERENCES ponto(id_ponto),
   	FOREIGN KEY (id_notificacao) REFERENCES notificacao(id_notificacao)
)
