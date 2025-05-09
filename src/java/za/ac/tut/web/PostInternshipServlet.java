package za.ac.tut.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;
import za.ac.tut.entity.Company;
import za.ac.tut.entity.Internship;

public class PostInternshipServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        String deadlineStr = request.getParameter("deadline");

        // Parse the deadline date
        Date deadline = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            deadline = sdf.parse(deadlineStr);
        } catch (Exception e) {
            // Handle parsing error
            e.printStackTrace();
        }

        // Retrieve the company from the session
        HttpSession session = request.getSession(false);
        Company company = null;
        if (session != null) {
            company = (Company) session.getAttribute("company");
        }

        // Create an Internship object
        Internship internship = new Internship();
        internship.setTitle(title);
        internship.setDescription(description);
        internship.setLocation(location);
        internship.setDeadline(deadline);
        internship.setCompany(company);

        // Here, you would typically save the internship to the database
        // For simplicity, we'll skip the database operations

        // Set the internship object as a request attribute
        request.setAttribute("internship", internship);

        // Forward the request to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("company_dashboard.jsp");
        dispatcher.forward(request, response);
    }
}
