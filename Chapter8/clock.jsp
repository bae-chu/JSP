<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>

	function printClock() {
		var clock = document.getElementById("clock"); //출력 할 장소 선택 
		var currentDate = new Date(); //현재시간 
		var calendar = currentDate.getFullYear() + "-";
		calendar += (currentDate.getMonth()+1) + "-"; // 컴퓨터기준 month, week는  0부터 시작함.. 그래서 +1 해줘야 제대로 날짜 나옴. 
		calendar += currentDate.getDate(); //현재 날짜
		var amPm = 'AM'; //초기값 AM 
		var currentHours = addZero(currentDate.getHours(),2);	
		var currentMinute = addZero(currentDate.getMinutes(),2);
		var currentSeconds = addZero(currentDate.getSeconds(),2);
		// addZero : 원래 1시 2시 이케 표기됨. 자릿수 맞춰서 01시 02시로 표시하기위해서 0 붙일라고 넣음. 안쓰면 안넣어도 됨. 
		// 아래에 0 붙이는 함수 추가로 있음. 
		
		if(currentHours >= 12) { // 시간이 12보다 클 때 pm으로 셋팅, 12를 빼줌 
			amPm = 'PM'; 
			currentHours = addZero(currentHours - 12, 2);
		}
		
		clock.innerHTML = currentHours + " : " + currentMinute+ " : ";
		clock.innerHTML += currentSeconds;
		clock.innerHTML += " <span style = 'font-size:50px;'> " + amPm + " </span>";
		//시간 출력해주기위해 clock 객체안에 innerHTML을 집어넣음 
		
		setTimeout("printClock()", 1000); //1초마다 printClock()함수 호출
	}
	
	function addZero(num, digit) { // 0붙여서 자리 수 맞춰주기 
		var zero = '';
		num = num.toString();
		if(num.length<digit){
			for (i=0; i<digit-num.length; i++){
				zero += '0';
			}
		}
		return zero + num;
	}

</script>
<style>
	#clock{
		border:1px solid #dedede; 
		widht : 600px;
		height : 250px;
		line-height: 250px;
		color:#666;
		font-size: 100px;
		text-align: center;  
	}
</style>
<body onload = "printClock()">
	<div id="clock">
	</div>

</body>
</html>