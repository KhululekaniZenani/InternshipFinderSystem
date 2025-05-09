package za.ac.tut.web;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import za.ac.tut.bl.CompanyFacadeLocal;
import za.ac.tut.entity.Company;

public class CompanyRegisterServlet extends HttpServlet {

    @EJB
    private CompanyFacadeLocal cfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String idStr = request.getParameter("companyID");
        Long id = Long.parseLong(idStr);
        String companyName = request.getParameter("companyName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String location = request.getParameter("location");

        // Create and persist the Company object
        Company company = new Company(id, companyName, location, email, password);
        cfl.create(company);

        // Store the company object in the session
        HttpSession session = request.getSession();
        session.setAttribute("company", company);

        // Forward to the confirmation JSP page
        request.getRequestDispatcher("RegisteredCompany.jsp").forward(request, response);
    }
}
