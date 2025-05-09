/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.bl.InternshipFacadeLocal;
import za.ac.tut.entity.Internship;

/**
 *
 * @author uviwe
 */
public class viewCompInternshipServlet extends HttpServlet {
    @EJB
    private InternshipFacadeLocal ifl ;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
               
        List<Internship> internships = ifl.findAll();
        
        request.setAttribute("internships", internships);
        request.getRequestDispatcher("view_posted_internships.jsp").forward(request, response);
    }

}
