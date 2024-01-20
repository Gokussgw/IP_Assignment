<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Course List</title>
</head>
<body>
    <h2>Course List</h2>
    <a href="${pageContext.request.contextPath}/courses/add">Add New Course</a>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="course" items="${courses}">
                <tr>
                    <td>${course.id}</td>
                    <td>${course.name}</td>
                    <td>${course.description}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/courses/edit/${course.id}">Edit</a>
                        |
                        <a href="${pageContext.request.contextPath}/courses/delete/${course.id}" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
