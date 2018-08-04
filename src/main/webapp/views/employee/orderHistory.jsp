<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<c:forEach var="innerList" items="${orderHistory}">
			<ol>
			<c:forEach var="obj" items="${innerList}">
				<li>${obj}</li>
			</c:forEach>
			</ol>
		</c:forEach>
	</ul>
	
<form action="/employee/orderInformation">
<input type="submit" value="orderInformation">
<input name="id" value="${id}">
<input name="orderId" value="A11111120180804084045">
</form>
</body>
</html>