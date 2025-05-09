<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Filtered Internships</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .internship-list {
            list-style: none;
            padding: 0;
        }

        .internship-item {
            border: 1px solid #ddd;
            border-radius: 8px;
            margin: 10px 0;
            padding: 15px;
            background-color: #f9f9f9;
            transition: background-color 0.3s ease;
        }

        .internship-item:hover {
            background-color: #eef2f5;
        }

        .internship-title {
            font-size: 1.2em;
            color: #007BFF;
            margin-bottom: 5px;
        }

        .internship-details {
            font-size: 1em;
            color: #555;
        }

        .internship-company, .internship-location {
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Filtered Internships</h1>
    
    <ul class="internship-list">
        <% 
            List<Internship> internships = (List<Internship>) request.getAttribute("internships");
            if (internships != null && !internships.isEmpty()) {
                for (Internship internship : internships) {
        %>
                    <li class="internship-item">
                        <div class="internship-title"><%= internship.getTitle() %></div>
                        <div class="internship-details">
                            <span class="internship-company">Company: <%= internship.getCompany().getCompanyName() %></span><br>
                            <span class="internship-location">Location: <%= internship.getLocation() %></span>
                        </div>
                    </li>
        <% 
                }
            } else {
        %>
                <p>No internships found based on the selected filter.</p>
        <% 
            }
        %>
    </ul>

</div>

</body>
</html>

