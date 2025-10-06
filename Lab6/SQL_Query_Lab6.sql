create database HRM;
go
use HRM;
go

create table Departments (
	Id char(3) not null,
	[Name] nvarchar(50) not null,
	[Description] nvarchar(255) null,
	primary key (Id)
);
go
create table Employees (
	Id varchar(20) not null,
	[Password] nvarchar(50) not null,
	Fullname nvarchar(50) not null,
	Photo nvarchar(50) not null,
	Gender bit not null,
	Birthday date not null,
	Salary float not null,
	DepartmentId char(3) not null,
	primary key (Id),
	foreign key (DepartmentId) references Departments(Id)
		on delete cascade
		on update cascade
);
go

-- Truy vấn tất cả:
	--Departments:
		select * from Departments;
	-- Employees:
		select * from Employees;
-- Truy vấn theo khóa chính:
	-- Departments:
		select * from Departments d
		where d.Id = ?;
	-- Employees:
		select * from Employees e
		where e.Id = ?
-- Thêm mới:
	-- Departments:
		insert into Departments (Id, [Name], [Description]) values
		(?, ?, ?);
	-- Employees:
		insert into Employees (Id, [Password], Fullname, Photo, Gender, Birthday, Salary, DepartmentId)
		values (?,?,?,?,?,?,?,?);
-- Cập nhật theo khóa chính:
	-- Departments:
		update Departments set [Name] = ?,  [Description] = ?
		where Id = ?;
	-- Employees:
		update Employees set [Password] = ?, Fullname= ?, Photo= ?, Gender= ?, Birthday= ?, Salary= ?, DepartmentId= ?
		where Id = ?
-- Xóa theo khóa chính:
	-- Departments:
		delete from Departments where Id = ?;
	-- Employees:
		delete from Employees where Id = ?;