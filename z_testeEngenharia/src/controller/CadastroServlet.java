package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Funcionario;
import persistence.CadastroDao;
import persistence.GenericDao;
import persistence.ICadastroDao;

@WebServlet("/cadastro")
public class CadastroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CadastroServlet() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String cargo = request.getParameter("cargo");
		String senha = request.getParameter("senha");
		String tipo = request.getParameter("tipo");
		String cSenha = request.getParameter("cSenha");
		String rf = request.getParameter("rf");
		String botao = request.getParameter("enviar");
		String erro = "";
		String saida = "";
		
		Funcionario f = new Funcionario();
		
		GenericDao gDao = new GenericDao();
		ICadastroDao cDao = new CadastroDao(gDao);
		
		try {
			if(botao.equals("Enviar")) {
				f = valido(email, senha, cSenha, cargo, tipo, rf, botao);
				saida = cDao.insereFuncionario(f);
				f = new Funcionario();
			}
		}catch(SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
		}finally {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			request.setAttribute("f", f);
			request.setAttribute("erro", erro);
			request.setAttribute("saida", saida);
			rd.forward(request, response);
		}
	}
	
	private Funcionario valido(String email, String senha, String cSenha, String cargo, String tipo, String rf, String botao) {
		Funcionario f = new Funcionario();
		
		if(botao.equals("Enviar")) {
			f.setEmail(email);
			f.setSenha(senha);
			f.setConfirmaSenha(cSenha);
			f.setCargo(cargo);
			f.setTipo(tipo);
			f.setRF(rf);
		}
		
		return f;
	}

}
