package za.ac.tut.web;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import za.ac.tut.bl.CompanyFacadeLocal;
import za.ac.tut.entity.Company;
import java.util.List;

public class ComponyLogin extends HttpServlet {

    @EJB
    private CompanyFacadeLocal cfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Retrieve email and password from the request
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Fetch all companies from the database
        List<Company> companies = cfl.findAll();

        // Check if the provided credentials match any company
        for (Company company : companies) {
            if (company.getEmail().equalsIgnoreCase(email) && company.getPassword().equals(password)) {
                // Credentials are valid; forward to the dashboard
                request.setAttribute("company", company);
                RequestDispatcher dispatcher = request.getRequestDispatcher("company_dashboard.jsp");
                dispatcher.forward(request, response);
                return;
            }
        }

        // Credentials are invalid; forward back to the login page with an error message
        request.setAttribute("error", "Invalid email or password. Please try again.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("company_login.jsp");
        dispatcher.forward(request, response);
    }
}
