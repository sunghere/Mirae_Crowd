package com.sung.hee.mail.model;

/**
 * Created by SungHere on 2017-06-23.
 */

import org.glassfish.jersey.client.ClientResponse;
import org.glassfish.jersey.client.authentication.HttpAuthenticationFeature;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Form;
import javax.ws.rs.core.MediaType;

public class MailGunApi {

    // ...

    public static ClientResponse SendSimple() {

        Client client = ClientBuilder.newClient();
        client.register(HttpAuthenticationFeature.basic(
                "api",
                "pubkey-ba226bee30a6f365e6df45cce9e33d47"
        ));

        WebTarget mgRoot = client.target("https://api.mailgun.net/v3");

        Form reqData = new Form();
        reqData.param("from", "Excited User <YOU@YOUR_DOMAIN_NAME>");
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
}