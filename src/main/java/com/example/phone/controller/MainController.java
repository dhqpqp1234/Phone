package com.example.phone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController { //사용자 메인
    @RequestMapping(value="main")
    public String main(){

        System.out.println("JSP TEST");

        return "home";
    }

    @RequestMapping(value = "admin") //관리자 페이지 메인
    public String adminMain(){
        return "admin/admin";
    }

}
