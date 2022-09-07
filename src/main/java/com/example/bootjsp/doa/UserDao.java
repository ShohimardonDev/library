package com.example.bootjsp.doa;

import com.example.bootjsp.config.Encoder;
import com.example.bootjsp.domains.User;
import com.example.bootjsp.reposotory.UserRepository;
import lombok.RequiredArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;


import java.util.Objects;

@Service
@RequiredArgsConstructor
public class UserDao {

    private final Encoder encoder;

    private final UserRepository userRepository;

    public User login(String username, String password) {


        User user = userRepository.findByUsername(username);

        if (Objects.nonNull(user) && !user.getPassword().equals(password) && !encoder.matchPassword(password, user.getPassword())) {
            return null;
        }


        return user;
    }

    public User create(User user) {
        return userRepository.saveAndFlush(user);
    }

    public void delete(User user) {
        userRepository.delete(user);
    }


    public boolean IsTakenUsername(String username) {


        User user = userRepository.findByUsername(username);


        if (Objects.isNull(user)) {
            return false;
        }
        return true;
    }

    public User getOne(Long id) {
        return userRepository.getById(id);
    }
}
