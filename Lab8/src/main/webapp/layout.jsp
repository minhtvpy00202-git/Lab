<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.lang}" scope="request" />
<fmt:setBundle basename="i18n.global" scope="request" />
<!DOCTYPE html>
<html>





<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<h1>FPT POLYTECHNIC</h1>
	</header>
	<nav>
		<hr>
		<c:url var="home" value="/home" />
		<a href="${home}/index"><fmt:message key="menu.home" /></a> <a
			href="${home}/about"><fmt:message key="menu.about" /></a> <a
			href="${home}/contact"><fmt:message key="menu.contact" /></a>
			
		<a href="?lang=vi">Tiếng Việt</a>
		<a href="?lang=en">English</a>
	</nav>
	<main>
		<jsp:include page="${view}" />
	</main>
	<footer>
		<hr>
		&copy; 2024 by FPT Polytechnic. All rights resersed.
	</footer>

</body>
</html>