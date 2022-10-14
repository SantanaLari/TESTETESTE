package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Funcionario;

public class CadastroDao implements ICadastroDao {

	private GenericDao gDao;
	
	public CadastroDao(GenericDao gDao) {
		this.gDao = gDao;
	}
	
	@Override
	public String insereFuncionario(Funcionario f) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		String sql = "INSERT INTO Cadastro VALUES(?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setString(1, f.getEmail());
		ps.setString(2, f.getSenha());
		ps.setString(3, f.getConfirmaSenha());
		ps.setString(4, f.getCargo());
		ps.setString(5, f.getTipo());
		ps.setString(6, f.getRF());
		ps.execute();
		ps.close();
		c.close();
		
		return "Funcionario cadastrado";
	}

}
