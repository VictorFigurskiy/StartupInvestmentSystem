package com.startup.project.services;

import com.startup.project.entities.UserRole;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * Created by Sonik on 16.09.2017.
 */
@Service
public class UserDetailedServiceImpl implements UserDetailsService {

    private static final Logger LOGGER = Logger.getLogger(UserDetailedServiceImpl.class);

    private final UserService userService;

    @Autowired
    public UserDetailedServiceImpl(UserService userService) {
        this.userService = userService;
    }

    /**
     * This method load user by username.
     *
     * @param email - unique value of user's email.
     * @return particular user with such lines as: password & role.
     * @throws UsernameNotFoundException if user not found by username.
     */
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        com.startup.project.entities.User user = userService.getByEmail(email);
        if (user == null) {
            LOGGER.info("User with" + email + "not exist!!!");
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
