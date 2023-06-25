package com.example.phone.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminDto {

    private int buyerInfoNo;
    private String buyerNm;
    private String buyerRegDttm;
    private String buyerId;
    private String buyerPw;
    private String buyerPh;
    private String buyerEmail;
}
