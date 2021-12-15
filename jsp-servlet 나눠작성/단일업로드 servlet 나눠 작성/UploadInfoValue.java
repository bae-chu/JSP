package vo;

public class UploadInfoValue {
	String name="";	//nullpointException 발생하지 않도록 빈문자열 줌. 아니면 오류났을때 null값 넘어가서 오류뜸. 
	String subject="";
	String filename1="";
	String filename2="";
	String origfilename1="";
	String origfilename2="";
	//변수선언해주고, getter setter 만들어주기 
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFilename1() {
		return filename1;
	}
	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}
	public String getFilename2() {
		return filename2;
	}
	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}
	public String getOrigfilename1() {
		return origfilename1;
	}
	public void setOrigfilename1(String origfilename1) {
		this.origfilename1 = origfilename1;
	}
	public String getOrigfilename2() {
		return origfilename2;
	}
	public void setOrigfilename2(String origfilename2) {
		this.origfilename2 = origfilename2;
	}
	
	
}

/*
	request.setAttribute("name", name);
			request.setAttribute("subject", subject);
			request.setAttribute("filename1", filename1);
			request.setAttribute("filename2", filename2);
			request.setAttribute("origfilename1", origfilename1);
			request.setAttribute("origfilename2", origfilename2);

*/