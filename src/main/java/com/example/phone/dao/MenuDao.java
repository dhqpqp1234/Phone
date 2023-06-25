package com.example.phone.dao;

import com.example.phone.dto.ProductDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuDao {

    public List<ProductDto> phoneList();


}
