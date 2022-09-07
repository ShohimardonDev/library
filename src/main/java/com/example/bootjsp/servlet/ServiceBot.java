package com.example.bootjsp.servlet;

import com.example.bootjsp.telegram.Bot;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public
class ServiceBot {
    private final Bot bot;

    public void sendMessage(String text) {


        bot.sendMessage(text);
    }
}
