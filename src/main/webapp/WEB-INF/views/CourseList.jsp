<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Course List</title>
</head>
<body>
    <h2>Course List</h2>
    <form action="${pageContext.request.contextPath}/courses/add" method="post">
        <button type="submit">Add New Course</button>
    </form>
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
                    <form action="${pageContext.request.contextPath}/courses/edit/${course.id}" method="post">
                        <input type="hidden" name="courseId" value="${course.id}">
                        <td>${course.getId()}</td>
                        <td>${course.getName()}</td>
                        <td>${course.getDescription()}</td>
                        <td>
                            <button type="submit">Edit</button>
                            |
                            <a href="${pageContext.request.contextPath}/courses/delete/${course.id}" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </form>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
