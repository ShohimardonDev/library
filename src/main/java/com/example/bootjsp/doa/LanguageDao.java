package com.example.bootjsp.doa;

import com.example.bootjsp.domains.Language;
import com.example.bootjsp.reposotory.LanguageRepository;
import lombok.RequiredArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;


import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class LanguageDao {

    private final LanguageRepository languageRepository;

    public List<Language> getAllLanguage() {
        return languageRepository.findAll();
    }

    public Language convertor(String name, boolean isEnumName) {
        List<Language> languages = getAllLanguage();

        System.out.println("===============================================================================");
        System.out.println("name = " + name);
        Language languag = null;
        for (Language language : languages) {
            if (language.getName().equalsIgnoreCase(name) || language.getEnumName().equalsIgnoreCase(name)) {
                languag = language;
            }
        }
        System.out.println("============================================================");
        System.out.println("name = " + languag);
        if (Objects.isNull(languag)) {
            languag = new Language(name, name);

            save(languag);
        }

        return languag;
    }

    public List<String> getAllLanguageName(boolean isEnum) {
        List<String> res = new ArrayList<>();

        List<Language> languageList = getAllLanguage();

        if (isEnum) {
            for (Language language : languageList) {
                res.add(language.getEnumName());
            }
        } else {
            for (Language language : languageList) {
                res.add(language.getName());
            }

        }

        return res;
    }

    public void save(Language language) {
        languageRepository.save(language);
    }


}
