<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./css/style.css">
<title>Cadastro</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp" />
	</div>
	<div align="center">
		<H1><b> CADASTRO </b></H1>
		<hr>
		<form action="cadastro" method="post">
			<table>
				<tr>
					<td>
						<input class="input_email" type="text" id="email" placeholder="E-mail" name="email"
							value='<c:out value="${cadastro.email }"></c:out>'> 
						<select class="input_cargo" id="cargo" name="cargo">
							<option value="0"> Selecione um cargo </option>
							<option value="Professor"> Professor </option>
							<option value="Coordenador"> Coordenador </option>
							<option value="Diretor"> Diretor </option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<input class="input_senha" type="text" id="senha" placeholder="Senha" name="senha"
							value='<c:out value="${cadastro.cargo }"></c:out>'> 
						<select class="input_tipo" id="tipo" name="tipo">
							<option value="0"> Classificacao </option>
							<option value="Funcionario"> Funcionario </option>
							<option value="Aluno"> Aluno </option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<input class="input_Csenha" type="text" id="cSenha" placeholder="Confirma senha" name="cSenha"
							value='<c:out value="${cadastro.cSenha }"></c:out>'> 
						<input class="input_rf" type="text" id="rf" placeholder="RF" name="rf"
							value='<c:out value="${cadastro.rf }"></c:out>'> 
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" id="enviar" name="enviar" value="Enviar">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div align="center">
		<c:if test="${not empty erro }">
			<H2><c:out value="${erro }" /></H2>
		</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty saida }">
			<H3><c:out value="${saida }" /></H3>
		</c:if>
	</div>
	
</body>
</html>