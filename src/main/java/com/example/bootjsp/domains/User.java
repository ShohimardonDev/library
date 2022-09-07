package com.example.bootjsp.domains;


import com.example.bootjsp.enums.UserRole;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import javax.persistence.Entity;
import javax.persistence.*;


@Data
@Entity
@Table(name = "users")
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String username;

    @Column(nullable = false)
    private String password;
    @Column(nullable = false)
    private String email;
    @Column(nullable = false)
    private String lastname;
    @Column(nullable = false)
    private String firstname;
    @Column(nullable = false)
    private Integer age;
    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private UserRole role = UserRole.USER;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User(String username, String password, String email, String lastname, String firstname, Integer age) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.lastname = lastname;
        this.firstname = firstname;
        this.age = age;
        this.role = UserRole.USER;
    }
}