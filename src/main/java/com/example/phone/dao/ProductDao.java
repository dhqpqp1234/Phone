package com.example.phone.dao;

import com.example.phone.dto.ProductDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductDao {

    public int productInsert(ProductDto productDto); //상품등록

    public int countInsert(ProductDto productDto); //재고 등록

    public int fileInsert(ProductDto productDto); //사진등록

    public List<ProductDto> selectList(ProductDto productDto); //등롱상품 정보 가져오기
    public int proDelete(int productNo); // 상품삭제

    public int invenDelete(int productNo); // 재고수 삭제
    
    public int totalCnt(ProductDto productDto); // 글 전체 개수 가져오기

    public ProductDto getproduct(int productNo); // 상세보기

    public List<ProductDto> selectFile(int productNo); //사진 리스트

}
