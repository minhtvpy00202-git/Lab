package poly.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import poly.entity.Employee;
import poly.utils.Jdbc;

public class EmployeeDAOImpl implements EmployeeDAO{

	@Override
	public List<Employee> findAll() {
		// TODO Auto-generated method stub
		String sql = "SELECT Id, Password, Fullname, Photo, Gender, Birthday, Salary, DepartmentId FROM Employees";
		try {
			List<Employee> entities = new ArrayList<>();
			Object[] values = {};
			ResultSet rs = Jdbc.executeQuery(sql, values);
			while(rs.next()) {
				Employee entity = new Employee();
				entity.setId(rs.getString("Id"));
				entity.setPassword(rs.getString("Password"));
				entity.setFullname(rs.getString("Fullname"));
				entity.setPhoto(rs.getString("Photo"));
				entity.setGender(rs.getBoolean("Gender"));
				entity.setBirthDay(rs.getDate("Birthday"));
				entity.setSalary(rs.getFloat("Salary"));
				entity.setDepartmentId(rs.getString("DepartmentId"));
				entities.add(entity);
			}
			return entities;
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}

	@Override
	public Employee findById(String id) {
		// TODO Auto-generated method stub
		String sql = "SELECT Id, Password, Fullname, Photo, Gender, Birthday, Salary, DepartmentId FROM Employees WHERE Id = ?";
		try {
			Object[] values = {id};
			ResultSet rs = Jdbc.executeQuery(sql, values);
			if (rs.next()) {
				Employee entity = new Employee();
				entity.setId(rs.getString("Id"));
				entity.setPassword(rs.getString("Password"));
				entity.setFullname(rs.getString("Fullname"));
				entity.setPhoto(rs.getString("Photo"));
				entity.setGender(rs.getBoolean("Gender"));
				entity.setBirthDay(rs.getDate("Birthday"));
				entity.setSalary(rs.getFloat("Salary"));
				entity.setDepartmentId(rs.getString("DepartmentId"));
				return entity;
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
		throw new RuntimeException("Not found");
	}

	@Override
	public void create(Employee entity) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO Employees(Id, Password, Fullname, Photo, Gender, Birthday, Salary, DepartmentId) VALUES (?,?,?,?,?,?,?,?)";
		 try {
			 Object[] values = {
						entity.getId(),
						entity.getPassword(),
						entity.getFullname(),
						entity.getPhoto(),
						entity.isGender(),
						entity.getBirthDay(),
						entity.getSalary(),
						entity.getDepartmentId()
				};
				Jdbc.executeUpdate(sql, values);
		} catch (java.sql.SQLIntegrityConstraintViolationException ex) {
	        // Trung khoa chinh
	        throw new RuntimeException("ID đã tồn tại", ex);

	    } catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}

	@Override
	public void update(Employee entity) {
		// TODO Auto-generated method stub
		String sql = "UPDATE Employees SET Password = ?, Fullname = ?, Photo = ?, Gender = ?, Birthday = ?, Salary = ?, DepartmentId = ? WHERE Id = ?";
		try {
			Object[] values = {
				entity.getPassword(),
				entity.getFullname(),
				entity.getPhoto(),
				entity.isGender(),
				entity.getBirthDay(),
				entity.getSalary(),
				entity.getDepartmentId(),
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
		String sql = "DELETE FROM Employees WHERE Id = ?";
		try {
			Object[] values = {id};
			Jdbc.executeUpdate(sql, values);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
	
	
}
