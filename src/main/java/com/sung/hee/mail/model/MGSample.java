package com.sung.hee.mail.model;

import com.sun.jersey.api.client.ClientResponse;
import com.sung.hee.help.EncryptUtil;
import com.sung.hee.user.model.SHUser;
import org.glassfish.jersey.client.authentication.HttpAuthenticationFeature;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Form;
import javax.ws.rs.core.MediaType;

public class MGSample {

    // ...

    public static ClientResponse SendSimple() {

        Client client = ClientBuilder.newClient();
        client.register(HttpAuthenticationFeature.basic(
                "api",
                "pubkey-ba226bee30a6f365e6df45cce9e33d47"
        ));

        WebTarget mgRoot = client.target("https://api.mailgun.net/v3");

        Form reqData = new Form();
        reqData.param("from", "Excited User <cisisn@doblue.ga>");
        reqData.param("to", "cisisn@naver.com");
        reqData.param("subject", "Hello");
        reqData.param("text", "Testing out some Mailgun awesomeness!");

        return mgRoot
                .path("{domain}/messages")
                .resolveTemplate("domain", "doblue.ga")
                .request(MediaType.APPLICATION_FORM_URLENCODED)
                .buildPost(Entity.entity(reqData, MediaType.APPLICATION_FORM_URLENCODED))
                .invoke(ClientResponse.class);
    }

    public static ClientResponse CreateRoute() {

        Client client = ClientBuilder.newClient();
        client.register(HttpAuthenticationFeature.basic(
                "api",
                "pubkey-ba226bee30a6f365e6df45cce9e33d47"
        ));

        WebTarget mgRoot = client.target("https://api.mailgun.net/v3");

        Form reqData = new Form();
        reqData.param("priority", "0");
        reqData.param("description", "Sample route");
        reqData.param("expression", "match_recipient('.*@doblue.ga')");
        reqData.param("action", "forward('http://doblue.ga/messages/')");
        reqData.param("action", "stop()");

        return mgRoot
                .path("/routes")
                .request(MediaType.APPLICATION_FORM_URLENCODED)
                .buildPost(Entity.entity(reqData, MediaType.APPLICATION_FORM_URLENCODED))
                .invoke(ClientResponse.class);
    }

    public static ClientResponse sendCertiMail(SHUser shUser) {

        Client client = ClientBuilder.newClient();
        client.register(HttpAuthenticationFeature.basic(
                "api",
                "key-774874982400a67d8a7d511c1f3266da"
        ));

        WebTarget mgRoot = client.target("https://api.mailgun.net/v3");
        String reciver = shUser.getId(); //받을사람의 이메일입니다.
        String content = "[Sunghere]가입 인증 메일입니다. 본인의 의사가 아니라면 메일을 삭제해주세요."
                + "인증 완료 주소는 < http://www.doblue.ga/emailCerti/" + EncryptUtil.getRSA(shUser.getId()) + " > 입니다.";

        Form reqData = new Form();
        reqData.param("from", "Sunghere Amdin <sunghere@doblue.ga>");
        reqData.param("to", reciver);
        reqData.param("subject", "Sunghere Crowd 가입 인증 메일입니다.");
        reqData.param("text", "Testing out some Mailgun awesomeness!");

        return mgRoot
                .path("{domain}/messages")
                .resolveTemplate("domain", "doblue.ga")
                .request(MediaType.APPLICATION_FORM_URLENCODED)
                .buildPost(Entity.entity(reqData, MediaType.APPLICATION_FORM_URLENCODED))
                .invoke(ClientResponse.class);
    }

}
