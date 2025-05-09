<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="za.ac.tut.entity.Internship" %>
<%@ page import="java.util.List" %>

<%
    List<Internship> internships = (List<Internship>) request.getAttribute("internships");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Your Posted Internships</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 40px;
            text-align: center;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 30px;
        }

        table {
            margin: auto;
            border-collapse: collapse;
            width: 90%;
            max-width: 1000px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 16px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .message {
            margin-top: 20px;
            font-size: 16px;
            color: #555;
        }
    </style>
</head>
<body>

<h2>Your Posted Internships</h2>

<% if (internships != null && !internships.isEmpty()) { %>
    <table>
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Location</th>
            <th>Deadline</th>
        </tr>
        <% for (Internship i : internships) { %>
            <tr>
                <td><%= i.getTitle() %></td>
                <td><%= i.getDescription() %></td>
                <td><%= i.getLocation() %></td>
                <td><%= i.getDeadline() %></td>
            </tr>
        <% } %>
    </table>
<% } else { %>
    <div class="message">There are no posted any internships yet.</div>
<% } %>

</body>
</html>
