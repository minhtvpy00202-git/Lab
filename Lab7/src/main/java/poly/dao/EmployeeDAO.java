package poly.dao;

import java.util.List;

import poly.entity.Employee;

public interface EmployeeDAO {
	/*Truy van tat ca */
	List<Employee> findAll();
	
	/*Truy van theo ma Id */
	Employee  findById(String id);
	
	/*Them moi */
	void create(Employee entity);
	
	/*Cap nhat */
	void update(Employee entity);
	
	/*Xoa theo ma */
	void deleteById(String id);
}
