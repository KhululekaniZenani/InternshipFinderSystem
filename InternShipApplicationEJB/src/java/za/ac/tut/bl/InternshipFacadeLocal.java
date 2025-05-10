/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entity.Internship;

/**
 *
 * @author zenan
 */
@Local
public interface InternshipFacadeLocal {

    void create(Internship internship);

    void edit(Internship internship);

    void remove(Internship internship);

    Internship find(Object id);
    
    List<Internship> findInternLoc(String loc);
    
    List<Internship> findInternComp(String comp);
    
    List<Internship> findAll();

    List<Internship> findRange(int[] range);

    int count();
    
}
