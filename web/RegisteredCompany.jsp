<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Company Registration Confirmation</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 40px;
            text-align: center;
        }

        .confirmation-container {
            background-color: #fff;
            padding: 50px 40px;
            border-radius: 12px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
            display: inline-block;
            margin-top: 100px;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            color: #555;
        }

        .btn-home {
            margin-top: 30px;
            padding: 12px 24px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-home:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="confirmation-container">
    <h1>Company Registered Successfully!</h1>
    <p>Thank you for registering your company with us.</p>
    <a href="index.html" class="btn-home">Return to Home</a>
</div>

</body>
</html>
