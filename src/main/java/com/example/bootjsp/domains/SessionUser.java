package com.example.bootjsp.domains;


import com.example.bootjsp.enums.UserRole;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import javax.persistence.*;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class SessionUser {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String username;

    @Column(nullable = false)
    private String password;


    @Enumerated(EnumType.STRING)
    private UserRole role = UserRole.USER;


    private String macAddress;
    private LocalDate loginDate;
    private LocalDate reLoginDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public SessionUser(User user, String macAddress) {

        this.username = user.getUsername();
        this.password = user.getPassword();
        this.role = user.getRole();
        this.macAddress = macAddress;
        this.loginDate = LocalDate.now();
        this.reLoginDate = loginDate.plusMonths(1);
    }


}
