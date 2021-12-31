package vo;

public class PageInfo {

	private int page;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int listCount; //목록 개수
	// 페이지 정보를 담고 있는 클래스. 
	// 게시판이라 불러들이는 자료가 많을경우에 이걸 한페이지에 다 표시할순 없잖아. 그래서 페이지 나누잖음. 
	// 그래서 페이지, 맥스페이지, 시작페이지(1페이지부터 볼건지 10페이지부터 볼건지) 이런거 설정함. 
	// 비즈니스 로직에서 뷰페이지로 넘어갈때 데이터를 넘기기 위해 필요한 자료들을 담는 용도의 클래스. 
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
}
