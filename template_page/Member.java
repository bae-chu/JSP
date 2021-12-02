package member;

import java.util.ArrayList;

public class Member {
	String id;
	String pass;
	String name;
	String tel;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Member(String id, String pass, String name, String tel) { //생성자(constructor)생성
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.tel = tel;
	}


}
