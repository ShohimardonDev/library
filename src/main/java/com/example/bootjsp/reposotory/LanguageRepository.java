package com.example.bootjsp.reposotory;

import com.example.bootjsp.doa.LanguageDao;
import com.example.bootjsp.domains.Language;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author: Shohimardon Abdurashitov
 * @since; September  Tuesday 18:17:08
 * @product Name:  boot-jsp
 * @Class Name: LanguageReposotory
 * IntelliJ IDEA
 **/
public interface LanguageRepository extends JpaRepository<Language, Long> {
}
