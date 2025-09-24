<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send mail</title>
</head>
<body>

	<c:if test="${not empty ok}">
		<p style="color: green">${ok}</p>
	</c:if>
	<c:if test="${not empty err}">
		<p style="color: red">${err}</p>
	</c:if>

	<c:url value="/sendmail" var="url" />
	<form action="${url}" method="post">
		<label>From:</label> <input type="email" name="from"
			placeholder="bạn@domain.com"><br> <label>To:</label> <input
			type="email" name="to" placeholder="nguoinhan@domain.com"><br>
		<label>Subject:</label><input type="text" name="subject"><br>
		<label>Body:</label>
		<textarea name="body" rows="6" cols="60"></textarea>
		<br>
		<button>Send</button>
	</form>

</body>
</html>
