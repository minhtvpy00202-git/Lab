<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>CRUD Demo</title>
    <style>
        body{font-family: Arial, sans-serif; margin:24px}
        a{display:block; margin:6px 0}
        .msg{padding:12px; border:1px solid #ccc; background:#f8f8f8}
    </style>
</head>
<body>
<h2>CRUD Servlet – Many URL Mapping</h2>

<div class="msg">${message}</div>

<h3>Thử nhanh</h3>
<% String ctx = request.getContextPath(); %>
<a href="<%=ctx%>/crud/create">/crud/create</a>
<a href="<%=ctx%>/crud/update">/crud/update</a>
<a href="<%=ctx%>/crud/delete">/crud/delete</a>
<a href="<%=ctx%>/crud/edit/2024">/crud/edit/2024</a>
<a href="<%=ctx%>/crud/edit/TeoNV">/crud/edit/TeoNV</a>

</body>
</html>
