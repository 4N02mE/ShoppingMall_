<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String A = "This is String"; %>
	<a> A 는 무슨 글자 일까요? 정답은 : <%=A %></a>
	<br>
	<%
	for(int i = 0; i <= 10; i++) {
		%><a><%=i %></a> <%
	}
	%>
	<br>
	<%
	for(int i = 0; i <= 5; i++) {
		for(int j = 0; j < 5-i; j++) {%>
			&nbsp; <%}
		for(int s = 0; s < i*2-1; s++) {%>
			*<%}%><br>
		<%
	}%>
	<br>
	<%
	for(int i = 0; i < 7; i++) {
		for(int j = 0; j < i; j++) { %>
		*
		<%} %>
		<br>
	<%} %>
	
	<%
	int a = 1, b = 1, temp = 0;
	while(a < 100) {
		temp = a + b;
		a = b;
		b = temp;
		%><p><%=a %></p> <%
	}
	%>
	<br>
	<table border = "1">
	<%
	for(int i = 1; i <= 9; i++) {
		 %><tr><%
		 for (int j = 1; j <= 9; j++) {
			 %><td><a><%=i %> * <%=j %> = <%=i*j %></a></td> <%
		 }
		 %></tr><%
		}
	 %>
	 </table>
	 
	 <table border = "1"><%
	 for(int i = 1; i <= 5; i++) { %>
	 	<tr><%
	 		for(int j = 1; j <= i; j++) {
	 			%><td>*</td><%
	 		} %>
	 		<%for(int k = 1; k <= 5-i; k++) {
	 			%><td></td><%
	 		}
	 			%>
	 		<br><%
	 	} %>
	 	</tr>
	 </table>
	 <table border = "1"><%
	 for(int i = 1; i <= 5; i++) { %>
	 	<tr><%
	 		for(int j = 1; j <= 5-i; j++) {
	 			%><td></td><%
	 		} %>
	 		<%for(int k = 1; k <= i; k++) {
	 			%><td>*</td><%
	 		}
	 			%>
	 		<br><%
	 	} %>
	 	</tr>
	 	</table>
	 <table border = "1"><%
	 for(int i = 1; i <= 3; i++) { %>
	 	<tr><%
	 		for(int j = 1; j <= 3-i; j++) {
	 			%><td></td><%
	 		} %>
	 		<%for(int k = 1; k <= i*2-1; k++) {
	 			%><td>*</td><%
	 		}
	 			%>
	 		<%
	 		for(int n = 1; n <= 3-i; n++) {
	 			%><td></td><%
	 		} %>
	 		<br><%
	 }
	 	%>
	 	</tr>
	 </table>
</body>
</html>