<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>URL Info</title>
    <style>
        body{font-family:Arial, sans-serif} table{border-collapse:collapse}
        th,td{border:1px solid #ccc;padding:8px}
    </style>
</head>
<body>
<h2>Thông tin địa chỉ URL</h2>
<table>
    <tr><th>#</th><th>Thuộc tính</th><th>Giá trị</th></tr>
    <tr><td>1</td><td>URL</td><td>${url}</td></tr>
    <tr><td>2</td><td>URI</td><td>${uri}</td></tr>
    <tr><td>3</td><td>QueryString</td><td>${query}</td></tr>
    <tr><td>4</td><td>ServletPath</td><td>${servletPath}</td></tr>
    <tr><td>5</td><td>ContextPath</td><td>${contextPath}</td></tr>
    <tr><td>6</td><td>PathInfo</td><td>${pathInfo}</td></tr>
    <tr><td>7</td><td>Method</td><td>${method}</td></tr>
</table>
</body>
</html>
