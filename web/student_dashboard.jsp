<%@ page import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Internship Portal - Student Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            background: #f0f2f5;
            text-align: center;
        }
        h1 {
            color: #333;
        }
        .button {
            display: inline-block;
            margin: 10px;
            padding: 12px 25px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .dashboard-container {
            margin-top: 30px;
        }
        .info-card {
            display: inline-block;
            padding: 20px;
            margin: 15px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 300px;
            text-align: left;
        }
        .info-card h3 {
            color: #007BFF;
        }
        .info-card p {
            font-size: 14px;
            color: #333;
        }
    </style>
</head>
<body>

    <h1>Welcome to the Student Dashboard!</h1>
    <p>Explore available internships posted by companies.</p>

    <div class="dashboard-container">
        <!-- Available Internships Section -->
        <div class="info-card">
            <h3>Available Internships</h3>
            <p>Browse and apply for internships posted by companies.</p>
            <a href="filter_internships.jsp" class="button">Filter Internships</a>
            <a href="student_view_internships.jsp" class="button"> view Internships </a>
        </div>

    </div>

</body>
</html>
