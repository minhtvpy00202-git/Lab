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



select{
display: block;
margin: 0 auto;
	font-size: 20px;
	text-align: center;
}


</style>
</head>
<body>
	<%@ taglib uri="jakarta.tags.core" prefix="c"%>


	<h1>Hãy chọn quốc tịch của bạn</h1>
	
	
	<select>
		<c:forEach var="ct" items="${countries}">
			<option value="${ct.id}">${ct.name}</option>
		</c:forEach>
	</select>
	
</body>
</html>