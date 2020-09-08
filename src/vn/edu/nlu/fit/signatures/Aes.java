package vn.edu.nlu.fit.signatures;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class Aes {
	public static SecretKey generateKey(int keyLength) {
		try {
			KeyGenerator keyGenerator = KeyGenerator.getInstance("AES");
			// key length : 128, 192, 256
			keyGenerator.init(keyLength);
			return keyGenerator.generateKey();
		} catch (Exception e) {
			return null;
		}
	}

	public static SecretKey readKey(String file) {
		try {
			ObjectInputStream ois = new ObjectInputStream(new FileInputStream(new File(file)));
			SecretKey secretKey = (SecretKey) ois.readObject();
			ois.close();
			return secretKey;
		} catch (IOException | ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String encrypt(String mess, SecretKey key) {
		try {
			if (key == null)
				return null;
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.ENCRYPT_MODE, key);
			byte[] pt = mess.getBytes(StandardCharsets.UTF_8);
			return Base64.getEncoder().encodeToString(cipher.doFinal(pt));
		} catch (Exception e) {
			return null;
		}
	}

	public static String decrypt(String text, SecretKey key) {
		try {
			if (key == null)
				return null;

			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.DECRYPT_MODE, key);
			byte[] pt = cipher.doFinal(Base64.getDecoder().decode(text));
			return new String(pt, StandardCharsets.UTF_8);
		} catch (Exception e) {
			return null;
		}
	}

	public static void main(String[] args) throws IOException {
	}
}
