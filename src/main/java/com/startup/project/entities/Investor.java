package com.startup.project.entities;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * Created by Sonik on 13.09.2017.
 */
@Entity
@Table(name = "investors")
public class Investor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "INVESTOR_USER_ID", length = 20)
    private Integer investorUserId;
    @Column(name = "INVESTMENTS")
    private BigDecimal investments;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getInvestorUserId() {
        return investorUserId;
    }

    public void setInvestorUserId(Integer investorUserId) {
        this.investorUserId = investorUserId;
    }

    public BigDecimal getInvestments() {
        return investments;
    }

    public void setInvestments(BigDecimal investments) {
        this.investments = investments;
    }

    @Override
    public String toString() {
        return "Investor{" +
                "id=" + id +
                ", investorUserId=" + investorUserId +
                ", investments=" + investments +
                '}';
    }
}
