package com.startup.project.entities;

import javax.persistence.*;
import java.util.Optional;

/**
 * Created by Sonik on 14.09.2017.
 */
@Entity
@Table(name = "startup_details")
public class StartupDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "CURRENT_STATE", length = 500)
    private String currentState;            //Текущее состояние
    @Column(name = "GROSS_PROFIT", length = 500)
    private String grossProfit;             //Годовой объем продаж, $
    @Column(name = "NET_INCOME", length = 500)
    private String netIncome;               //Годовой объем чистой прибыли, $
    @Column(name = "TYPE_OF_PROPERTY", length = 500)
    private String typeOfProperty;          //Тип имущества
    @Column(name = "PROPERTY", length = 500)
    private String property;                //Имущество и активы
    @Column(name = "PROBLEM_OR_OPPORTUNITY", length = 500)
    private String problemOrOpportunity;    //Проблема или Возможность
    @Column(name = "COMPETITORS", length = 500)
    private String competitors;             //Конкуренты
    @Column(name = "BUSINESS_MODEL", length = 500)
    private String businessModel;           //Бизнес-модель

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCurrentState() {
        return currentState;
    }

    public void setCurrentState(String currentState) {
        this.currentState = currentState;
    }

    public String getGrossProfit() {
        return grossProfit;
    }

    public void setGrossProfit(String grossProfit) {
        this.grossProfit = grossProfit;
    }

    public String getNetIncome() {
        return netIncome;
    }

    public void setNetIncome(String netIncome) {
        this.netIncome = netIncome;
    }

    public String getTypeOfProperty() {
        return typeOfProperty;
    }

    public void setTypeOfProperty(String typeOfProperty) {
        this.typeOfProperty = typeOfProperty;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getProblemOrOpportunity() {
        return problemOrOpportunity;
    }

    public void setProblemOrOpportunity(String problemOrOpportunity) {
        this.problemOrOpportunity = problemOrOpportunity;
    }

    public String getCompetitors() {
        return competitors;
    }

    public void setCompetitors(String competitors) {
        this.competitors = competitors;
    }

    public String getBusinessModel() {
        return businessModel;
    }

    public void setBusinessModel(String businessModel) {
        this.businessModel = businessModel;
    }

}
