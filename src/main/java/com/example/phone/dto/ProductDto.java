package com.example.phone.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductDto {

    //File Impormation
    private int fileNo;
    private String orgName;
    private String saveName;
    private String filePath;
    private int regNo;
    private long fileSize;

    // product Impormation
    private int productNo;
    private String productNm;
    private String category;
    private String categoryNm;
    private int price;
    private String regDttm;
    private String content;
    private int itCount;

    //페이지 번호 (기본값 1 세팅)
    private int pageNum = 1;
    //첫 글 번호
    private int startIndex = 1;
    //끝 글 번호
    private int endIndex = 10;

    //검색
    private String keyword;
    private String searchType;
}
