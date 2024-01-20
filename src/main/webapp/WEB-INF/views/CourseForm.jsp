<%@ page import="my.utm.ip.spring_jdbc.entity.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>
        <c:choose>
            <c:when test="${not empty course}">Edit Course</c:when>
            <c:otherwise>Add New Course</c:otherwise>
        </c:choose>
    </title>
</head>
<body>
    <h2>
        <c:choose>
            <c:when test="${not empty course}">Edit Course</c:when>
            <c:otherwise>Add New Course</c:otherwise>
        </c:choose>
    </h2>

    <form action="${pageContext.request.contextPath}/courses/save" method="post">
        <c:if test="${not empty course}">
            <input type="hidden" name="id" id="id" value="${course.id}" />
        </c:if>
        <!-- Add a hidden input field to specify the action -->
        <input type="hidden" name="action" value="${action}" />
        <p>
            <label for="name">Name:</label>
            <input type="text" name="name" id="name" value="${not empty course ? course.name : ''}" required>
        </p>
        <p>
            <label for="description">Description:</label>
            <textarea name="description" id="description" required>${not empty course ? course.description : ''}</textarea>
        </p>
        <p>
            <input type="submit" value="<c:choose><c:when test="${not empty course}">Update</c:when><c:otherwise>Add</c:otherwise></c:choose> Course">
        </p>
    </form>

    <a href="${pageContext.request.contextPath}/courses/">Back to Course List</a>
</body>
</html>
