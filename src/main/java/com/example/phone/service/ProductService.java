package com.example.phone.service;

import com.example.phone.dao.ProductDao;
import com.example.phone.dto.ProductDto;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class ProductService {

    private final ProductDao productDao;

    public ProductService(ProductDao productDao){
        this.productDao = productDao;
    }

    //상품등록
    public Map<String, Object> productInsert(ProductDto productDto, MultipartFile[] file){
        Map<String, Object> pMap = new HashMap<String, Object>();

        int product = productDao.productInsert(productDto); //상품등록

        int itCount = productDao.countInsert(productDto); //상품 재고등록

        for(int i=0; i <file.length; i++) {
            //첨부파일
            String saveDir = "C:\\Program Files\\intellij Workspace\\Phone\\src\\main\\resources\\static\\upload";

            // -원파일이름
            String orgName = file[i].getOriginalFilename();

            // 확장자
            String exName = file[i].getOriginalFilename().substring(file[i].getOriginalFilename().lastIndexOf("."));

            // -저장파일이름
            String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;

            // -파일패스 생성(
            String filePath = saveDir + "\\" + saveName;

            // 파일 사이즈
            long fileSize = file[i].getSize();

            // 파일업로드(복사)
            try {
                byte[] fileData = file[i].getBytes();
                OutputStream out = new FileOutputStream(filePath);
                BufferedOutputStream bout = new BufferedOutputStream(out);

                bout.write(fileData);

                if (bout != null) {
                    bout.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

            // 파일정보 정리
            productDto.setFilePath(filePath);
            productDto.setOrgName(orgName);
            productDto.setSaveName(saveName);
            productDto.setFileSize(fileSize);
            productDto.setRegNo(productDto.getProductNo());

            //DB에저장
            productDao.fileInsert(productDto);
            pMap.put("filePath", filePath);
            pMap.put("orgName", orgName);
            pMap.put("saveName", saveName);
            pMap.put("fileSize", fileSize);
        }

        pMap.put("product",product);
        pMap.put("itCount",itCount);
        return pMap;
    }

    //상품 정보가져오기
    public List<ProductDto> selectList(ProductDto productDto){
        return productDao.selectList(productDto);
    }

    //상품 삭제
    public int proDelete(int productNo){
        int count = productDao.proDelete(productNo);
        count += productDao.invenDelete(productNo);
        return count;
    }

    //글 개수 가져오기
   public int totalCnt(ProductDto productDto){
        return productDao.totalCnt(productDto);
    }

    //상세보기
    public Map<String, Object> getproduct(int productNo){

        Map<String, Object> pMap = new HashMap();

        //상세보기 상품정보
        ProductDto pDto = productDao.getproduct(productNo);

        //상품 사진 리스트
        List<ProductDto> fileList = productDao.selectFile(productNo);

        pMap.put("pDto",pDto);
        pMap.put("fileList",fileList);

        return pMap;
    }

}
