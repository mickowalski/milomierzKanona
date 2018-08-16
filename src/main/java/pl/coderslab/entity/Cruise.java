package pl.coderslab.entity;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "cruises")
public class Cruise {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    @Size(max = 50, message = "Nazwa rejsu nie może mieć więcej niż {max} znaków")
    @Column(length = 50, nullable = false)
    private String name;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date start;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date end;
    private String yacht;
    @Max(20)
    private Integer maxPpl;
    @Column(name = "description")
    private String yachtDesc;
    private boolean archive;

    @OneToMany(mappedBy = "cruise")
    private List<Details> details;

    public Cruise() {
        archive = false;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public String getYacht() {
        return yacht;
    }

    public void setYacht(String yacht) {
        this.yacht = yacht;
    }

    public Integer getMaxPpl() {
        return maxPpl;
    }

    public void setMaxPpl(Integer maxPpl) {
        this.maxPpl = maxPpl;
    }

    public String getYachtDesc() {
        return yachtDesc;
    }

    public void setYachtDesc(String yachtDesc) {
        this.yachtDesc = yachtDesc;
    }

    public boolean isArchive() {
        return archive;
    }

    public void setArchive(boolean archive) {
        this.archive = archive;
    }

    public List<Details> getDetails() {
        return details;
    }

    public void setDetails(List<Details> details) {
        this.details = details;
    }
}
