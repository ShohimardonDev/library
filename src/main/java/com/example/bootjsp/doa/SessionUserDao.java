package com.example.bootjsp.doa;

import com.example.bootjsp.domains.SessionUser;
import com.example.bootjsp.reposotory.SessionUserRepository;
import lombok.RequiredArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SessionUserDao {

    private final SessionUserRepository userRepository;


    public void save(SessionUser sessionUserDao) {
        String macAddress = sessionUserDao.getMacAddress();
        try {
            delete(macAddress, false);

        } catch (Exception e) {
    e.printStackTrace();
        }


        userRepository.saveAndFlush(sessionUserDao);
    }

    public void delete(String username, boolean isUsername) {
        SessionUser user;

        if (!isUsername) {
            user = getBy(username, true);

        } else {
            user = getBy(username, false);

        }
        userRepository.delete(user);
    }


    public SessionUser getBy(String data, boolean isMacAddress) {
        SessionUser resultOrNull;


        System.out.println("data = " + data);

        if (isMacAddress) {


            return userRepository.findByMacAddress(data).orElse(null);


        } else {

            return userRepository.findByUsername(data);
        }

    }

}
