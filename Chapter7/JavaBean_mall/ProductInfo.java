package mall;

public class ProductInfo {
	protected String code;
	protected String name;
	protected int price;
	
	public String getCode() {
		return code;
	}	
	public String getName() {
		return name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setCode(String code) {
		this.code = code;
	}	
	public void setName(String name) {
		this.name = name;
	}
	
}


