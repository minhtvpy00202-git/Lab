package poly.dao;

import java.security.PublicKey;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.parser.Entity;

import poly.entity.Department;
import poly.utils.Jdbc;

public class DepartmentDAOImpl implements DepartmentDAO {
	@Override
	public List<Department> findAll() {
		String sql = "SELECT * FROM Departments";

		try {
			List<Department> entities = new ArrayList<>();
			Object[] values = {};
			ResultSet resultSet = Jdbc.executeQuery(sql, values);
			while (resultSet.next()) {
				Department entity = new Department();
				entity.setId(resultSet.getString("Id"));
				entity.setName(resultSet.getString("Name"));
				entity.setDescription(resultSet.getString("Description"));
				entities.add(entity);
			}
			return entities;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public Department findById(String id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM Departments Where Id = ?";
		try {
			Object[] values = {id};
			ResultSet rs = Jdbc.executeQuery(sql, values);
			if(rs.next()) {
				Department entity = new Department();
				entity.setId(rs.getString("Id"));
				entity.setName(rs.getString("Name"));
				entity.setDescription(rs.getString("Description"));
				return entity;
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException (e);
		}
		throw new RuntimeException("Not found");
	}

	@Override
	public void create(Department entity) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO Departments(Id, Name, Description) VALUES (?,?,?)";
		
		try {
			Object[] values = {
					entity.getId(),
					entity.getName(),
					entity.getDescription()
			};
			Jdbc.executeUpdate(sql, values);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}

	@Override
	public void update(Department entity) {
		// TODO Auto-generated method stub
		String sql = "UPDATE Departments SET Name=?, Description=? WHERE Id=?";
		try {
			Object[] values = {
				entity.getName(),
				entity.getDescription(),
				entity.getId()
			};
			Jdbc.executeUpdate(sql, values);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
				
	}

	@Override
	public void deleteById(String id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM Departments WHERE Id = ?";
		try {
			Object[] values = {id};	
			Jdbc.executeUpdate(sql, values);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
}
