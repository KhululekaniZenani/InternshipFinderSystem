package za.ac.tut.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import za.ac.tut.entity.Company;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-04T17:41:48")
@StaticMetamodel(Internship.class)
public class Internship_ { 

    public static volatile SingularAttribute<Internship, String> description;
    public static volatile SingularAttribute<Internship, String> location;
    public static volatile SingularAttribute<Internship, Company> company;
    public static volatile SingularAttribute<Internship, String> title;
    public static volatile SingularAttribute<Internship, String> category;
    public static volatile SingularAttribute<Internship, Date> deadline;
    public static volatile SingularAttribute<Internship, Long> internshipId;

}