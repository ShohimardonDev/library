package com.example.bootjsp.doa;

import com.example.bootjsp.domains.Book;
import com.example.bootjsp.reposotory.BookRepository;
import lombok.RequiredArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Service;


import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BookDao {

    private final BookRepository bookRepository;

    public void save(Book addedBook) {
        bookRepository.save(addedBook);
    }

    public List<Book> getAllBook(boolean checker) {

        if (!checker) {


            return bookRepository.getFalse();

        } else {
            return bookRepository.getTrue();

        }

    }

    public Book getById(Long id) {
        return bookRepository.getById(id);
    }

    public List<Book> getAnyWhere(String search) {
        List<Book> allBook = getAllBook(true);
        Book bookq = null;
        search = search.toLowerCase();
        List<Book> bookList = new ArrayList<>();
        try {
            for (Book book : allBook) {
                bookq = book;
                if (book.getName().toLowerCase().contains(search) || book.getAuthor().toLowerCase().contains(search) || book.getDescription().toLowerCase().contains(search) || book.getGenre().getKey().toLowerCase().contains(search) || book.getLanguage().getName().toLowerCase().contains(search)) {
                    bookList.add(book);
                }
            }
        } catch (Exception e) {
            delete(bookq);
        }
        return bookList;
    }


    public List<Book> getRecords(int start, int total) {


//        query = currentSession.createQuery("select t from Book t where t.deleted=false and  t.isConform = false  " + (start - 1) + "," + total, Book.class);
//        query.setFirstResult(start);
//        query.setMaxResults(total);

//        List<Book> bookList = query.getResultList();
        List<Book> bookList = null;
//        currentSession.getTransaction().commit();
//        currentSession.close();
        return bookList;
    }

    public void delete(Book book) {
        bookRepository.delete(book);
    }

//    public List<Book> getRecords(int start, int total) {
//
//
//        query = currentSession.createQuery("select t from Book t where t.deleted=false and  t.isConform = false  " + (start - 1) + "," + total, Book.class);
//        query.setFirstResult(start);
//        query.setMaxResults(total);
//
//        List<Book> bookList = query.getResultList();
//        currentSession.getTransaction().commit();
//        currentSession.close();
//        return bookList;
//    }

}
