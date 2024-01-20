<%@ page import="my.utm.ip.spring_jdbc.entity.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language = "java"%>
<html>
<head>
    <title>Add/Edit Course</title>
</head>
<body>
    <%
        Course course = (Course) request.getAttribute("course");
        boolean isEdit = course != null;
    %>
    <h2><%= isEdit ? "Edit Course" : "Add New Course" %></h2>

<form action="<%= isEdit ? " update " : " insert " %>" method="post">
    <% if (isEdit) { %>
        <input type="hidden" name="id" value="<%= course.getId() %>" />
    <% } %>
    <p>
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" value="<%= isEdit ? course.getName() : "" %>" required>
    </p>
    <p>
        <label for="description">Description:</label>
        <textarea name="description" id="description" required><%= isEdit ? course.getDescription() : "" %></textarea>
    </p>
    <p>
        <input type="submit" value="<%= isEdit ? "Update" : "Add" %> Course">
    </p>
</form>

<a href="list">Back to Course List</a>
</body>
</html>
