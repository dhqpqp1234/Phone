package com.example.phone.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDto {
    private int custInfoNo;
    private String custNm;
    private String custId;
    private String custPw;
    private String custEmail;
    private String custPh;
    private String custRegDttm;
}
