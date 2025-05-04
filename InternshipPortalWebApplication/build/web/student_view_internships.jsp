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
        body { font-family: Arial; padding: 40px; background: #f0f2f5; text-align: center; }
        h1 { color: #333; }
        .filter-form { margin-bottom: 30px; }
        select, .filter-form button { padding: 8px 12px; margin: 5px; }
        .internship-list { display: flex; flex-wrap: wrap; justify-content: center; }
        .internship-card {
            background: white; border: 1px solid #ddd; border-radius: 8px;
            padding: 20px; margin: 15px; width: 300px; box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
            text-align: left;
        }
        .internship-card h3 { color: #007BFF; }
        .internship-card p { font-size: 14px; color: #333; }
    </style>
</head>
<body>

<h1>Available Internship Opportunities</h1>

<form method="get" action="ViewInternshipsServlet" class="filter-form">
    <label for="company">Filter by Company:</label>
    <select name="company" id="company">
        <option value="">All Companies</option>
        <% for (String c : companies) { %>
            <option value="<%= c %>" <%= c.equals(request.getParameter("company")) ? "selected" : "" %>><%= c %></option>
        <% } %>
    </select>

    <label for="location">Filter by Location:</label>
    <select name="location" id="location">
        <option value="">All Locations</option>
        <% for (String l : locations) { %>
            <option value="<%= l %>" <%= l.equals(request.getParameter("location")) ? "selected" : "" %>><%= l %></option>
        <% } %>
    </select>

    <button type="submit">Apply Filters</button>
</form>

<div class="internship-list">
    <% if (internships != null && !internships.isEmpty()) {
        for (Internship i : internships) { %>
            <div class="internship-card">
                <h3><%= i.getTitle() %></h3>
                <p><strong>Company:</strong> <%= i.getCompany().getCompanyName() %></p>
                <p><strong>Location:</strong> <%= i.getLocation() %></p>
                <p><strong>Description:</strong> <%= i.getDescription() %></p>
                <p><strong>Deadline:</strong> <%= i.getDeadline() %></p>
            </div>
    <%  }
       } else { %>
        <p>No internships found with the selected filters.</p>
    <% } %>
</div>

</body>
</html>
