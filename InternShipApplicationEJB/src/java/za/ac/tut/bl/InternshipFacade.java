/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import za.ac.tut.entity.Internship;

/**
 *
 * @author zenan
 */
@Stateless
public class InternshipFacade extends AbstractFacade<Internship> implements InternshipFacadeLocal {

    @PersistenceContext(unitName = "InternShipApplicationEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public InternshipFacade() {
        super(Internship.class);
    }


    @Override
    public List<Internship> findInternLoc(String loc) {
        Query query = em.createQuery("SELECT i FROM Internship i WHERE i.location = :loc");
        query.setParameter("loc", loc);
        List<Internship> internship = query.getResultList();
        return internship ;
    }

    @Override
    public List<Internship> findInternComp(String comp) {
        Query query = em.createQuery("SELECT i FROM Internship i WHERE i.location = :comp");
        query.setParameter("comp", comp);
        List<Internship> internship = query.getResultList();
        return internship ;
    }
    
}
