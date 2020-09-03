package vn.edu.nlu.fit.signatures;

import java.io.BufferedReader;
import java.io.StringReader;
import java.nio.charset.StandardCharsets;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class Signatures {

	public static PublicKey getPublicKey(String key) {
		try {
			// Read in the key into a String
			StringBuilder stringKey = new StringBuilder();
			BufferedReader rdr = new BufferedReader(new StringReader(key));
			String line;
			while ((line = rdr.readLine()) != null) {
				stringKey.append(line);
			}

			//Xóa bỏ các dòng "BEGIN", "END" và các khoảng trắng
			String pem = stringKey.toString();
			pem = pem.replace("-----BEGIN PUBLIC KEY-----", "");
			pem = pem.replace("-----END PUBLIC KEY-----", "");
			pem = pem.replaceAll("\\s+", "");

			// decode Base64
			byte[] decode = Base64.getDecoder().decode(pem);

			// extract the private key
			X509EncodedKeySpec keySpec = new X509EncodedKeySpec(decode);
			KeyFactory kf = KeyFactory.getInstance("RSA");
			return kf.generatePublic(keySpec);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

/*
	private static PrivateKey getPrivateKey(String key) {
		try {
			// Read in the key into a String
			StringBuilder stringKey = new StringBuilder();
			BufferedReader rdr = new BufferedReader(new StringReader(key));
			String line;
			while ((line = rdr.readLine()) != null) {
				stringKey.append(line);
			}

			//Xóa bỏ các dòng "BEGIN", "END" và các khoảng trắng
			String pem = stringKey.toString();
			pem = pem.replace("-----BEGIN PRIVATE KEY-----", "");
			pem = pem.replace("-----END PRIVATE KEY-----", "");
			pem = pem.replaceAll("\\s+", "");

			// decode Base64
			byte[] decode = Base64.getDecoder().decode(pem);

			// extract the private key
			PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(decode);
			KeyFactory kf = KeyFactory.getInstance("RSA");
			return kf.generatePrivate(keySpec);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
*/

/*	public static String encrypt(String plainText, PrivateKey privateKey) throws Exception {
		Cipher encryptCipher = Cipher.getInstance("RSA");
		encryptCipher.init(Cipher.ENCRYPT_MODE, privateKey);

		byte[] cipherText = encryptCipher.doFinal(plainText.getBytes(StandardCharsets.UTF_8));

		return Base64.getEncoder().encodeToString(cipherText);
	}

	public static String decrypt(String cipherText, PublicKey publicKey) throws Exception {
		byte[] bytes = Base64.getDecoder().decode(cipherText);

		Cipher decriptCipher = Cipher.getInstance("RSA");
		decriptCipher.init(Cipher.DECRYPT_MODE, publicKey);

		return new String(decriptCipher.doFinal(bytes));
	}*/

	public static String sign(String plainText, PrivateKey privateKey) throws Exception {
		Signature privateSignature = Signature.getInstance("SHA256withRSA");
		privateSignature.initSign(privateKey);
		privateSignature.update(plainText.getBytes(StandardCharsets.UTF_8));

		byte[] signature = privateSignature.sign();

		return Base64.getEncoder().encodeToString(signature);
	}

	public static boolean verify(String plainText, String signature, PublicKey publicKey) {
		try {
			Signature publicSignature = Signature.getInstance("SHA256withRSA");
			publicSignature.initVerify(publicKey);
			publicSignature.update(plainText.getBytes(StandardCharsets.UTF_8));

			byte[] signatureBytes = Base64.getDecoder().decode(signature);

			return publicSignature.verify(signatureBytes);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
