<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
	 <br>
	 
	 <%
	 int fstNum = 1, scdNum = 1, NumTemp = 0, count = 0;
	 %>
	 <table border = "1"><%
	 	while(count < 11){ %>
	 	<tr>
	 	<%for(int i = 1; i <= 3; i++){%>
	 		<td><%=fstNum %></td>
	 		<% 	NumTemp = fstNum + scdNum; 
	 			fstNum = scdNum;
	 			scdNum = NumTemp;%>
	 			<%} %>
	 	</tr>
	 	<%
	 	count ++;
	 	} %>
	 </table>
	 
	 
<table border = "1">
	<tr>
		<td>ID</td>
		<td>카테고리명</td>
		<td>이름</td>
		<td>가격</td>
		<td>재고</td>
		<td>설명</td>
		<td>원산지</td>
	</tr>
<%
try
{  
	//step1 load the driver class  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	  
	//step2 create  the connection object  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	  
	//step3 create the statement object  
	Statement stmt=con.createStatement();  
	  
	//step4 execute query  
	String query = 	"SELECT " +
					"PRODUCT.ID AS PRO_ID, CATEGORY.NAME AS CATEGORY_NAME, PRODUCT.NAME AS PRO_NAME, PRODUCT.PRICE AS PRO_PRC, PRODUCT.STOCK AS PRO_STK, PRODUCT.DESCRIPTION AS PRO_DET, PRODUCT.ORIGIN AS PRO_ORG " +
					"FROM " +
					"PRODUCT, CATEGORY " +
					"WHERE " +
					"PRODUCT.CATEGORY_ID = CATEGORY.ID ";
	
	
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
		
		%><td><%=rs.getInt("PRO_ID")%></td><%
		%><td><%=rs.getString("CATEGORY_NAME")%></td><%
		%><td><%=rs.getString("PRO_NAME")%></td><%
		%><td><%=rs.getInt("PRO_PRC")%></td><%
		%><td><%=rs.getInt("PRO_STK")%></td><%
		%><td><%=rs.getString("PRO_DET")%></td><%
		%><td><%=rs.getString("PRO_ORG")%></td><%
														
		
		%></tr><%
	}
	
	  
	//step5 close the connection object  
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table>

<br><br><br>

<table border = "1">
	<tr>
		<td>ID</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>이메일</td>
		<td>핸드폰번호</td>
		<td>주소</td>
		<td>나이</td>
	</tr>
<%
try
{  
	//step1 load the driver class  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	  
	//step2 create  the connection object  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	  
	//step3 create the statement object  
	Statement stmt=con.createStatement();  
	  
	//step4 execute query  
	String query = 	"SELECT " +
					"ID, PASSWORD, NAME, EMAIL, PHONE, ADDRESS, AGE " +
					"FROM " +
					"MEMBER ";
	
	
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
		
		%><td><%=rs.getInt("ID")%></td><%
		%><td><%=rs.getString("PASSWORD")%></td><%
		%><td><%=rs.getString("NAME")%></td><%
		%><td><%=rs.getString("EMAIL")%></td><%
		%><td><%=rs.getString("PHONE")%></td><%
		%><td><%=rs.getString("ADDRESS")%></td><%
		%><td><%=rs.getInt("AGE")%></td><%
														
		
		%></tr><%
	}
	
	  
	//step5 close the connection object  
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table>

<br><br><br>

<table border = "1">
	<tr>
		<td>ID</td>
		<td>단가</td>
		<td>구매 갯수</td>
	</tr>
<%
try
{  
	//step1 load the driver class  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	  
	//step2 create  the connection object  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	  
	//step3 create the statement object  
	Statement stmt=con.createStatement();  
	  
	//step4 execute query  
	String query = 	"SELECT " +
					"PAYMENT_HISTORY.ID AS PMT_ID, PRODUCT.PRICE AS PRO_PRC, ORDER_COUNT AS PMT_ODER_CNT " +
					"FROM " +
					"PRODUCT, PAYMENT_HISTORY " +
					"WHERE " +
					"PRODUCT.ID = PAYMENT_HISTORY.PRODUCT_ID ";
		
	
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%		
			%><td><%=rs.getInt("PMT_ID")%></td><%
			%><td><%=rs.getString("PRO_PRC")%></td><%
			%><td><%=rs.getString("PMT_ODER_CNT")%></td><%	
		%></tr>
	<%
	}	
	  
	//step5 close the connection object
	con.commit();
	con.close();  
	  
}	
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table>
</body>
</html>