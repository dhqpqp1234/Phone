package com.example.phone.dao;

import com.example.phone.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.http.converter.json.GsonBuilderUtils;

@Mapper
public interface UserDao {

    public int userInsert(UserDto userDto); //유저 회원가입

    public int idCheck(String custId);//유저 id 중복체크

    public int phCheck(String custPh); //유저 전화번호 체크

    public UserDto getUser(UserDto userDto);//유저 로그인

}
