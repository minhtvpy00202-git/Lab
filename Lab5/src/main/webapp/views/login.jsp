<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/login" method="post">
	<label>User Name:</label><input name="username" value="${username}"><br>
	<label>Password: </label><input type="password" name="password" value="${password}"><br>
	<input type="checkbox" name="remember-me">Remember me?
	<hr>
	<button>Login</button>
</form>
${message}
</body>
</html>