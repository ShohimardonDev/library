package com.example.bootjsp.config;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Component;


@NoArgsConstructor(access = AccessLevel.PRIVATE)
@Component
public class Encoder {




//    public String encode(String data) {
//        if (data.endsWith("=")) {
//            return data;
//        }
//        Base64.Encoder encoder = Base64.getEncoder();
//
//        byte[] bytes = data.getBytes();
//
//        String encode = encoder.encodeToString(bytes);
//        System.out.println(encode);
//
//        return encode;
//    }

//    public String decode(String data) {
//        Base64.Decoder decoder = Base64.getDecoder();
//
//        return new String(decoder.decode(data));
//
//    }

    public String encodePassword(String rawPassword) {
        return BCrypt.hashpw(rawPassword, BCrypt.gensalt(12));
    }

    public boolean matchPassword(String rawPassword, String encodedPassword) {
        return BCrypt.checkpw(rawPassword, encodedPassword);
    }

}
