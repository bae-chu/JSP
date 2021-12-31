package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vo.ActionForward;

public interface Action {
	ActionForward execute (HttpServletRequest request, HttpServletResponse response) throws Exception;
}
//액션 인터페이스 만드는 이유 : 다형성 이용을 하기위해. 
//이걸 사용해서 액션 클래스를 구현하는 메소드를 만듦. 
//그럼 리턴타입이 다 같으니까 하나로 다 호출할 수 있음. 추후 클래스가 추가되더라도 쉽게 사용할 수 있음. 