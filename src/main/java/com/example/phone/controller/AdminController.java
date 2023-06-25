package com.example.phone.controller;

import com.example.phone.dto.AdminDto;
import com.example.phone.service.AdminService;
import com.example.phone.service.RegisterMail;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Random;

@Controller
public class AdminController {
    private final AdminService adminService;

    private final RegisterMail registerMail;
    public AdminController(AdminService adminService, RegisterMail registerMail) {
        this.registerMail = registerMail;
        this.adminService = adminService;
    }

    /////////////////////////////////// 관리자 페이지 //////////////////////////////////////
    @RequestMapping(value = "adminLoginForm") //관리자 로그인 페이지
    public String adminLoginForm(){
        return "admin/adminLoginForm";
    }

    @RequestMapping(value = "adminLogin")
    @ResponseBody
    public String adminLogin(@RequestBody AdminDto adminDto, HttpSession session){
        AdminDto autherUser = adminService.adminLogin(adminDto);
        System.out.println(adminDto);
        System.out.println(autherUser);
        String result ="";

        if(autherUser != null){
            session.setAttribute("autherUser",autherUser);
            result = "ok";
        }else{
            result = "no";
        }

        return result;
    }

    @RequestMapping(value = "adminLogout") //로그아웃
    public String adminLogout(HttpSession session){
        session.removeAttribute("autherUser");
        session.invalidate();
        return "redirect:/admin";
    }

    @RequestMapping(value = "adminJoinForm") //관리자 회원가입 폼
    public String adminJoinForm(){
        return "admin/adminJoinForm";
    }

    @RequestMapping(value = "adminIdCheck") // id 중복체크
    @ResponseBody
    public int idCheck(@RequestBody AdminDto adminDto){
        String buyerId = adminDto.getBuyerId();
        int result = adminService.adminIdCheck(buyerId);
        return result;
    }

    @RequestMapping(value = "adminEmailCheck") //이메일 인증
    @ResponseBody
    public String adminEmailCheck(@RequestBody AdminDto adminDto) throws Exception {

        String code = registerMail.sendSimpleMessage(adminDto.getBuyerEmail());;

        return code;
    }

    @RequestMapping(value = "adminPhCheck")
    @ResponseBody
    public String adminPhCheck(@RequestBody AdminDto adminDto){

        String phoneNum = adminDto.getBuyerPh(); // 수신자 번호

        Random rand = new Random();
        String numStr = "";
        for(int i=0; i<4; i++){
            String ran = Integer.toString(rand.nextInt(10));
            numStr += ran;
        }

        System.out.println("수신자 번호"+phoneNum);
        System.out.println("인증번호"+numStr);

        adminService.certifiedPhoneNumber(phoneNum,numStr);

        return numStr;
    }

    @RequestMapping(value = "adminInsert") //회원가입
    @ResponseBody
    public int adminInsert(@RequestBody AdminDto adminDto){
        System.out.println(adminDto);
        int count = adminService.adminInsert(adminDto);
        return count;
    }


}
