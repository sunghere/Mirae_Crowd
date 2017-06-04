package com.sung.hee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sung.hee.kakao.model.Keyboard;

@RestController
@RequestMapping("/kakao")
public class KakaoController {

    private static final Logger logger =
            LoggerFactory.getLogger(KakaoController.class);

    @GetMapping("/keyboard")
    public @ResponseBody Keyboard showButtons() {
    	Keyboard keyboard = null;
    	keyboard = new Keyboard();
    	keyboard.setType("buttons");
    	keyboard.addButtons("펀딩리스트 조회");
    	keyboard.addButtons("펀딩하기");
    	keyboard.addButtons("포인트 충전(Test)");
    	keyboard.addButtons("포인트 출금(Test)");
    	keyboard.addButtons("포인트 출금(Test)");
    	keyboard.addButtons("포인트 출금(Test)");
    	
    	return keyboard;
    }
    
    @PostMapping("/message")
    public @ResponseBody Keyboard getJson() {
    	Keyboard keyboard = null;
    	keyboard = new Keyboard();
    	keyboard.setType("buttons");
    	keyboard.addButtons("펀딩리스트 조회");
    	keyboard.addButtons("펀딩하기");
    	keyboard.addButtons("포인트 충전(Test)");
    	keyboard.addButtons("포인트 출금(Test)");
    	keyboard.addButtons("포인트 출금(Test)");
    	keyboard.addButtons("포인트 출금(Test)");
    	
    	
    	
    	return keyboard;
    }
}