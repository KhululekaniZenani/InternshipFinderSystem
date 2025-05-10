package za.ac.tut.entity;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class Student implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long studentNum;

    private String name;
    private String surname;

    @OneToOne
    @JoinColumn(name = "internship_id", unique = true)
    private Internship internship;

    public Student() {
    }

    public Student(Long studentNum, String name, String surname, Internship internship) {
        this.studentNum = studentNum;
        this.name = name;
        this.surname = surname;
        this.internship = internship;
    }

    // Getters and Setters

    public Long getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(Long studentNum) {
        this.studentNum = studentNum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Internship getInternship() {
        return internship;
    }

    public void setInternship(Internship internship) {
        this.internship = internship;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (studentNum != null ? studentNum.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Student)) {
            return false;
        }
        Student other = (Student) object;
        return (this.studentNum != null || other.studentNum == null) && (this.studentNum == null || this.studentNum.equals(other.studentNum));
    }

    @Override
    public String toString() {
        return "za.ac.tut.entity.Student[ id=" + studentNum + " ]";
    }
}
