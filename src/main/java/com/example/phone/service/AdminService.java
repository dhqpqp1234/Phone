package com.example.phone.service;

import com.example.phone.dao.AdminDao;
import com.example.phone.dto.AdminDto;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class AdminService {
    private final AdminDao adminDao;

    public AdminService(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    //////////////////////////////////// 관리자  //////////////////////////////////////////
    public int adminIdCheck(String buyerId){ //id중복체크

        int result = adminDao.adminIdCheck(buyerId);

        return result;
    }

    public int adminInsert(AdminDto adminDto){ //회원가입
        int count = adminDao.adminInsert(adminDto);
        return count;
    }

    public AdminDto adminLogin(AdminDto adminDto){ // 로그인
        System.out.println("Controller-->Service");
        System.out.println(adminDto + "adminDto");
        return adminDao.adminLogin(adminDto);
    }

    public void certifiedPhoneNumber(String phoneNum, String cerNum){ //인증문자

        String api_key = "NCS19SZWQ2HGDT9I";
        String api_secret = "ZDWATOO43AOU0ZMFNFXI3GK9IVKZP7OC";
        Message coolsms = new Message(api_key, api_secret);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNum);    // 수신전화번호
        params.put("from", "01075419768");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "지웅전자 휴대폰인증 메시지 : 인증번호는" + "["+cerNum+"]" + "입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }

    }
}
