<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Remove Internship</title>
</head>
<body>
    <h2>Delete Internship</h2>
    
    <form action="DeleteInternshipServlet.do" method="post">
        <label for="internshipId">Internship ID:</label>
        <input type="number" id="internshipId" name="internshipId" required>
        <input type="submit" value="Delete">
    </form>

    <% 
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
        <p><%= message %></p>
    <% 
        } 
    %>
</body>
</html>
