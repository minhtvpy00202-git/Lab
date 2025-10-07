package poly.dao;

import java.util.List;

import poly.entity.Department;

public interface DepartmentDAO {
	/* Truy van tat ca */
	List<Department> findAll();
	
	/*Truy van theo ma */
	Department findById(String id);
	
	/*Them moi */
	void create(Department entity);
	
	/*Cap nhat */
	void update(Department entity);
	
	/*Xoa theo ma */
	void deleteById(String id);
	
}
