<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bản Tin</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 20px;
    }

    h1 {
        text-align: center;
        color: white;
        background-color: tomato;
        padding: 15px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }

    .card {
        max-width: 800px;
        margin: 30px auto;
        background: white;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        padding: 20px;
    }

    .card p {
        line-height: 1.6;
        text-align: center;
        font-size: 20px;
    }

    .btn {
        display: inline-block;
        margin-top: 10px;
        padding: 8px 15px;
        background: tomato;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
    }

    .btn:hover {
        background: #e5533d;
    }
    
    #content {
    	text-align: justify;
    	white-space: pre-line;
    }
</style>
</head>
<body>

<h1>BẢN TIN</h1>

<div class="card">
    <p><strong>Title:</strong> ${fn:toUpperCase(news.title)}</p>
    <p id="content">
        <c:choose>
            <c:when test="${fn:length(news.content) > 100}">
                ${fn:substring(news.content, 0, 100)}...
            </c:when>
            <c:otherwise>
                ${news.content}
            </c:otherwise>
        </c:choose>
    </p>
    
    <div id="fullContent" style="display:none";>
    	<c:out value="${news.content}" />
    </div>
    
    <c:if test="${fn:length(news.content) > 100}">
    	<button class="btn" onclick="showFull(this)">Click to read more</button>
    </c:if>
    
</div>

<script>
    function showFull(btn) {
        var full = document.getElementById('fullContent').textContent;
        var target = document.getElementById('content');
        target.textContent = full;
        btn.remove();
    }
</script>

</body>
</html>
