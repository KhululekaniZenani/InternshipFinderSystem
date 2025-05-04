<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="za.ac.tut.entity.Internship" %>
<!DOCTYPE html>
<html>
<head>
    <title>Internship Results</title>
    <meta charset="UTF-8">
</head>
<body>

<h1>Filtered Internship Listings</h1>

<table border="1">
    <thead>
        <tr>
            <th>Internship Title</th>
            <th>Company</th>
            <th>Location</th>
            <th>Deadline</th>
        </tr>
    </thead>
    <tbody>
        <% 
        List<Internship> internships = (List<Internship>) request.getAttribute("internships");
        if (internships != null && !internships.isEmpty()) {
            for (Internship internship : internships) {
        %>
                <tr>
                    <td><%= internship.getTitle() %></td>
                    <td><%= internship.getCompany().getCompanyName() %></td>
                    <td><%= internship.getLocation() %></td>
                    <td><%= internship.getDeadline() %></td>
                </tr>
        <% 
            }
        } else {
        %>
            <tr>
                <td colspan="4">No internships found matching the selected filters.</td>
            </tr>
        <% } %>
    </tbody>
</table>

<a href="filter_internships.jsp">Back to Filter</a>

</body>
</html>
