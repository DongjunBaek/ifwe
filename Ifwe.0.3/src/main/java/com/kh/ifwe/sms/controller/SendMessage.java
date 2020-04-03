package com.kh.ifwe.sms.controller;

import com.nexmo.client.NexmoClient;
import com.nexmo.client.sms.MessageStatus;
import com.nexmo.client.sms.SmsSubmissionResponse;
import com.nexmo.client.sms.messages.TextMessage;

import static com.kh.ifwe.sms.quickstart.Util.*;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SendMessage {

	@ResponseBody
	@PostMapping("/sms/sms.do")
    public String sms(@RequestParam("phoneNum")String phoneNum){
        configureLogging();

        System.out.println("phoneNum="+phoneNum);
        String pNum = phoneNum.substring(1);
        System.out.println(pNum);
        
        
        String NEXMO_API_KEY = "cbf2edb6";
        String NEXMO_API_SECRET = "PkArR2uAtplVCwAA";
        String TO_NUMBER = "82"+pNum;
        String NEXMO_BRAND_NAME = "ifwe";

        NexmoClient client = NexmoClient.builder().apiKey(NEXMO_API_KEY).apiSecret(NEXMO_API_SECRET).build();

        int rNum =  (int)(Math.random() * 999999 + 1);
        System.out.println(rNum);
        String.valueOf(rNum);
        TextMessage message = new TextMessage(NEXMO_BRAND_NAME,
                TO_NUMBER,
                String.valueOf(rNum)
        );

        SmsSubmissionResponse response = client.getSmsClient().submitMessage(message);

        if (response.getMessages().get(0).getStatus() == MessageStatus.OK) {
            System.out.println("Message sent successfully.");
        } else {
            System.out.println("Message failed with error: " + response.getMessages().get(0).getErrorText());
        }
        
        return String.valueOf(rNum); 
    }
}
