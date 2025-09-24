<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Country</title>
<style>
h1 {
	color: tomato;
	text-align: center;
	background-color: black;
}

th, td {
	border: 1px solid tomato;
}

table {
margin: 0 auto;
font-size: 30px;
}
</style>
</head>
<body>
	<%@ taglib uri="jakarta.tags.core" prefix="c"%>


	<h1>Danh sách quốc tịch</h1>


	<table>
		<thead>
			<tr>
				<th>No.</th>
				<th>Id</th>
				<th>Name</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="ct" items="${countries}" varStatus = "vs">
			<tr>
				<td>${vs.count}</td>
				<td>${ct.id}</td>
				<td>${ct.name}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>