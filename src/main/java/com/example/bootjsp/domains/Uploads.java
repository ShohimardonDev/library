package com.example.bootjsp.domains;


import lombok.*;

import javax.persistence.Entity;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

@ToString
@Entity
public class



Uploads extends Auditable {


    private String path;
    private String originalName;
    private String generatedName;
    private long size;
    private String contentType;

  /*  public Uploads(String path, String originalName, String generatedName, long size, String contentType) {
        this.path = path;
        this.originalName = originalName;
        this.generatedName = generatedName;
        this.size = size;
        this.contentType = contentType;
    }*/
}

