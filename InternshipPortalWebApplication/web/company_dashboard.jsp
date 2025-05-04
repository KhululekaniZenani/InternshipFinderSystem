<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String companyName = (String) session.getAttribute("companyName");
    if (companyName == null) {
        response.sendRedirect("company_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Company Dashboard - Internship Portal</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #007BFF;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            padding: 40px;
            text-align: center;
        }
        h2 {
            color: #333;
        }
        .button {
            display: inline-block;
            margin: 20px;
            padding: 14px 30px;
            background-color: #007BFF;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            font-size: 16px;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Welcome, <%= companyName %></h1>
    </div>

    <div class="container">
        <h2>Company Dashboard</h2>
        <p>Manage your internships and company information.</p>

        <a href="post_internship.jsp" class="button">Post New Internship</a>
        <a href="view_posted_internships.jsp" class="button">View Posted Internships</a>
        <a href="../logout.jsp" class="button">Logout</a>
    </div>

</body>
</html>
