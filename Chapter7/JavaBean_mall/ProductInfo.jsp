<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pinfo" class="mall.ProductInfo" scope="request"/>
<jsp:setProperty property="*" name="pinfo"/>

코드명 : <jsp:getProperty property="code" name="pinfo"/><br>
제품명 : <jsp:getProperty property="name" name="pinfo"/><br>
가격 : <jsp:getProperty property="price" name="pinfo"/><br>
