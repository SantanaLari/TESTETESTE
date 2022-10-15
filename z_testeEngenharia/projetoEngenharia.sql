CREATE DATABASE projetoEngenharia
use projetoEngenharia

CREATE TABLE cadastro 
(
id		INT		IDENTITY(1,1),
email	VARCHAR(100) NOT NULL,
senha	VARCHAR(100) NOT NULL,
cSenha	INT			 NOT NULL	
)

DROP TABLE cadastro
DELETE cadastro

INSERT INTO cadastro VALUES
('lah@gmail.com', 1234, 1234),
('mah@gmail.com', 1235, 1234),
('bah@gmail.com', 1236, 1234)

SELECT * FROM cadastro


CREATE PROCEDURE p_verificacao(@e VARCHAR(100), @s INT)
AS
	DECLARE @email INT,
			@senha INT
	SET @email = (SELECT COUNT(*) FROM cadastro WHERE email = @e)
	SET @senha = (SELECT COUNT(*) FROM cadastro WHERE senha = @s)

	IF (@email = 0 or @senha = 0)
	BEGIN
		RAISERROR 'Email ou senha incorreto'
	END
	ELSE
	BEGIN
		RAISERROR 'Bem-vindo'
	END


EXEC p_verificacao @e = 'lah@gmail.com', @s = '1234'
EXEC p_verificacao @e = 'lahsantana@gmail.com', @s = 1234



