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
        <style>/* same styles */</style>
    </head>
    <body>

        <h2>Your Posted Internships</h2>

        <% if (internships != null && !internships.isEmpty()) { %>
        <table>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Duration</th>
                <th>Location</th>
                <th>Deadline</th>
            </tr>
            <% for (Internship i : internships) {%>
            <tr>
                <td><%= i.getTitle()%></td>
                <td><%= i.getDescription()%></td>
                <td><%= i.getLocation()%></td>
                <td><%= i.getDeadline()%></td>
            </tr>
            <% } %>
        </table>
        <% } else { %>
        <div class="message">You haven’t posted any internships yet.</div>
        <% }%>

    </body>
</html>
