package vn.edu.nlu.fit.util;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class sendMail {
    public sendMail() {
    }

    public static void send(String toMail, String code) throws MessagingException {
        Properties mailServerProperties;
        Session getMailSession;
        MimeMessage mailMessage;

        // Step1: setup Mail Server
        mailServerProperties = System.getProperties();
        mailServerProperties.put("mail.smtp.port", "587");
        mailServerProperties.put("mail.smtp.auth", "true");
        mailServerProperties.put("mail.smtp.starttls.enable", "true");

        // Step2: get Mail Session
        getMailSession = Session.getDefaultInstance(mailServerProperties, null);
        mailMessage = new MimeMessage(getMailSession);

        mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail)); // Thay

        // Bạn có thể chọn CC, BCC
        //generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("cc@gmail.com")); //Địa chỉ cc gmail
        mailMessage.setSubject("Forgot Password");
        mailMessage.setText("Mã của bạn là: " + code);

        // Step3: Send mail
        Transport transport = getMailSession.getTransport("smtp");
        transport.connect("smtp.gmail.com", "l0vemarrykun@gmail.com", "01259157487");
        transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
        transport.close();
    }

    private static final String alpha = "abcdefghijklmnopqrstuvwxyz"; // a-z
    private static final String alphaUpperCase = alpha.toUpperCase(); // A-Z
    private static final String digits = "0123456789"; // 0-9
    private static final String ALPHA_NUMERIC = alphaUpperCase + digits;

    private static Random generator = new Random();


    public static String randomAlphaNumeric() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            int number = randomNumber(0, ALPHA_NUMERIC.length() - 1);
            char ch = ALPHA_NUMERIC.charAt(number);
            sb.append(ch);
        }
        return sb.toString();
    }

    public static int randomNumber(int min, int max) {
        return generator.nextInt((max - min) + 1) + min;
    }
}
