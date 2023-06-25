package com.example.phone.dao;

import com.example.phone.dto.AdminDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDao {

    public int adminIdCheck(String buyerId); //id 중복검사

    public int adminInsert(AdminDto adminDto); //회원가입

    public AdminDto adminLogin(AdminDto adminDto); // 로그인

}
