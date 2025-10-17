<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Management</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">

</head>
<body>
    <div class="container">
        <h1>Employee Management</h1>
        
        <c:url var="path" value="/employee" />
        
        <!-- FORM -->
        <form method="post" enctype="multipart/form-data">
            <label>ID:</label>
            <input name="id" value="${item.id}">
            
            <label>Password:</label>
            <input type="password" name="password" value="${item.password}">
            
            <label>Full Name:</label>
            <input name="fullname" value="${item.fullname}">
            
            <label>Photo:</label>
            <c:if test="${not empty item.photo}">
                <img src="${pageContext.request.contextPath}/${item.photo}" 
                     alt="avatar" style="height: 60px; border-radius: 4px;">
            </c:if>
            <input type="hidden" name="photo" value="${item.photo}">
            <input type="file" name="photoFile" accept="image/*">
            
            <label>Gender:</label>
            <div class="radio-group">
                <label>
                    <input type="radio" name="gender" value="true" 
                           ${item.gender ? 'checked' : ''}> Male
                </label>
                <label>
                    <input type="radio" name="gender" value="false" 
                           ${!item.gender ? 'checked' : ''}> Female
                </label>
            </div>
            
            <label>Birthday:</label>
            <input type="date" name="birthDay" value="${item.birthDay}">
            
            <label>Salary:</label>
            <input type="number" name="salary" value="${item.salary}">
            
            <label>Department:</label>
            <select name="departmentId">
                <option value="">-- Select Department --</option>
                <c:forEach var="dept" items="${departments}">
                    <option value="${dept.id}" 
                            ${item.departmentId == dept.id ? 'selected' : ''}>
                        ${dept.name}
                    </option>
                </c:forEach>
            </select>
            
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
                    <th>Full Name</th>
                    <th>Gender</th>
                    <th>Birthday</th>
                    <th>Salary</th>
                    <th>Department</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="emp" items="${list}" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${emp.id}</td>
                        <td>${emp.fullname}</td>
                        <td>${emp.gender ? 'Male' : 'Female'}</td>
                        <td>${emp.birthDay}</td>
                        <td>${emp.salary}</td>
                        <td>${emp.departmentId}</td>
                        <td><a href="${path}/edit/${emp.id}">Edit</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>