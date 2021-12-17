package mailtest;

import javax.mail.PasswordAuthentication;
import javax.mail.Authenticator;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
	
	public GoogleAuthentication() {
		passAuth = new PasswordAuthentication("nouriuri@gmail.com", "okfvruvqhjgzxeas");
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}
}
