package com.startup.project.entities;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by Sonik on 13.09.2017.
 */
@Entity
@Table(name = "startups")
public class Startup {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "STATUP_NAME")
    private String startupName;
    @Column(name = "DESCRIPTION")
    private String description;
    @Column(name = "IDEA")
    private String idea;
    @Column(name = "INDUSTRY")
    private String industry;
    @Column(name = "COUNTRY")
    private String country;
    @Column(name = "PROJECT_STAGE")
    private String projectStage;
    @Column(name = "STARTUP_COST")
    private BigDecimal startupCost;
    @Column(name = "TIME", insertable = false)
    private Timestamp time;
    @ManyToOne
    private User ownerUser;
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.REFRESH)
    @JoinTable(name = "startups_investors",
            joinColumns = @JoinColumn(name = "STARTUP_ID"),
            inverseJoinColumns = @JoinColumn(name = "INVESTOR_ID"))
    private List<Investor> investorList;
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.REFRESH) // todo , mappedBy = "startup_id" создать переменную в BusinessPlan
    private BusinessPlan businessPlan;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStartupName() {
        return startupName;
    }

    public void setStartupName(String startupName) {
        this.startupName = startupName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIdea() {
        return idea;
    }

    public void setIdea(String idea) {
        this.idea = idea;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getProjectStage() {
        return projectStage;
    }

    public void setProjectStage(String projectStage) {
        this.projectStage = projectStage;
    }

    public BigDecimal getStartupCost() {
        return startupCost;
    }

    public void setStartupCost(BigDecimal startupCost) {
        this.startupCost = startupCost;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public User getOwnerUser() {
        return ownerUser;
    }

    public void setOwnerUser(User ownerUser) {
        this.ownerUser = ownerUser;
    }

    public List<Investor> getInvestorList() {
        return investorList;
    }

    public void setInvestorList(List<Investor> investorList) {
        this.investorList = investorList;
    }

    public BusinessPlan getBusinessPlan() {
        return businessPlan;
    }

    public void setBusinessPlan(BusinessPlan businessPlan) {
        this.businessPlan = businessPlan;
    }

    @Override
    public String toString() {
        return "Startup{" +
                "id=" + id +
                ", startupName='" + startupName + '\'' +
                ", description='" + description + '\'' +
                ", idea='" + idea + '\'' +
                ", industry='" + industry + '\'' +
                ", country='" + country + '\'' +
                ", projectStage='" + projectStage + '\'' +
                ", time=" + time +
                ", ownerUser=" + ownerUser +
                ", investorList=" + investorList +
                ", businessPlan=" + businessPlan +
                '}';
    }
}
