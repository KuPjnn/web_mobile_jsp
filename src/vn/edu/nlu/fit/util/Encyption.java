package vn.edu.nlu.fit.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encyption {

    private static String MD5(String str) {
        String result = "";
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("MD5");
            digest.update(str.getBytes());
            BigInteger bigInteger = new BigInteger(1, digest.digest());
            result = bigInteger.toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String MyEncypt(String input) {
        StringBuilder sb = new StringBuilder();
        String pass = Encyption.MD5(input);
        char[] chars = pass.toCharArray();
        for (int i = 0; i < chars.length; i++) {
            int x = Integer.parseInt(Integer.toHexString(chars[i])) + 1;
            int y = (chars.length > i + 1) ? Integer.parseInt(Integer.toHexString(chars[i + 1])) % 2 : 0;
            int decimal = Integer.parseInt(String.valueOf(x + y), 16);
            sb.append((char) decimal);
        }
        return sb.toString();
    }

}
