package za.ac.tut.web;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import za.ac.tut.bl.InternshipFacadeLocal;
import za.ac.tut.entity.Internship;

public class DeleteInternshipServlet extends HttpServlet {

    @EJB
    private InternshipFacadeLocal internshipFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("internshipId");
        String message;

        try {
            Long internshipId = Long.parseLong(idStr);
            Internship internship = internshipFacade.find(internshipId);

            if (internship != null) {
                internshipFacade.remove(internship);
                message = "Internship deleted successfully.";
            } else {
                message = "Internship not found.";
            }
        } catch (NumberFormatException e) {
            message = "Invalid Internship ID.";
        }

        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("remove_internship.jsp");
        dispatcher.forward(request, response);
    }
}
