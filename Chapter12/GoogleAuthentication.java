package mailtest;

import javax.mail.PasswordAuthentication;
import javax.mail.Authenticator;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
	
	public GoogleAuthentication() {
		passAuth = new PasswordAuthentication("메일주소", "2단계인증비번");
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}
}
