package poly.entity;

public class Department {
	String Id;
	String Name;
	String Description;
	public Department(String id, String name, String description) {
		super();
		Id = id;
		Name = name;
		Description = description;
	}
	public Department() {
		super();
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	
	
}
