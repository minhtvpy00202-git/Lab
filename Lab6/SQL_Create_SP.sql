use hrm;
go

--Thêm mới:
create procedure spInsert(
	@Id char(3),
	@Name nvarchar(50),
	@Description nvarchar(255)
) as begin
		insert into Departments(Id, Name, Description)
			values(@Id, @Name, @Description)
end
go
-- Cập nhật:
create procedure spUpdate(
	@Id char(3),
	@Name nvarchar(50),
	@Description nvarchar(255)
) as begin
	Update Departments
		set Name = @Name, Description = @Description
		where Id = @Id
end
go

--Xoa theo khoa chinh:
create procedure spDeleteById (
	@Id char(3)
) as begin 
	delete from Departments where Id = @Id
end
go
-- Truy van tat ca
create procedure spSelectAll
as begin
	select * from Departments
end
go

-- Truy van theo khoa chinh
create procedure spSelectById(
	@Id char(3)
) as begin
	select * from Departments
	where Id = @Id
end
go
