<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.lang}" scope="request" />
<fmt:setBundle basename="i18n.global" scope="request" />
<!DOCTYPE html>
<html lang="${sessionScope.lang != null ? sessionScope.lang : 'vi'}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FPT Polytechnic - <fmt:message key="menu.home" /></title>
    
    <!-- Minimal CSS as fallback -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/minimal.css">
    <!-- Theme CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/light-theme.css" id="theme-css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme-switcher.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
    
    <!-- Fallback CSS -->
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
        .header-content { max-width: 1200px; margin: 0 auto; padding: 1rem; display: flex; justify-content: space-between; align-items: center; }
        .logo { font-size: 1.5rem; font-weight: bold; text-decoration: none; color: #007bff; }
        nav ul { list-style: none; display: flex; gap: 2rem; margin: 0; padding: 0; }
        nav a { text-decoration: none; color: #333; padding: 0.5rem 1rem; }
        .container { max-width: 1200px; margin: 2rem auto; padding: 0 1rem; }
        .btn { display: inline-block; padding: 0.75rem 1.5rem; background-color: #007bff; color: white; text-decoration: none; border-radius: 4px; }
        .btn-secondary { background-color: #6c757d; }
        footer { text-align: center; padding: 2rem; background-color: #f8f9fa; margin-top: 3rem; }
    </style>
    
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="favicon.ico">
</head>
<body>
    <header>
        <div class="header-content">
            <c:url var="home" value="/home" />
            <a href="${home}/index" class="logo">FPT POLYTECHNIC</a>
            
            <nav>
                <ul>
                    <li><a href="${home}/index"><fmt:message key="menu.home" /></a></li>
                    <li><a href="${home}/about"><fmt:message key="menu.about" /></a></li>
                    <li><a href="${home}/contact"><fmt:message key="menu.contact" /></a></li>
                </ul>
            </nav>
            
            <div class="language-switcher">
                <a href="?lang=vi" class="btn btn-secondary ${sessionScope.lang == 'vi' ? 'active' : ''}">VI</a>
                <a href="?lang=en" class="btn btn-secondary ${sessionScope.lang == 'en' ? 'active' : ''}">EN</a>
            </div>
        </div>
    </header>
    
    <main>
        <div class="container">
            <jsp:include page="${view}" />
        </div>
    </main>
    
    <footer>
        <p>&copy; 2024 by FPT Polytechnic. All rights reserved.</p>
    </footer>

    <!-- Theme Switcher JavaScript -->
    <script>
        // Set context path for JavaScript
        window.contextPath = '${pageContext.request.contextPath}';
        
        // Debug CSS loading
        console.log('Context Path:', window.contextPath);
        console.log('Current URL:', window.location.href);
        
        // Check CSS files after page load
        window.addEventListener('load', function() {
            const cssLinks = document.querySelectorAll('link[rel="stylesheet"]');
            console.log('CSS files loaded:', cssLinks.length);
            cssLinks.forEach((link, index) => {
                console.log(`CSS ${index + 1}:`, link.href);
            });
        });
    </script>
    <script src="${pageContext.request.contextPath}/js/theme-switcher.js"></script>
</body>
</html>