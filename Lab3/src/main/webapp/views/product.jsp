<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1 {
		color: tomato;
		background-color: black;
		text-align: center
	}
	
	ul{
	border: 1px solid black;
	text-align: center;
	list-style-type: none;
	margin: 0;
	padding: 0
	}
	
	.list  {
		width:  20%;
		margin: 0 auto;
	}

</style>
</head>
<body>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<h1>THÔNG TIN SẢN PHẨM</h1>

<div class="list">
<ul>
	<li><strong>Name:</strong> ${item.name}</li>
	<li><strong>Price:</strong>
	<fmt:formatNumber value="${item.price}" pattern="#,###.00"/>
	</li>
	<li><strong>Date:</strong>
	<fmt:formatDate value="${item.date}" pattern="MMM dd, yyyy"/>
	</li>
</div>
</ul>
</body>
</html>