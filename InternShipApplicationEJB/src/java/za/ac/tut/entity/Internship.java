package za.ac.tut.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
public class Internship implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long internshipId;

    private String title;
    private String description;
    private String category;
    private String location;

    @Temporal(TemporalType.DATE)
    private Date deadline;

    @ManyToOne
    @JoinColumn(name = "company_id", nullable = false)
    private Company company;

    public Internship() {
    }

    public Internship(Long internshipId, String title, String description, String category, String location, Date deadline, Company company) {
        this.internshipId = internshipId;
        this.title = title;
        this.description = description;
        this.category = category;
        this.location = location;
        this.deadline = deadline;
        this.company = company;
    }

    public Long getInternshipId() {
        return internshipId;
    }

    public void setInternshipId(Long internshipId) {
        this.internshipId = internshipId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (internshipId != null ? internshipId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Internship)) {
            return false;
        }
        Internship other = (Internship) object;
        return !((this.internshipId == null && other.internshipId != null) || (this.internshipId != null && !this.internshipId.equals(other.internshipId)));
    }

    @Override
    public String toString() {
        return "za.ac.tut.entity.Internship[ id=" + internshipId + " ]";
    }
}
