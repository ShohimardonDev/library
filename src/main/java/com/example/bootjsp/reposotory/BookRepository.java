package com.example.bootjsp.reposotory;

import com.example.bootjsp.domains.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author: Shohimardon Abdurashitov
 * @since; September  Tuesday 18:12:57
 * @product Name:  boot-jsp
 * @Class Name: BookRepository
 * IntelliJ IDEA
 **/
public interface BookRepository extends JpaRepository<Book, Long> {
    @Query("select t from Book t where  t.isConform = true ")
    List<Book> getTrue();

    @Query("select t from Book t where  t.isConform = false ")
    List<Book> getFalse();
}
