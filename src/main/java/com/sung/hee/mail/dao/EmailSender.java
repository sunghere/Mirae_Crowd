package com.sung.hee.mail.dao;

import com.sung.hee.mail.model.MyEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;


@Component
public class EmailSender {

    @Autowired
    protected JavaMailSender mailSender;

    public void SendEmail(MyEmail myEmail) throws Exception {

        MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject(myEmail.getSubject());
        msg.setText(myEmail.getContent());
        msg.setRecipient(RecipientType.TO, new InternetAddress(myEmail.getReciver()));

        mailSender.send(msg);
    }
}

