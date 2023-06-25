package com.example.phone.controller;

import com.example.phone.dto.AdminDto;
import com.example.phone.dto.UserDto;
//import com.example.phone.service.RegisterMail;
import com.example.phone.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

    //private final RegisterMail registerMail;
    private final UserService userService;

    public UserController(/*RegisterMail registerMail,*/ UserService userService) {
        //this.registerMail = registerMail;
        this.userService = userService;
    }

    @RequestMapping(value="/loginForm") //로그인폼
    public String userLoginForm(){
        return "user/login";
    }

    @RequestMapping(value = "/login") //로그인
    @ResponseBody
    public String userLogin(@RequestBody UserDto userDto, HttpSession session){
        UserDto autherUser = userService.getUser(userDto);

        String result = "";

        if(autherUser != null){
            session.setAttribute("autherUser",autherUser);
            result = "ok";
        }else{
            result = "no";
        }

        return result;
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        session.removeAttribute("autherUser");
        session.invalidate();
        return "redirect:/main";
    }
    @RequestMapping(value="/joinForm") //회원가입 폼
    public String joinForm(){

        return "user/joinForm";
    }

    @RequestMapping(value = "/joinOk") //회원가입 완료 폼
    public String joinOk(){
        return "user/joinOk";
    }

    @RequestMapping(value = "/userInsert") //회원가입
    @ResponseBody
    public int join(@RequestBody UserDto userDto){
        System.out.println(userDto);
        return userService.userInsert(userDto);
    }

    @RequestMapping(value = "/idCheck") // id 중복체크
    @ResponseBody
    public int idCheck(@RequestBody UserDto userDto){
        int result = userService.idCheck(userDto.getCustId());
        System.out.println(userDto.getCustId() + "ConId");
        System.out.println(result + "result");
        return result;
    }

    @RequestMapping(value = "/phCheck")//전화번호 중복체크
    @ResponseBody
    public int phCheck(@RequestBody UserDto userDto){
        int result = userService.phCheck(userDto.getCustPh());
        return result;
    }
    /*@RequestMapping(value = "/emailCheck")
    @ResponseBody
    public String mailCheck(@RequestBody UserDto userDto) throws Exception{ //eMail인증
        System.out.println("emailCheck");
        System.out.println("emailCheck"+userDto.getCustEmail());
        String code = registerMail.sendSimpleMessage(userDto.getCustEmail());
        return code;
    }
*/

}
