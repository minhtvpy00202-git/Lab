<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Debug CSS</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .debug-info { background: #f0f0f0; padding: 15px; margin: 10px 0; border-radius: 5px; }
        .css-test { background: red; color: white; padding: 10px; margin: 10px 0; }
    </style>
    
    <!-- Test CSS Loading -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/test.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/light-theme.css" id="theme-css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
</head>
<body>
    <h1>Debug CSS Loading</h1>
    
    <div class="debug-info">
        <h3>Context Path Information:</h3>
        <p><strong>Context Path:</strong> ${pageContext.request.contextPath}</p>
        <p><strong>Request URI:</strong> ${pageContext.request.requestURI}</p>
        <p><strong>Server Name:</strong> ${pageContext.request.serverName}</p>
        <p><strong>Server Port:</strong> ${pageContext.request.serverPort}</p>
    </div>
    
    <div class="debug-info">
        <h3>CSS File Paths:</h3>
        <p><strong>Light Theme:</strong> ${pageContext.request.contextPath}/css/light-theme.css</p>
        <p><strong>Components:</strong> ${pageContext.request.contextPath}/css/components.css</p>
    </div>
    
    <div class="css-test">
        <p>This should be RED if only inline CSS works</p>
    </div>
    
    <div class="container">
        <div class="card">
            <h3>CSS Test Card</h3>
            <p>If this card has proper styling (background, border, padding), then CSS is working!</p>
            <a href="#" class="btn">Test Button</a>
            <a href="#" class="btn btn-secondary">Secondary Button</a>
        </div>
    </div>
    
    <script>
        // Check if CSS files are loaded
        function checkCSSLoaded() {
            const links = document.querySelectorAll('link[rel="stylesheet"]');
            console.log('CSS Links found:', links.length);
            
            links.forEach((link, index) => {
                console.log(`Link ${index + 1}:`, link.href);
                
                // Try to access the stylesheet
                try {
                    if (link.sheet) {
                        console.log(`Stylesheet ${index + 1} loaded successfully with ${link.sheet.cssRules.length} rules`);
                    } else {
                        console.log(`Stylesheet ${index + 1} not loaded or accessible`);
                    }
                } catch (e) {
                    console.log(`Error accessing stylesheet ${index + 1}:`, e.message);
                }
            });
        }
        
        // Check when page loads
        window.addEventListener('load', checkCSSLoaded);
        
        // Also check immediately
        setTimeout(checkCSSLoaded, 1000);
    </script>
</body>
</html>