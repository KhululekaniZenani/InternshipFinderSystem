package za.ac.tut.web;


import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.entity.Internship;

@WebServlet("/posted-internships")
public class PostedInternshipsServlet extends HttpServlet {

    @PersistenceContext
    private EntityManager em;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String companyIdStr = (String) request.getSession().getAttribute("companyId");
        if (companyIdStr == null) {
            response.sendRedirect("company_login.jsp");
            return;
        }

        Long companyId = Long.parseLong(companyIdStr);
        List<Internship> internships = em.createQuery(
            "SELECT i FROM Internship i WHERE i.company.id = :companyId", Internship.class)
            .setParameter("companyId", companyId)
            .getResultList();

        request.setAttribute("internships", internships);
        request.getRequestDispatcher("view_posted_internships.jsp").forward(request, response);
    }
}
