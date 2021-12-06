package scope;

public class AppScope {
	private int cnt;

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = this.cnt+1;
	}
	public void setCntZero() {
		this.cnt=0;
	}

}
