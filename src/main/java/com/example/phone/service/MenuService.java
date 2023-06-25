package com.example.phone.service;

import com.example.phone.dao.MenuDao;
import com.example.phone.dto.ProductDto;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MenuService {

    private final MenuDao menuDao;

    public MenuService(MenuDao menuDao){
        this.menuDao = menuDao;
    }

    public Map<String, Object> phoneList(){

        Map<String, Object> pMap = new HashMap<>();

        List<ProductDto> phoneList = menuDao.phoneList();

        pMap.put("phoneList",phoneList);
        return pMap;
    }

}
