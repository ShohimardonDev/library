package com.example.bootjsp.doa;

import com.example.bootjsp.domains.Uploads;
import com.example.bootjsp.reposotory.UploadRepository;
import lombok.RequiredArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UploadsDao  {

    private final UploadRepository uploadRepository;

    public void save(Uploads uploads) {
        uploadRepository.save(uploads);
    }
}
