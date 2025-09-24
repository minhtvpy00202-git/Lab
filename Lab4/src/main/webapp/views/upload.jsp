<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload</title>

</head>
<body>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:url value="/upload" var="url" />
<form action="${url}" method="post" enctype="multipart/form-data">
	<input name="photo" type="file"><br>
	<button>Upload</button>
</form>
</body>
</html>