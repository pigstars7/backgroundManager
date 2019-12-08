package com.hq.util;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;



/**
 * @作者: chencong
 * @项目: mail--cc.ccoder.mail.utils
 * @时间: 2017年6月8日上午11:12:10
 * @TODO：随机产生验证码
 */
public class RandonNumberUtils {

/*
    *//**
     * 随机生成字符 或 者数字
     * @return
     *//*
    private static String getRandom(){
        String value = "";
        Random random = new Random();
        int gen = random.nextInt(2);
        String charOrNum = gen % 2 ==0 ? "char":"num";
        if ("char".equals(charOrNum)) {
            //字符
            int temp = random.nextInt(2)%2==0?65:97;
            int ascii = random.nextInt(26);
            value += (char)(ascii + temp);
        }else if ("num".equals(charOrNum)) {
            //是数字
            value += String.valueOf(random.nextInt(10));
        }
        return value;
    }

    *//**
     * 随机生成字符串（包含字符和数字）
     * @param length 指定长度
     * @return 返回set
     *//*
    private static Set<String> getStrAndNum(int length) {
        Set<String> set = new HashSet<>();
        for (int i = 0; i < length; i++) {
            String value = getRandom();
            set.add(value);
        }
        //若生成的字符串没达到指定长度 继续生成
        if (set.size() < length) {
            String value = getRandom();
            set.add(value);
        }
        return set;
    }

    *//**
     * 存放在set中的字符组拼接成字符串
     * @param set
     * @return
     *//*
    private static  String printSet(Set set){ //打印set的方法
        Iterator iterator = set.iterator();
        String value = "";
        while (iterator.hasNext()) {
           //String ele = (String) iterator.next();
           value += (String)iterator.next();
        }
        return value;
       }

    *//**
     * 返回生成的随机字符串
     * @param length 指定随机字符串长度
     * @return 指定长度 大于零 返回指定长度随机字符，小于等于零 返回null
     *//*
   public static String getRandonString(int length){
        String value= "";
        if (length > 0) {
            //如果返回的字符串小于指定长度 重新生成
            if (value.length() < length) {
                Set<String> store = getStrAndNum(length);
                value = printSet(store);
            }
            return value;
        }else{
            return value;
        }
    }*/
    /**
     * 生成数字验证码
     * @param length
     * @return
     */
    public static String randIntStr(int length){
       StringBuilder sb=new StringBuilder();
       for(int i=0;i<length;i++)
       {
    	   sb.append((int)(Math.random()*10));
       }
       
       return sb.toString();
    }
    
    public static void sendRandCodeByaliy(String msg,String phone)
    {
    	DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAIP57z0tmutdH5", "NOhejSnf4MJKtVy1FQunveFN5AwAqf");
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        //request.setProtocol(ProtocolType.HTTPS);
        request.setMethod(MethodType.POST);
        request.setDomain("dysmsapi.aliyuncs.com");
        request.setVersion("2017-05-25");
        request.setAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", phone);
        request.putQueryParameter("SignName", "环球第二家园");
        request.putQueryParameter("TemplateCode", "SMS_158949080");
        request.putQueryParameter("TemplateParam", "{\"code\":\""+msg+"\"}");
        try {
            CommonResponse response = client.getCommonResponse(request);
         //  System.out.println(response.getData());
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
     /*   System.out.println("4位随机验证码：  " + getRandonString(4));
        System.out.println("5位随机验证码：  " + getRandonString(5));
        System.out.println("6位随机验证码：  " + getRandonString(6));
        */
        System.out.println(randIntStr(4));
        sendRandCodeByaliy(randIntStr(4),"13991313435");
    }
}
