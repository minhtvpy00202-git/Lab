<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="ftm" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Managerment</title>
</head>
<body>
	<c:url var = "path" value="/employee" />
	<!-- FORM -->
	<form method="post">
		<label>Id:</label><br>
		<input name="id" value="${item.id}"><br>
		<label>Password:</label><br>
		<input name="password" value="${item.password}"><br>
		<label>Fullname:</label><br>
		<input name="fullname" value="${item.fullname}"><br>
		<label>Photo:</label><br>
		<input name="photo" value="${item.photo}"><br>
		<label>Gender:</label><br>
		<input name="gender" value="${item.gender}"><br>
		<label>Birthday:</label><br>
		<input name="birthday" value="${item.birthday}"><br>
		<label>Salary:</label><br>
		<input name="salary" value="${item.salary}"><br>
		<label>Department:</label><br>
		<input name="department" value="${item.department}">
	</form>
	
	<!-- TABLE -->
	<table>
		<thead>
			<tr>
				<th>No.</th>
				<th>Id</th>
				<th>Password</th>
				<th>Fullname</th>
				<th>Photo</th>
				<th>Gender</th>
				<th>Birthday</th>
				<th>Salary</th>
				<th>Department</th>
				<th>Action</th>
			</tr>
		</thead>
			<c:forEach var="d" items="${list}" varStatus="vs">
				<tr>
					<td>${vs.count}</td>
					<td>${d.id}</td>
					<td>${d.password}</td>
					<td>${d.fullname}</td>
					<td>${d.photo}</td>
					<td>${d.gender}</td>
					<td>${d.birthday}</td>
					<td>${d.salary}</td>
					<td>${d.department}</td>
					<td><a href="${path}/edit/${d.id}">Edit</a></td>
				</tr>
			</c:forEach>
		<tbody>
		</tbody>
	</table>
</body>
</html>