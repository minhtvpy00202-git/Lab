package poly.entity;

import java.sql.Date;

public class Employee {
	String Id;
	String Password;
	String Fullname;
	String Photo;
	boolean Gender;
	Date BirthDay;
	float Salary;
	String DepartmentId;
	public Employee(String id, String password, String fullname, String photo, boolean gender, Date birthDay,
			float salary, String departmentId) {
		super();
		Id = id;
		Password = password;
		Fullname = fullname;
		Photo = photo;
		Gender = gender;
		BirthDay = birthDay;
		Salary = salary;
		DepartmentId = departmentId;
	}
	public Employee() {
		super();
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getFullname() {
		return Fullname;
	}
	public void setFullname(String fullname) {
		Fullname = fullname;
	}
	public String getPhoto() {
		return Photo;
	}
	public void setPhoto(String photo) {
		Photo = photo;
	}
	public boolean isGender() {
		return Gender;
	}
	public void setGender(boolean gender) {
		Gender = gender;
	}
	public Date getBirthDay() {
		return BirthDay;
	}
	public void setBirthDay(Date birthDay) {
		BirthDay = birthDay;
	}
	public float getSalary() {
		return Salary;
	}
	public void setSalary(float salary) {
		Salary = salary;
	}
	public String getDepartmentId() {
		return DepartmentId;
	}
	public void setDepartmentId(String departmentId) {
		DepartmentId = departmentId;
	}
	
	
	
}
