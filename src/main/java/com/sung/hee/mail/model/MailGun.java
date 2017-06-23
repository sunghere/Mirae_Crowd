package com.sung.hee.mail.model;

/**
 * Created by SungHere on 2017-06-23.
 */

import com.sun.mail.smtp.SMTPTransport;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class MailGun {
    public static void main(String args[]) throws Exception {
        Properties props = System.getProperties();
        props.put("mail.smtps.host", "smtp.mailgun.org");
        props.put("mail.smtps.auth", "true");
        Session session = Session.getInstance(props, null);
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress("cisisn@doblue.ga"));
        InternetAddress[] addrs = InternetAddress.parse("cisisn@naver.com", false);
        msg.setRecipients(Message.RecipientType.TO, addrs);
        msg.setSubject("Hello");
        msg.setText("Testing some Mailgun awesomness");
        msg.setSentDate(new Date());
        SMTPTransport t =
                (SMTPTransport) session.getTransport("smtps");
            t.connect("smtp.mailgun.com", "postmaster@doblue.ga", "910013b2e9dba24dae3a893c487e4be3");
        t.sendMessage(msg, msg.getAllRecipients());
        System.out.println("Response: " + t.getLastServerResponse());
        t.close();
    }
}
