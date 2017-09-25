package com.startup.project.entities;

import java.math.BigDecimal;

/**
 * Created by serhii on 22.09.2017.
 */
public class Investment {

    private Integer startupId;
    private String stastupName;
    private BigDecimal sumInvestment;

    public Investment(Integer startupId, String stastupName, BigDecimal sumInvestment) {
        this.startupId = startupId;
        this.stastupName = stastupName;
        this.sumInvestment = sumInvestment;
    }

    public Integer getStartupId() {
        return startupId;
    }

    public String getStastupName() {
        return stastupName;
    }

    public BigDecimal getSumInvestment() {
        return sumInvestment;
    }

}
