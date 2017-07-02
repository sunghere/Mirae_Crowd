package com.sung.hee.mail.service;

import com.sung.hee.help.EncryptUtil;
import com.sung.hee.user.model.SHUser;
import net.sargue.mailgun.Configuration;
import net.sargue.mailgun.MailBuilder;

import java.io.UnsupportedEncodingException;


public class MailService {

    public static final Configuration configuration = new Configuration()
            .domain("doblue.ga")
            .apiKey("API Key")
            .from("Doblue", "sunghere@doblue.ga");

    public static void main(String[] args) {
        SHUser user = new SHUser();
        user.setId("cisisn@naver.com");

        sendCertiMail(user);
    }

    public static void sendCertiMail(SHUser shUser) {


        String content = "";
        try {
            content = "인증 완료 주소는\n " + "<a href ='www.doblue.ga/mirae/emailCerti.do?id=" + shUser.getId() + "&en="
                    + EncryptUtil.getEncryptMD5(shUser.getId()) + "'>여기</a>를 눌러 인증해주세요 <br>" +
                    "인증완료 후 서비스 이용이 가능합니다. <br> <b>현재 모든 서비스는  개인 포트폴리오 용도의 가상의 서비스이며, 상업적 용도로써 메일을 수집하지않습니다.</b>" +
                    "<br> 감사합니다. - Sunghere@doblue.ga ";
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        MailBuilder.using(configuration)
                .to(shUser.getName(), shUser.getId())
                .subject("Sunghere 회원가입 인증 요청 메일입니다.")
                .text("[Sunghere]가입 인증 메일입니다. 본인의 의사가 아니라면 메일을 삭제해주세요.")
                .html(content)
                .build()
                .send();

    }

    public static void pwdFindMail(SHUser shUser) {


        String content = null;
        try {
            content = "인증 완료 주소는\n " + "<a href ='www.doblue.ga/mirae/pwdFindCerti.do?id=" + shUser.getId() + "&en="
                    + EncryptUtil.getEncryptMD5(shUser.getId()) + "'>여기</a>를 눌러 인증해주세요 <br>" +
                    "비밀번호는 0000으로 초기화됩니다.<br>마이페이지에서 비밀번호를 변경해주세요.";
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        MailBuilder.using(configuration)
                .to("User", shUser.getId())
                .subject("Sunghere 비밀번호찾기 인증 메일입니다.")
                .text("[Sunghere] 본인의 의사가 아니라면 해당메일로 회신문의주세요.")
                .html(content)
                .build()
                .send();


    }
}
