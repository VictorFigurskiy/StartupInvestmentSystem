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
    @Column(name = "CURRENT_STATE")
    private String currentState;            //Текущее состояние
    @Column(name = "GROSS_PROFIT")
    private String grossProfit;             //Годовой объем продаж, $
    @Column(name = "NET_INCOME")
    private String netIncome;               //Годовой объем чистой прибыли, $
    @Column(name = "TYPE_OF_PROPERTY")
    private String typeOfProperty;          //Тип имущества
    @Column(name = "PROPERTY")
    private String property;                //Имущество и активы
    @Column(name = "PROBLEM_OR_OPPORTUNITY")
    private String problemOrOpportunity;    //Проблема или Возможность
    @Column(name = "COMPETITORS")
    private String competitors;             //Конкуренты
    @Column(name = "BUSINESS_MODEL")
    private String businessModel;           //Бизнес-модель

//    @OneToOne(mappedBy = "startupDetail")
//    private Startup startup;

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

    @Override
    public String toString() {
        return "StartupDetail{" +
                "id=" + id +
                ", currentState='" + currentState + '\'' +
                ", grossProfit='" + grossProfit + '\'' +
                ", netIncome='" + netIncome + '\'' +
                ", typeOfProperty='" + typeOfProperty + '\'' +
                ", property='" + property + '\'' +
                ", problemOrOpportunity='" + problemOrOpportunity + '\'' +
                ", competitors='" + competitors + '\'' +
                ", businessModel='" + businessModel + '\'' +
                '}';
    }
}
