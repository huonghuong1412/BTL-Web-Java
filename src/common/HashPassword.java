package common;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashPassword {

	public HashPassword() {

	}

	public static String hashMD5(char[] pass) throws NoSuchAlgorithmException, UnsupportedEncodingException {

		MessageDigest digs = MessageDigest.getInstance("MD5");
		digs.update(new String(pass).getBytes(StandardCharsets.UTF_8));

		String hashPass = new String(digs.digest());

		return hashPass;
	}
	
	public static boolean decodeMD5(String pass, String hash) {
		
		String md5 = null;
		
		
		
		return false;
	}

}
