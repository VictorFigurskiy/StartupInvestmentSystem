package com.startup.project;

import com.startup.project.configurations.ModelConfiguration;
import com.startup.project.dao.StartupDao;
import com.startup.project.entities.*;
import com.startup.project.services.*;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Sonik on 14.09.2017.
 */
public class TestAppClass {
    public static class Test {
        private String a;

        public String getA() {
            return a;
        }
    }

    public static void main(String[] args) {
        try (AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(ModelConfiguration.class)) {

            UserRoleService userRoleService = ctx.getBean(UserRoleService.class);
            UserService userService = ctx.getBean(UserService.class);
            StartupService startupService = ctx.getBean(StartupService.class);
            StartupDetailService startupDetailService = ctx.getBean(StartupDetailService.class);
            InvestorService investorService = ctx.getBean(InvestorService.class);


//            System.out.println(userService.getAll());
//
//            User user = userService.getById(1);
//            System.getenv().entrySet().forEach(System.out::println);
//            System.out.println(user);
//
//            System.out.println(user.getStartupList().isEmpty());
//            System.out.println(user.getStartupList());


//            User user = new User();
//            user.setFirstName("Roman");
//            user.setLastName("Abramovich");
//            user.setEmail("abram@email.com");
//            user.setPassword("0000");
//            user.setPhone("+800000000000");

//            UserRole userRole = userRoleService.getById(1);

//            Set<UserRole> userRoleSet = new HashSet<>();
//            UserRole userRoleUser = new UserRole();
//            UserRole userRoleOwner = new UserRole();
//            UserRole userRoleAdmin = new UserRole();
//            userRoleOwner.setRoleType(UserRoleType.OWNER.getRoleType());
//            userRoleAdmin.setRoleType(UserRoleType.ADMIN.getRoleType());
//
//            userRoleUser.setId(1);
//            userRoleOwner.setId(2);
//            userRoleAdmin.setId(3);

//            userRoleService.save(userRoleUser);
//            userRoleService.save(userRoleOwner);
//            userRoleService.save(userRoleAdmin);

//            userRoleSet.add(userRoleUser);
//
//            user.setUserRoles(userRoleSet);
//            user.setStartupList(new ArrayList<>());

//            userService.save(user);


//            Startup startup1 = startupService.getById(8);
//            ArrayList<Startup> startups = new ArrayList<>();
//            startups.add(startup1);
//
//            Investor investor = new Investor();
//            investor.setInvestments(new BigDecimal(10_000));
//            investor.setStartupList(startups);
//            investor.setInvestorUser(userService.getByEmail("abram@email.com"));

//            investorService.save(investor);
//
//            List<Investor> investorList = new ArrayList<>();
//            investorList.add(investor);
//            Startup startup = startupService.getById(1);
//            startup.getInvestorList().add(investor);
//            startupService.update(startup);


//            StartupDetail startupDetail = new StartupDetail();
//            startupDetail.setCurrentState("idea for startup");
//            startupDetail.setBusinessModel("Sales");
//            startupDetail.setCompetitors("Internet sellers");
//            startupDetail.setGrossProfit("120 000 $");
//            startupDetail.setNetIncome("45 000 $");
//            startupDetail.setTypeOfProperty("private business");
//            startupDetail.setProperty("office + car");
//            startupDetail.setProblemOrOpportunity("Many competitors on market");

//            startupDetailService.save(startupDetail);

//            Startup startup = new Startup();
//            startup.setStartupName("Something New");
//            startup.setDescription("new Startup");
//            startup.setIdea("todoSomething");
//            startup.setProjectStage("Only on paper");
//            startup.setIndustry("IT");
//            startup.setCountry("us");
////            startup.setInvestorList(investorList);
//            startup.setStartupDetail(startupDetail);
//            startup.setStartupCost(new BigDecimal(100_000));
//            startup.setOwnerUser(userService.getByEmail("abram@email.com"));

//            startupService.save(startup);

            List<Startup> startupOnPage = startupService.getStartupOnPage(4, 2);
            for (Startup startup2 : startupOnPage) {
                System.out.println(startup2.getStartupName());
            }


//            userService.delete(userService.getByEmail("abram@email.com"));

            ctx.close();
        }
    }
}
