package com.sung.hee.mail.model;

import com.sun.jersey.api.client.ClientResponse;
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
}
