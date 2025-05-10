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
        Company company = null;
        

        
        for(Company cmp : companies){
            if(email.equalsIgnoreCase(cmp.getEmail()) && password.equals(cmp.getPassword())){
                company = cmp;
                
                
                break; 
            }
        }
        
        RequestDispatcher disp;
        if(company != null){
            HttpSession session = request.getSession();
            session.setAttribute("companyName", company.getCompanyName());
            disp = request.getRequestDispatcher("company_dashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid login credentials. Please try again");
            disp = request.getRequestDispatcher("company_login.jsp");
        }
        
        disp.forward(request, response);
    }
}
