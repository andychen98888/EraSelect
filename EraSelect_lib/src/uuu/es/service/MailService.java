package uuu.es.service;

import java.io.File;
import java.io.StringWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

/**
 *
 * @author Administrator
 */
public class MailService {
	
	//轉到首頁
    public static void sendHelloMailWithLogo(String to) {
        if (to == null) 
            throw new IllegalArgumentException("email不得為null");
        

        //以下為寄件所需的SMTP伺服器與帳號設定，這裡使用gmail的SMTP Server
        final String host = "smtp.gmail.com";
        final int port = 587;
        final String username = "java5597.ucom@gmail.com";     
        final String pwd2 = "ddugqqovglidzicl";
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", port);
        
        //Properties props = new Properties();
        props.put("mail.imap.ssl.enable", "true"); // required for Gmail
        props.put("mail.imap.sasl.enable", "true");
//        props.put("mail.imap.sasl.mechanisms", "XOAUTH2");
        props.put("mail.imap.auth.login.disable", "true");
        props.put("mail.imap.auth.plain.disable", "true");        
//        Session session = Session.getInstance(props);
        

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, pwd2);
            }
        });
        try {       
            // 以下建立message物件作為mail的內容
            Message message = new MimeMessage(session);

            // Set 收件email: header field of the header.
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

            // Set Subject: header field
            message.setSubject("歡迎光臨，EraSelect"); //TODO: 非常好書改成你的網站名稱

            // This mail has 2 part, the BODY and the embedded image
            MimeMultipart multipart = new MimeMultipart("related");

            // first part (the html)            
            BodyPart messageBodyPart = new MimeBodyPart();

            Map<String, Object> map = new HashMap<>();
            map.put("title", "EraSelect");//TODO: 非常好書改成你的網站名稱
            String ipAddress = java.net.InetAddress.getLocalHost().getHostAddress();
            map.put("host", ipAddress);
            map.put("contextPath", "es");//TODO: 改成你的contextPath
            map.put("port", "8080");
            map.put("webSiteName", "EraSelect"); //TODO: 非常好書改成你的網站名稱
            //map.put("bolabola", "廢話");
            String htmlText = MailService.processTemplateWithMap("welcome.ftl", map);
            messageBodyPart.setContent(htmlText, "text/html;charset=utf-8");
            // add it
            multipart.addBodyPart(messageBodyPart);

            // second part (the image)
            String filename = "ftl/shoppingbag.png";
            messageBodyPart = new MimeBodyPart();

            //取得網站上的圖檔
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            URL url = classLoader.getResource("/" + filename);
            System.out.println("url = " + url);
            String imagePath = filename;
            if (url != null) {
                imagePath = url.getPath();
            }
            System.out.println("imagePath = " + imagePath);

            DataSource fds = new FileDataSource(imagePath);
            messageBodyPart.setDataHandler(new DataHandler(fds));
            messageBodyPart.setFileName(filename);
            messageBodyPart.setHeader("Content-ID", "<image>");

            // add image to the multipart
            multipart.addBodyPart(messageBodyPart);

            // put everything together
            message.setContent(multipart);
            // Send message
            Transport.send(message);

            System.out.println("Sent message successfully....");
        } catch (Exception ex) {
            System.out.println("ex = " + ex);
            if (ex.getCause() != null) {
                System.out.println("ex.getCause():" + ex.getCause());
            }
        }
    }

    public static String processTemplateWithMap(String fileName, Map map) {
        final String ftlDir = "ftl";
        try {

            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            URL url = classLoader.getResource("/" + ftlDir);
            System.out.println("url = " + url);
            String ftlPath = ftlDir;
            if (url != null) {
                ftlPath = url.getPath();
            }
            System.out.println("ftlPath = " + ftlPath);
            File dir = new File(ftlPath);

            Configuration cfg = new Configuration(Configuration.VERSION_2_3_23);
            cfg.setDirectoryForTemplateLoading(dir);
            cfg.setDefaultEncoding("UTF-8");
            cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
            Template template = cfg.getTemplate(fileName);
            try (StringWriter stringWriter = new StringWriter();) {
                template.process(map, stringWriter);
                System.out.println(stringWriter);
                return stringWriter.toString();
            }
        } catch (Exception ex) {
            Logger.getLogger(MailService.class.getName()).log(Level.SEVERE, "取得Email樣本檔案(" + fileName + ")失敗", ex);
            throw new RuntimeException("取得Email樣本檔案(" + fileName + ")失敗", ex);
        }
    }
    
    //傳送訂單
    public static void sendCheckOutSuccess(String to, int orderId) {
        if (to == null) 
            throw new IllegalArgumentException("email不得為null");
        

        //以下為寄件所需的SMTP伺服器與帳號設定，這裡使用gmail的SMTP Server
        final String host = "smtp.gmail.com";
        final int port = 587;
        final String username = "java5597.ucom@gmail.com";    
        final String pwd2 = "ddugqqovglidzicl"; 
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", port);
        
        //Properties props = new Properties();
        props.put("mail.imap.ssl.enable", "true"); // required for Gmail
        props.put("mail.imap.sasl.enable", "true");
//        props.put("mail.imap.sasl.mechanisms", "XOAUTH2");
        props.put("mail.imap.auth.login.disable", "true");
        props.put("mail.imap.auth.plain.disable", "true");        
//        Session session = Session.getInstance(props);
        

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, pwd2);
            }
        });
        try {       
            // 以下建立message物件作為mail的內容
            Message message = new MimeMessage(session);

            // Set 收件email: header field of the header.
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

            // Set Subject: header field
            message.setSubject("感謝您的購買，EraSelect"); //TODO: 非常好書改成你的網站名稱

            // This mail has 2 part, the BODY and the embedded image
            MimeMultipart multipart = new MimeMultipart("related");

            // first part (the html)            
            BodyPart messageBodyPart = new MimeBodyPart();

            Map<String, Object> map = new HashMap<>();
            map.put("title", "EraSelect");//TODO: 非常好書改成你的網站名稱
            String ipAddress = java.net.InetAddress.getLocalHost().getHostAddress();
            map.put("host", ipAddress);
            map.put("contextPath", "es");//TODO: 改成你的contextPath
            map.put("port", "8080");
            map.put("webSiteName", "EraSelect"); //TODO: 非常好書改成你的網站名稱
            map.put("orderId", orderId);
            String htmlText = MailService.processTemplateWithMap("check_out_success.ftl", map);
            messageBodyPart.setContent(htmlText, "text/html;charset=utf-8");
            // add it
            multipart.addBodyPart(messageBodyPart);

            // second part (the image)
            String filename = "ftl/eraselect_icon.png";
            messageBodyPart = new MimeBodyPart();

            //取得網站上的圖檔
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            URL url = classLoader.getResource("/" + filename);
            System.out.println("url = " + url);
            String imagePath = filename;
            if (url != null) {
                imagePath = url.getPath();
            }
            System.out.println("imagePath = " + imagePath);

            DataSource fds = new FileDataSource(imagePath);
            messageBodyPart.setDataHandler(new DataHandler(fds));
            messageBodyPart.setFileName(filename);
            messageBodyPart.setHeader("Content-ID", "<image>");

            // add image to the multipart
            multipart.addBodyPart(messageBodyPart);

            // put everything together
            message.setContent(multipart);
            // Send message
            Transport.send(message);

            System.out.println("Sent message successfully....");
        } catch (Exception ex) {
            System.out.println("ex = " + ex);
            if (ex.getCause() != null) {
                System.out.println("ex.getCause():" + ex.getCause());
            }
        }
    }
}
