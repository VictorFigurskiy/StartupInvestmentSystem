package com.startup.project;

import com.startup.project.configurations.ModelConfiguration;
import com.startup.project.entities.*;
import com.startup.project.services.UserRoleService;
import com.startup.project.services.UserService;
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
    public static void main(String[] args) {
        try (AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(ModelConfiguration.class)) {

            UserRoleService userRoleService = ctx.getBean(UserRoleService.class);
            UserService userService = ctx.getBean(UserService.class);
//            System.out.println(userService.getById(2));
//            System.out.println(userService.getAll());

            User user = new User();
            user.setFirstName("Gustavo");
            user.setLastName("Guam");
            user.setEmail("some@email");
            user.setPassword("111");

            UserRole userRole = userRoleService.getById(3);
            System.out.println(userRole);
//
//            Set<UserRole> userRoleSet = new HashSet<>();
//            userRoleSet.add(userRole);
//
//            user.setUserRoles(userRoleSet);
//            user.setStartupList(new ArrayList<>());
//
//            userService.save(user);


//            Startup startup = new Startup();
//            startup.setStartupName("Something New");
//            startup.setDescription("new Startup");
//            startup.setIdea("todoSomething");
//            startup.setIndustry("IT");
//            startup.setCountry("us");
//            startup.setInvestorList(new ArrayList<>());
//            startup.setOwnerUser(user);
//            startup.setBusinessPlan(new BusinessPlan());
//            startup.setStartupCost(new BigDecimal(100_000));



            ctx.close();
        }
    }
}
