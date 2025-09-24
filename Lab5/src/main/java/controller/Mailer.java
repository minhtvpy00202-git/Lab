package controller;

import java.util.Properties;
import javax.mail.*;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailer {

  // TÀI KHOẢN GỬi
  private static final String USERNAME = "minh.tv.nh@gmail.com";
  private static final String APP_PASSWORD = "vgyc jwnt vfbn tfgk"; 

  public static void send(String fromInput, String to, String subject, String body) throws MessagingException {
    Properties props = new Properties();
    props.setProperty("mail.smtp.auth", "true");
    props.setProperty("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.starttls.required", "true");
    props.setProperty("mail.smtp.host", "smtp.gmail.com");
    props.setProperty("mail.smtp.port", "587");              
    props.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");
    props.put("mail.smtp.ssl.protocols", "TLSv1.2");

    Session session = Session.getInstance(props, new Authenticator() {
      @Override protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(USERNAME, APP_PASSWORD);
      }
    });
    session.setDebug(true); 

    MimeMessage mail = new MimeMessage(session);

   
    mail.setFrom(new InternetAddress(USERNAME));

    // reply
    if (fromInput != null && !fromInput.isBlank()) {
      mail.setReplyTo(new Address[]{ new InternetAddress(fromInput) });
    }

    mail.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
    mail.setSubject(subject, "UTF-8");
    mail.setContent(body, "text/html; charset=UTF-8");

    Transport.send(mail);
  }
}
