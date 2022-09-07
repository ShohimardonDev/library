package com.example.bootjsp.domains;



import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;

import java.sql.Timestamp;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@MappedSuperclass
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class Auditable implements BaseDomain {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @CreationTimestamp
    @Column(updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private Timestamp createdAt;


    private Long createdBy;

    @Column
    private Timestamp updatedAt;

    private Long updatedBy;




}
