package com.startup.project.entities;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

/**
 * Created by Sonik on 13.09.2017.
 */
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "FIRST_NAME", length = 30)
    private String firstName;
    @Column(name = "LAST_NAME", length = 30)
    private String lastName;
    @Column(name = "EMAIL", unique = true, nullable = false, length = 60)
    private String email;
    @Transient
    private String previousEmail;

    public void setPreviousEmail(String previousEmail) {
        this.previousEmail = previousEmail;
    }

    @Column(name = "PASSWORD", nullable = false, length = 50)
    private String password;
    @Transient
    private String confirmPassword;
    @Column(name = "PHONE", length = 14)
    private String phone;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.REFRESH)
    @JoinTable(name = "users_roles",
            joinColumns = @JoinColumn(name = "USER_ID"),
            inverseJoinColumns = @JoinColumn(name = "ROLE_ID"))
    private Set<UserRole> userRoles;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "ownerUser", cascade = {CascadeType.REMOVE, CascadeType.REFRESH})
    private List<Startup> startupList;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<UserRole> getUserRoles() {
        return userRoles;
    }

    public void setUserRoles(Set<UserRole> userRoles) {
        this.userRoles = userRoles;
    }

    public List<Startup> getStartupList() {
        return startupList;
    }

    public void setStartupList(List<Startup> startupList) {
        this.startupList = startupList;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPreviousEmail() {
        return previousEmail;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", userRoles=" + userRoles +
                ", startupList=" + startupList +
                '}';
    }
}
