<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Company Access - Internship Portal</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            text-align: center;
            padding: 60px;
        }
        h1 {
            color: #333;
        }
        .button {
            display: inline-block;
            margin: 15px;
            padding: 15px 30px;
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

    <h1>Company Access Panel</h1>
    <p>If you're a company looking to post internships, please login or register below.</p>

    <div>
        <a href="company_login.jsp" class="button">Company Login</a>
        <a href="company_register.jsp" class="button">Company Register</a>
    </div>

</body>
</html>
