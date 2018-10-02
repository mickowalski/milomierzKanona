package pl.coderslab.entity;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name = "customers")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    @Size(max = 50)
    @Column(nullable = false, length = 50)
    private String firstName;
    @NotBlank
    @Size(max = 50)
    @Column(nullable = false, length = 50)
    private String lastName;
    private String pesel;
    private String street;
    private String zipCode;
    private String city;
    @NotBlank
    @Email
    @Column(nullable = false, unique = true)
    private String email;
    private String phone;
    private String shirt;
    private Boolean mailingList;
    private Boolean smsAgreement;
    private Integer rankingChange;
    private Integer prvRanking;
    private Integer curRanking;

    @OneToMany(mappedBy = "customer")
    private List<Details> details;

    public Customer() {
        smsAgreement = false;
        mailingList = false;
        rankingChange = 0;
    }

    public String getFullName() {
        return firstName + " " + lastName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPesel() {
        return pesel;
    }

    public void setPesel(String pesel) {
        this.pesel = pesel;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getShirt() {
        return shirt;
    }

    public void setShirt(String shirt) {
        this.shirt = shirt;
    }

    public List<Details> getDetails() {
        return details;
    }

    public void setDetails(List<Details> details) {
        this.details = details;
    }

    public Boolean getMailingList() {
        return mailingList;
    }

    public void setMailingList(Boolean mailingList) {
        this.mailingList = mailingList;
    }

    public Boolean getPhoneagree() {
        return smsAgreement;
    }

    public void setPhoneagree(Boolean phoneagree) {
        this.smsAgreement = phoneagree;
    }

    public Boolean getSmsAgreement() {
        return smsAgreement;
    }

    public void setSmsAgreement(Boolean phoneAgreement) {
        this.smsAgreement = phoneAgreement;
    }

    public Integer getRankingChange() {
        return rankingChange;
    }

    public void setRankingChange(Integer rankingChange) {
        this.rankingChange = rankingChange;
    }

    public Integer getPrvRanking() {
        return prvRanking;
    }

    public void setPrvRanking(Integer prvRanking) {
        this.prvRanking = prvRanking;
    }

    public Integer getCurRanking() {
        return curRanking;
    }

    public void setCurRanking(Integer curRanking) {
        this.curRanking = curRanking;
    }
}
