package com.example.phone.service;

import com.example.phone.dao.UserDao;
import com.example.phone.dto.UserDto;
import org.springframework.stereotype.Service;
@Service
public class UserService {
    private final UserDao userDao;

    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }
    public int userInsert(UserDto userDto){ // 회원가입
        return userDao.userInsert(userDto);
    };

    public int idCheck(String custId){ // id 중복체크
        System.out.println(custId + "SerId");
        return userDao.idCheck(custId);
    }

    public int phCheck(String custPh){ //전화번호 중복체크,

        return userDao.phCheck(custPh);
    }

    //로그인
    public UserDto getUser(UserDto userDto){

        return userDao.getUser(userDto);
    }


}
