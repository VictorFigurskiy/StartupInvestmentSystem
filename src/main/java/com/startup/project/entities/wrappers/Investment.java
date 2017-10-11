package com.startup.project.entities.wrappers;

import java.math.BigDecimal;

/**
 * Created by serhii on 22.09.2017.
 */
public class Investment {

    private Integer startupId;
    private String startupName;
    private BigDecimal sumInvestment;

    public Investment(Integer startupId, String startupName, BigDecimal sumInvestment) {
        this.startupId = startupId;
        this.startupName = startupName;
        this.sumInvestment = sumInvestment;
    }

    public Integer getStartupId() {
        return startupId;
    }

    public String getStartupName() {
        return startupName;
    }

    public BigDecimal getSumInvestment() {
        return sumInvestment;
    }

}
