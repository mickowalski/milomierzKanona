package pl.coderslab.entity;

import javax.persistence.*;
import javax.validation.constraints.Max;

@Entity
@Table(name = "cruise_details")
public class Details {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer miles;
    @Column(precision = 8, scale = 2)
    private Double price;
    @Column(precision = 8, scale = 2)
    private Double paid;
    @Max(20)
    private Integer curPpl;

    @ManyToOne
    private Customer customer;

    @ManyToOne
    private Cruise cruise;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getMiles() {
        return miles;
    }

    public void setMiles(Integer miles) {
        this.miles = miles;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getPaid() {
        return paid;
    }

    public void setPaid(Double paid) {
        this.paid = paid;
    }

    public Integer getCurPpl() {
        return curPpl;
    }

    public void setCurPpl(Integer curPpl) {
        this.curPpl = curPpl;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Cruise getCruise() {
        return cruise;
    }

    public void setCruise(Cruise cruise) {
        this.cruise = cruise;
    }
}
