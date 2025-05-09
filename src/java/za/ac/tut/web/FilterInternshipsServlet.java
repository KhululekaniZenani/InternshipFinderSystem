package za.ac.tut.web;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import za.ac.tut.bl.InternshipFacadeLocal;
import za.ac.tut.entity.Internship;

public class FilterInternshipsServlet extends HttpServlet {

    @EJB
    private InternshipFacadeLocal ifl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve the selected filter option from the form
        String filterBy = request.getParameter("filterBy");
        String location = request.getParameter("location");
        List<Internship> internships = null;

        // Determine which filter to apply based on the selected radio button
        if ("company".equalsIgnoreCase(filterBy)) {
            internships = ifl.findInternComp("");
        } else if ("location".equalsIgnoreCase(filterBy)) {
            internships = ifl.findInternLoc(location);
        }

        // Set the filtered internships as a request attribute
        request.setAttribute("internships", internships);

        // Forward the request to the JSP page for displaying the results
        RequestDispatcher dispatcher = request.getRequestDispatcher("filtered_internships.jsp");
        dispatcher.forward(request, response);
    }
}
