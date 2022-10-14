package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Login;
import persistence.GenericDao;
import persistence.ILoginDao;
import persistence.LoginDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String botao = request.getParameter("enviar");
		String erro = "";
		String saida = "";
		
		Login l = new Login();
		
		GenericDao gDao = new GenericDao();
		ILoginDao lDao = new LoginDao(gDao);
		
		try {
			if(botao.equals("Enviar")) {
				l = valido(email, senha, botao);
				saida = lDao.validaLogin(l);
				l = new Login();
			}
		}catch(SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
		}finally {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			request.setAttribute("l", l);
			request.setAttribute("erro", erro);
			request.setAttribute("saida", saida);
			rd.forward(request, response);
		}
	}

	private Login valido(String email, String senha, String botao) {
		Login l = new Login();
		
		if(botao.equals("Enviar")) {
			l.setEmail(email);
			l.setSenha(senha);
		}
		
		return l;
	}
	
}
