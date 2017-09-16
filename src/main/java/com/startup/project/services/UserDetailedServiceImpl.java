package com.startup.project.services;

import com.startup.project.entities.UserRole;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * Created by Sonik on 16.09.2017.
 */
public class UserDetailedServiceImpl implements UserDetailsService {

    private final UserService userService;

    public UserDetailedServiceImpl(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        com.startup.project.entities.User user = userService.getByEmail(email);
        if (user == null){
            throw new UsernameNotFoundException("User not exist!!!");
        }

        String[] roles = user.getUserRoles()
                .stream()
                .map(UserRole::getRoleType)
                .toArray(String[]::new);

        return User.withUsername(user.getEmail())
                .password(user.getPassword())
                .roles(roles)
                .build();
    }
}
