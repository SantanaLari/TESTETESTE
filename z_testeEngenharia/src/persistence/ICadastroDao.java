package persistence;

import java.sql.SQLException;

import model.Funcionario;

public interface ICadastroDao {
	
	public String insereFuncionario(Funcionario f) throws SQLException, ClassNotFoundException;
}
