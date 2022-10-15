CREATE DATABASE sistemaLocacao
GO
USE sistemaLocacao
GO
CREATE TABLE Cadastro
(
id				INT	IDENTITY(1,1) NOT NULL,
email			VARCHAR(100) NOT NULL,	
senha			VARCHAR(10) NOT NULL,
confirmaSenha	VARCHAR(10) NOT NULL,
cargo			VARCHAR(100) NOT NULL,
tipo			VARCHAR(100) NOT NULL,
rf				VARCHAR(100) NOT NULL
PRIMARY KEY(id)
)

SELECT * FROM Cadastro

delete Cadastro

INSERT INTO Cadastro VALUES
('fulano', '123', '123', 'Professor', 'funcionario', '123456')

CREATE PROCEDURE p_verificacao(@e VARCHAR(100), @s VARCHAR(10))
AS
	DECLARE @email INT,
			@senha INT
	SET @email = (SELECT COUNT(*) FROM cadastro WHERE email = @e)
	SET @senha = (SELECT COUNT(*) FROM cadastro WHERE senha = @s)

	IF (@email = 0 or @senha = 0)
	BEGIN
		PRINT 'Email ou senha incorreto'
	END
	ELSE
	BEGIN
		PRINT 'Bem-vindo'
	END


EXEC p_verificacao @e = 'lah@gmail.com', @s = 1234

