<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Course</title>
</head>
<body>
<h2>Add New Course</h2>
<form action="saveCourse" method="post">
    <div>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name">
    </div>
    <div>
        <label for="desc">Description:</label>
        <textarea id="desc" name="description"></textarea>
    </div>
    <div>
        <input type="submit" value="Add Course">
    </div>
</form>
<a href="courses">Back to List</a>
</body>
</html>
