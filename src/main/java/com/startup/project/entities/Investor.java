package com.startup.project.entities;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Sonik on 13.09.2017.
 */
@Entity
@Table(name = "investors")
public class Investor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer Id;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
    @JoinColumn(name = "USER_ID")
    private User investorUser;

    @Column(name = "INVESTMENTS")
    private BigDecimal investments;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
    @JoinTable(name = "startups_investors",
            joinColumns = @JoinColumn(name = "INVESTOR_ID"),
            inverseJoinColumns = @JoinColumn(name = "STARTUP_ID"))
    private List<Startup> startupList;


    public BigDecimal getInvestments() {
        return investments;
    }

    public void setInvestments(BigDecimal investments) {
        this.investments = investments;
    }

    public List<Startup> getStartupList() {
        return startupList;
    }

    public void setStartupList(List<Startup> startupList) {
        this.startupList = startupList;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public User getInvestorUser() {
        return investorUser;
    }

    public void setInvestorUser(User investorUser) {
        this.investorUser = investorUser;
    }

    @Override
    public String toString() {
        return "Investor{" +
                "Id=" + Id +
                ", investments=" + investments +
                '}';
    }
}
