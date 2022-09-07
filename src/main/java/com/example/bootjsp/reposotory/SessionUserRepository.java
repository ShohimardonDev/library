package com.example.bootjsp.reposotory;

import com.example.bootjsp.domains.SessionUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * @author: Shohimardon Abdurashitov
 * @since; September  Tuesday 18:22:09
 * @product Name:  boot-jsp
 * @Class Name: SessionUserRepository
 * IntelliJ IDEA
 **/
public interface SessionUserRepository extends JpaRepository<SessionUser, Long> {
    Optional<SessionUser> findByMacAddress(String macAddress);
    SessionUser findByUsername(String macAddress);
}
