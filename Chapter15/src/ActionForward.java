package vo;

public class ActionForward {

	private String path;
	private boolean redirect;
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
}
//안에 두가지 값이 들어가는데, 하나는 경로, 하나는 다이레트방식 사용여부 결정. 
//비지니스 로직 실행시킨 이후에 넘겨줄 데이터가 있으면 디스패치 방식으로 가야함. 
//그래서 다이렉트가 false면 디스패치로 씀. 
//