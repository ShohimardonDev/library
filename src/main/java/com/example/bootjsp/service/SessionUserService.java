package com.example.bootjsp.service;

import com.example.bootjsp.doa.SessionUserDao;
import com.example.bootjsp.domains.SessionUser;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;




@Service
@RequiredArgsConstructor
public class SessionUserService {


    private final SessionUserDao sessionUserDao;


}
