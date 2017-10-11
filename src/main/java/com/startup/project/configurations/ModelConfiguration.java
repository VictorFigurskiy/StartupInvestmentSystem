package com.startup.project.configurations;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Properties;

/**
 * Created by Sonik on 13.09.2017.
 */
@Configuration
@ComponentScan(value = {"com.startup.project.dao", "com.startup.project.services"})
@PropertySource("classpath:hibernate.properties")
@EnableTransactionManagement
public class ModelConfiguration {

    @Value("${db.url}")
    private String url;
    @Value("${db.username}")
    private String userName;
    @Value("${db.password}")
    private String password;
    @Value("${db.driver}")
    private String driver;
    @Value("${db.dialect}")
    private String dialect;
    @Value("${hibernate.show_sql}")
    private String showSql;
    @Value("${hibernate.format_sql}")
    private String formatSql;
    @Value("${hibernate.hbm2ddl.auto}")
    private String hbm2ddlAuto;
    @Value("${hibernate.enable_lazy_load_no_trans}")
    private String enableLazyLoadOnTrans;
    @Value("${current_session_context_class}")
    private String currentSessionContextClass;
    @Value("${hibernate.connection.charSet}")
    private String charSet;
    @Value("${connection.characterEncoding}")
    private String characterEncoding;

//    Data source for local tomcat server

//    @Bean(destroyMethod = "close")
//    public BasicDataSource dataSource(){
//        BasicDataSource dataSource = new BasicDataSource();
//        dataSource.setUrl(url);
//        dataSource.setUsername(userName);
//        dataSource.setPassword(password);
//        dataSource.setDriverClassName(driver);
//        return dataSource;
//    }

    // Data source for heroku database for local testing
    //    @Bean
//    public BasicDataSource dataSource() throws URISyntaxException {
//        URI dbUri = new URI("mysql://a7pfxplnyomk00xa:gg0pygsi1lc41ztw@cvktne7b4wbj4ks1.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/ubzusu62u4vac81q");
//
//        String username = dbUri.getUserInfo().split(":")[0];
//        String password = dbUri.getUserInfo().split(":")[1];
//        String dbUrl = "jdbc:mysql://" + dbUri.getHost() + dbUri.getPath();
//
//        BasicDataSource basicDataSource = new BasicDataSource();
//        basicDataSource.setUrl(dbUrl);
//        basicDataSource.setUsername(username);
//        basicDataSource.setPassword(password);
//        basicDataSource.setDriverClassName(driver);
//        return basicDataSource;
//    }

    // Data source for heroku database
    @Bean
    public BasicDataSource dataSource() throws URISyntaxException {
        URI dbUri = new URI(System.getenv("JAWSDB_URL"));

        String username = dbUri.getUserInfo().split(":")[0];
        String password = dbUri.getUserInfo().split(":")[1];
        String dbUrl = "jdbc:mysql://" + dbUri.getHost() + dbUri.getPath();

        BasicDataSource basicDataSource = new BasicDataSource();
        basicDataSource.setUrl(dbUrl);
        basicDataSource.setUsername(username);
        basicDataSource.setPassword(password);

        return basicDataSource;
    }

    @Bean
    public Properties hibernateProperties(){
        Properties properties = new Properties();
        properties.put("hibernate.dialect", dialect);
        properties.put("hibernate.show_sql", showSql);
        properties.put("hibernate.format_sql", formatSql);
        properties.put("hibernate.hbm2ddl.auto", hbm2ddlAuto);
        properties.put("hibernate.enable_lazy_load_no_trans", enableLazyLoadOnTrans);
        properties.put("current_session_context_class", currentSessionContextClass);
        properties.put("hibernate.connection.charSet", charSet);
        properties.put("connection.characterEncoding", characterEncoding);
        return properties;
    }

    @Bean
    @Scope(value = "singleton")
    public LocalSessionFactoryBean sessionFactory(DataSource dataSource){
        LocalSessionFactoryBean bean = new LocalSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setPackagesToScan("com.startup.project.entities");
        bean.setHibernateProperties(hibernateProperties());
        return bean;
    }

    @Autowired
    @Bean
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory){
        return new HibernateTransactionManager(sessionFactory);
    }

}
