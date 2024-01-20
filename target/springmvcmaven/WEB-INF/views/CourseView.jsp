<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Course</title>
</head>
<body>
    <h2>Course Details</h2>
    <c:if test="${errorMessage != null}">
        <p>Error: ${errorMessage}</p>
    </c:if>
    <c:if test="${course != null}">
        <p>ID: ${course.getId()}</p>
        <p>Name: ${course.getName()}</p>
        <p>Description: ${course.getDescription()}</p>
        </c:if>
        <a href="${pageContext.request.contextPath}/courses/">Back to Course List</a>
        
        </body>
        </html>
