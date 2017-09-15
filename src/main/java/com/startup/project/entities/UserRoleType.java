package com.startup.project.entities;

/**
 * Created by Sonik on 13.09.2017.
 */
public enum UserRoleType {
    USER("USER"),
    OWNER("OWNER"),
    ADMIN("ADMIN");

    private String roleType;

    UserRoleType(String roleType) {
        this.roleType = roleType;
    }

    public String getRoleType() {
        return roleType;
    }
}
