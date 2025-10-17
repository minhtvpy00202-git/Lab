<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="ftm"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Department Management</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">

</head>
<body>
    <div class="container">
        <h1>Department Management</h1>
        
        <c:url var="path" value="/department" />
        
        <!-- FORM -->
        <form method="post">
            <label>ID:</label>
            <input name="id" value="${item.id}">
            
            <label>Name:</label>
            <input name="name" value="${item.name}">
            
            <label>Description:</label>
            <textarea name="description" rows="3">${item.description}</textarea>
            
            <div class="mt-20">
                <button formaction="${path}/create">Create</button>
                <button formaction="${path}/update">Update</button>
                <button formaction="${path}/delete">Delete</button>
                <button formaction="${path}/reset">Reset</button>
            </div>
        </form>
        
        <!-- TABLE -->
        <table>
            <thead>
                <tr>
                    <th>No.</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="d" items="${list}" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${d.id}</td>
                        <td>${d.name}</td>
                        <td>${d.description}</td>
                        <td><a href="${path}/edit/${d.id}">Edit</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>