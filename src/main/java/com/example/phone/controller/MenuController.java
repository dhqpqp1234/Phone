package com.example.phone.controller;

import com.example.phone.service.MenuService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.awt.print.Pageable;
import java.util.Map;

@Controller
public class MenuController {
    private final MenuService menuService;

    public MenuController(MenuService menuService) {
        this.menuService = menuService;
    }
    @RequestMapping(value = "/phone")
    public ModelAndView phoneMenu(){

        ModelAndView mav = new ModelAndView();

        Map<String, Object> pMap = menuService.phoneList(); // 게시판 글 정보

        mav.addObject("pMap",pMap);

        mav.setViewName("/menu/phoneMenu");
        return mav;
    }

}
