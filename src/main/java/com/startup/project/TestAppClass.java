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
   public static class Test{
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


            System.out.println(new Test().getA());


            ctx.close();
        }
    }
}
