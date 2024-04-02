CREATE TABLE CONTATO (
ID SERIAL PRIMARY KEY,
NOME VARCHAR (30) NOT NULL,
NASCIMENTO DATE,
PESO DECIMAL (10,2));

CREATE TABLE EMAIL (
ID SERIAL PRIMARY KEY,
EMAIL VARCHAR (60) NOT NULL,
CONTATO_FK INTEGER,
FOREIGN KEY (CONTATO_FK) REFERENCES CONTATO (ID));

INSERT INTO CONTATO(NOME, NASCIMENTO, PESO) VALUES 
	('steve jobs', '24/02/1955', 80.6),
	('mark zuckerberg', '14/05/1984', 85),
	('bill gates', '28/10/1955', 90), 
	('elon musk', '03/12/1971', 95);

INSERT INTO EMAIL(EMAIL, CONTATO_FK) VALUES
	('stevejobs@gmail.com', 1),
	('2stevejobs@gmail.com', 1),
	('zuk@gmail.com', 2),
	('2zuk@gmail.com', 2),
	('gates-1234@gmail.com', 3),
	('musk-empress@gmail.com', 4);

SELECT nome, nascimento, peso, count(email) as "Qtd de emails" FROM CONTATO JOIN EMAIL ON EMAIL.CONTATO_FK = CONTATO.ID
	where nome like '%eve%'
	group by nome, nascimento, peso
	

ALTER TABLE CONTATO ADD IDADE INTEGER;
ALTER TABLE CONTATO add CIDADE VARCHAR(80);
ALTER TABLE CONTATO DROP CIDADE;

drop table contato cascade;
drop table email;


