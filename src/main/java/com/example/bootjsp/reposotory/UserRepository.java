package com.example.bootjsp.reposotory;

import com.example.bootjsp.domains.Uploads;
import com.example.bootjsp.domains.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author: Shohimardon Abdurashitov
 * @since; September  Tuesday 18:27:45
 * @product Name:  boot-jsp
 * @Class Name: UploadRepository
 * IntelliJ IDEA
 **/
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
