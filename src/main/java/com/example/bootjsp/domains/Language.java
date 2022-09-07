package com.example.bootjsp.domains;


import com.example.bootjsp.utils.GoogleTranslate;
import lombok.Data;
import lombok.NoArgsConstructor;


import javax.persistence.*;
import java.io.IOException;

import static com.example.bootjsp.utils.Container.text;


@Data
@Entity
@NoArgsConstructor
public class Language {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String enumName;
    private String name;

    private boolean deleted;


    public Language(String enumName, String name) {
        System.out.println("Before name = " + name);
        try {
            enumName = GoogleTranslate.detectLanguage(text);
        } catch (IOException e) {
            enumName = enumName.substring(0, 3);
        }
        System.out.println("After name = " + name);
        this.enumName = enumName.toUpperCase();
        this.name = name;
    }



}
