package com.startup.project.entities;

import javax.persistence.*;

/**
 * Created by Sonik on 13.09.2017.
 */
@Entity
@Table(name = "roles")
public class UserRole {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ROLE_TYPE", length = 15, nullable = false, unique = true)
    private String roleType = UserRoleType.USER.getRoleType();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleType() {
        return roleType;
    }

    public void setRoleType(String roleType) {
        this.roleType = roleType;
    }

    @Override
    public String toString() {
        return "UserRole{" +
                "id=" + id +
                ", roleType='" + roleType + '\'' +
                '}';
    }
}
