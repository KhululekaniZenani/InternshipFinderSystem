<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="za.ac.tut.entity.Internship" %>

<%
    List<String> companies = (List<String>) request.getAttribute("companies");
    List<String> locations = (List<String>) request.getAttribute("locations");
    List<Internship> internships = (List<Internship>) request.getAttribute("internships");
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Internships</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 50px 40px;
            border-radius: 12px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 90%;
            max-width: 600px;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .btn-container {
            margin-top: 20px;
        }

        .view-button {
            background-color: #007BFF;
            color: white;
            padding: 14px 28px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .view-button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        #infoBox {
            margin-top: 20px;
            font-size: 14px;
            color: #444;
            opacity: 0;
            transition: opacity 0.4s ease;
        }

        #infoBox.show {
            opacity: 1;
        }
    </style>

    <script>
        function showInfo() {
            const infoBox = document.getElementById("infoBox");
            infoBox.textContent = "Loading internship opportunities...";
            infoBox.classList.add("show");

            // Optional: delay form submission to show feedback
            setTimeout(() => {
                document.getElementById("internshipForm").submit();
            }, 1000); // 1 second delay
            return false; // prevent immediate submit
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Explore Internship Opportunities</h1>

        <form id="internshipForm" action="ViewInternshipsServlet.do" method="POST" onsubmit="return showInfo();">
            <div class="btn-container">
                <input type="submit" value="VIEW INTERNSHIPS" class="view-button">
            </div>
        </form>

        <div id="infoBox"></div>
    </div>
</body>
</html>
