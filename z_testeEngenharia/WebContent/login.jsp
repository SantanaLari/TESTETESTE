<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./css/style.css">
<title>Insert title here</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp" />
	</div>
	<div align="center">
		<H1><b> LOGIN1 </b></H1>
		<hr>
		<form action="login" method="post">
			<table>
				<tr>
					<td>
						<input class="input_email" type="text" id="email" placeholder="E-mail" name="email"
							value='<c:out value="${login.email }"></c:out>'> 
					</td>
				</tr>
				<tr>
					<td>
						<input class="input_senha" type="text" id="senha" placeholder="Senha" name="senha"
							value='<c:out value="${login.senha }"></c:out>'> 
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