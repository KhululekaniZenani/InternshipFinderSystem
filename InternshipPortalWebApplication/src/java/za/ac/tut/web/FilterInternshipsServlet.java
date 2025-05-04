package za.ac.tut.web;

import za.ac.tut.entity.Company;
import za.ac.tut.entity.Internship;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class FilterInternshipsServlet extends HttpServlet {

    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get filter parameters
        String companyFilter = request.getParameter("company");
        String locationFilter = request.getParameter("location");

        EntityManager em = emf.createEntityManager();

        // Build query based on the filters
        String queryString = "SELECT i FROM Internship i WHERE 1=1";

        if (companyFilter != null && !companyFilter.isEmpty()) {
            queryString += " AND i.company.companyName = :company";
        }
        if (locationFilter != null && !locationFilter.isEmpty()) {
            queryString += " AND i.location = :location";
        }

        TypedQuery<Internship> query = em.createQuery(queryString, Internship.class);

        if (companyFilter != null && !companyFilter.isEmpty()) {
            query.setParameter("company", companyFilter);
        }
        if (locationFilter != null && !locationFilter.isEmpty()) {
            query.setParameter("location", locationFilter);
        }

        List<Internship> internships = query.getResultList();

        // Get all companies and locations for dropdown filters
        List<Company> companies = em.createQuery("SELECT c FROM Company c", Company.class).getResultList();
        List<String> locations = em.createQuery("SELECT DISTINCT i.location FROM Internship i", String.class).getResultList();

        em.close();

        // Set attributes for forwarding to the result page
        request.setAttribute("internships", internships);
        request.setAttribute("companies", companies);
        request.setAttribute("locations", locations);

        // Forward to the result page
        RequestDispatcher dispatcher = request.getRequestDispatcher("internship_results.jsp");
        dispatcher.forward(request, response);
    }
}
