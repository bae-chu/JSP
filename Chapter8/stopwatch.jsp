<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	var timer,
	i=0, 
	divide = 100;
	var flag=true;
	
	function addZero(num, digit) { //자릿 수 맞춰주기
		var zero = '';
		num = num.toString();
		if(num.length < digit){
			//for(j=0; j<digit-num.length; j++){
				zero += '0';
			// }
		}
		return zero + num;
	}
	
	function start() { // setInterval()은 지정된 시간 후 특정 자바스크립트 코드가 포함된 문자열을 반보갛여 호출하는 메소드
		//지정된 시간 increment()함수를 의미함. 
		if(flag){
			timer = self.setInterval('increment()', (1000/divide));
			flag = false;
		}		
	}
	
	function increment() { 
		i++;
			
		var min = addZero(parseInt(i/6000),2);
		var sec = ((i%6000)/divide).toFixed(2);
		var secArr = sec.toString().split(".");
		secArr[0]=addZero(secArr[0],2);
		
		sec=secArr[0] + "." + secArr[1];
		
		document.getElementById('time_out').innerHTML = min + " : " + sec;
	}
	
	function stop() {
		//clearInerval : setInterval 멈출때 사용함. 
		
		if(!flag){
			clearInterval(timer);
			timer = null;
			flag = true;
		}
	}
	
	function reset() {
		stop();
		i=0;
		document.getElementById('time_out').innerHTML = "00:00.00"; //(i/divide);
	}
</script>
<style>
	#time_out{
		boder:1px solid #eee;
		width:600px;
		height:250px;
		ling-height:250px;
		color:#666;
		font-size:100px;
		text-align: center;
	}
</style>
<body>
	<span id = "time_out">00:00.00</span>
	<br><br>
	<button id = "start_timer" onclick="start()">시작</button>
	<button id = "stop_timer" onclick="stop()">정지</button>
	<button id = "reset_timer" onclick="reset()">reset</button><br><br>
	<input type="button" onclick="start()" value="시작"/>
	<input type="button" onclick="stop()" value="정지"/>
	<input type="button" onclick="reset()" value="reset"/>
</body>
</html>
