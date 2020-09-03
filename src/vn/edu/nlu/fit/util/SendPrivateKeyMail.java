package vn.edu.nlu.fit.util;

import vn.edu.nlu.fit.constant.MyConstant;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.nio.charset.StandardCharsets;
import java.util.Properties;

public class SendPrivateKeyMail {
	public static boolean send(String toMail, String privateKey) {
		try {
			Properties mailServerProperties;
			Session getMailSession;
			MimeMessage mailMessage;

			// Step1: setup Mail Server
			mailServerProperties = System.getProperties();
			mailServerProperties.put("mail.smtp.port", "587");
			mailServerProperties.put("mail.smtp.auth", "true");
			mailServerProperties.put("mail.smtp.starttls.enable", "true");
			mailServerProperties.put("mail.default-encoding", "UTF-8");
			// Step2: get Mail Session
			getMailSession = Session.getDefaultInstance(mailServerProperties, null);
			mailMessage = new MimeMessage(getMailSession);
			mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail)); // Thay

			// Có thể chọn CC, BCC
			//generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("cc@gmail.com")); //Địa chỉ cc gmail
			mailMessage.setSubject("Private Key Saitama", StandardCharsets.UTF_8.name());

			//3) create MimeBodyPart object and set your message content
			BodyPart messageBodyPart1 = new MimeBodyPart();
			messageBodyPart1.setContent(
					"<div align='center'>" +
							"<h3>Đây là khóa bí mật của bạn dùng cho xác thực thanh toán đơn đặt hàng</h3>" +
							"</div>",
					"text/html; charset=UTF-8");
			//4) create new MimeBodyPart object and set DataHandler object to this object
			MimeBodyPart messageBodyPart2 = new MimeBodyPart();

			DataSource source = new FileDataSource(MyConstant.KEY_FOLDER + privateKey + ".private");
			messageBodyPart2.setDataHandler(new DataHandler(source));
			messageBodyPart2.setFileName(source.getName());


			//5) create Multipart object and add MimeBodyPart objects to this object
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart1);
			multipart.addBodyPart(messageBodyPart2);

			//6) set the multiplart object to the message object
			mailMessage.setContent(multipart);

			// Step3: Send mail
			Transport transport = getMailSession.getTransport("smtp");
			transport.connect("smtp.gmail.com", "l0vemarrykun@gmail.com", "01259157487");
			transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
			transport.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static void main(String[] args) {
		SendPrivateKeyMail.send("", "");
	}
}
