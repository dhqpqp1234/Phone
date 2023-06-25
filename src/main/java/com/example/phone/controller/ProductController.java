package com.example.phone.controller;

import com.example.phone.dto.ProductDto;
import com.example.phone.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.awt.print.Pageable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService){
        this.productService = productService;
    }

    //상품 등록 화면
    @RequestMapping(value = "productInsertForm")
    public String productInsertForm(){
        return "product/productInsertForm";
    }

    //상품등록
    @RequestMapping(value = "productInsert", method = {RequestMethod.POST})
    public ModelAndView productInsert(@ModelAttribute ProductDto productDto,
                                      @RequestParam(value="file", required = false)MultipartFile file[]){
        ModelAndView mav = new ModelAndView();

        Map<String, Object> pMap = productService.productInsert(productDto, file);

        mav.setViewName("redirect:/manageMent");
        return mav;
    }

    //상품관리
    @RequestMapping(value = "manageMent")
    @ResponseBody
    public ModelAndView manageMent(ProductDto productDto,
                                   @RequestParam(value = "searchType", required = false) String searchType,
                                   @RequestParam(value = "keyword", required = false) String keyword){
        ModelAndView mav = new ModelAndView();

        Map<String,Object> pMap = new HashMap();

        //총 데이터 개수
        int total = productService.totalCnt(productDto);

        //페이지 개수
        int totalPage = (int)Math.ceil((double)total/10);

        //페이지 번호
        int pageNum = productDto.getPageNum();

        //첫글 번호
        int startIndex = (pageNum-1)*10 +1;

        //끝글 번호
        int endIndex = startIndex + (10-1);

        productDto.setStartIndex(startIndex);
        productDto.setEndIndex(endIndex);

        List<ProductDto> pList = productService.selectList(productDto);

        pMap.put("pList",pList);

        mav.addObject("pMap",pMap);
        mav.addObject("totalPage", totalPage);
        mav.addObject("total", total);
        mav.addObject("productDto", productDto);
        mav.setViewName("/product/manageMent");

        return mav;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public int delete(@RequestBody ProductDto productDto){

        int pNo = productDto.getProductNo();
        int count = productService.proDelete(pNo);
        return count;
    }


    @RequestMapping(value = "/detail") //상품 상세보기
    public ModelAndView productDetail(@RequestParam("productNo") int productNo){
        ModelAndView mav = new ModelAndView();

        Map<String, Object> pMap = productService.getproduct(productNo);

        mav.addObject("pMap",pMap);
        mav.setViewName("/product/productDetail");
        return mav;
    }

}
