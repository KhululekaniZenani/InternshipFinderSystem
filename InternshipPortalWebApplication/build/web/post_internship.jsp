<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String companyName = (String) session.getAttribute("companyName");
    String companyId = (String) session.getAttribute("companyId"); // if you're tracking company by ID
    if (companyName == null) {
        response.sendRedirect("company_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Post Internship - Internship Portal</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px;
        }
        .form-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            width: 500px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            margin-bottom: 25px;
            text-align: center;
            color: #333;
        }
        input[type="text"],
        input[type="date"],
        textarea,
        select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        textarea {
            resize: vertical;
            height: 120px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 14px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .success {
            color: green;
            text-align: center;
            margin-bottom: 15px;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>Post New Internship</h2>

        <% 
            String msg = request.getParameter("msg");
            if ("success".equals(msg)) {
        %>
            <div class="success">Internship posted successfully.</div>
        <% } else if ("error".equals(msg)) { %>
            <div class="error">Error posting internship. Please try again.</div>
        <% } %>

        <form action="PostInternshipServlet.do" method="post">
            <input type="text" name="title" placeholder="Internship Title" required>
            <textarea name="description" placeholder="Internship Description" required></textarea>
            <input type="text" name="duration" placeholder="Duration (e.g., 3 months)" required>
            <select name="location" required>
                <option value="">-- Select Location --</option>
                <option value="Johannesburg">Johannesburg</option>
                <option value="Cape Town">Cape Town</option>
                <option value="Durban">Durban</option>
                <option value="Pretoria">Pretoria</option>
                <option value="Bloemfontein">Bloemfontein</option>
            </select>
            <input type="date" name="deadline" placeholder="Application Deadline" required>

            <input type="submit" value="Post Internship">
        </form>
    </div>

</body>
</html>
