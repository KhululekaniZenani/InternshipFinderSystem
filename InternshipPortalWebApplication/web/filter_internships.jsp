<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="za.ac.tut.entity.Company" %>
<!DOCTYPE html>
<html>
<head>
    <title>Filter Internships</title>
    <meta charset="UTF-8">
</head>
<body>

<h1>Filter Internships</h1>

<form method="get" action="FilterInternshipsServlet.do">
    <label for="company">Filter by Company:</label>
    <select name="company" id="company">
        <option value="">All Companies</option>
        <% 
            List<Company> companies = (List<Company>) request.getAttribute("companies");
            if (companies != null) {
                for (Company c : companies) {
        %>
                    <option value="<%= c.getCompanyName() %>"><%= c.getCompanyName() %></option>
        <% 
                }
            }
        %>
    </select>

    <label for="location">Filter by Location:</label>
    <select name="location" id="location">
        <option value="">All Locations</option>
        <% 
            List<String> locations = (List<String>) request.getAttribute("locations");
            if (locations != null) {
                for (String l : locations) {
        %>
                    <option value="<%= l %>"><%= l %></option>
        <% 
                }
            }
        %>
    </select>

    <button type="submit">Apply Filters</button>
</form>

</body>
</html>
