<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UTF-8</title>
</head>
<body>

<table border = "1" >
	<tr>
		<td>이름</td>
		<td>전화번호</td>
		<td>구매금액</td>
		<td>상품 ID</td>
		<td>구매 개수</td>
	</tr>
<%

String BackNumber = request.getParameter("phoneNumber");
String email = request.getParameter("email");

try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
	Statement select_stmt = con.createStatement();
	
	String select_query = 	"SELECT " +
					"MEMBER.EMAIL AS 이메일, " +
					"MEMBER.NAME AS 이름, " +
					"MEMBER.PHONE AS 전화번호, " +
					"PAYMENT_HISTORY.ORDER_PRICE AS 구매금액, " +
					"PAYMENT_HISTORY.PRODUCT_ID AS 상품ID, " +
					"PAYMENT_HISTORY.ORDER_COUNT AS 구매개수 " +
					"FROM " +
					"PAYMENT_HISTORY, MEMBER " +
					"WHERE " +
					"MEMBER.ID = PAYMENT_HISTORY.MEMBER_ID ";
	
	if (BackNumber != null) {
		select_query += "AND MEMBER.PHONE like '%" + BackNumber + "'";
	}
	
	if (email!= null) {
		select_query += "AND MEMBER.EMAIL like '%" + email+ "%'";
	}
	
	%> <%=select_query%> <%
	
	ResultSet rs = select_stmt.executeQuery(select_query);
	while(rs.next()) {
		%><tr><%
			%><td><%=rs.getString("이메일") %></td><%
			%><td><%=rs.getString("이름") %></td><%
			%><td><%=rs.getString("전화번호") %></td><%
			%><td><%=rs.getInt("구매금액") %></td><%
			%><td><%=rs.getInt("상품ID") %></td><%
			%><td><%=rs.getInt("구매개수") %></td><%	
		%></tr><%
	}
							
    
    con.commit();
    con.close();
}
catch(Exception e)
{ 
    System.out.println(e);
}
%>

</table>

<p>Enter BackNumber to Search</p>
<input type="text" id="phoneNumber">
<p>Enter Email to Search</p>
<input type="text" id="email">
<input type="button" onclick="search_number()" value="search">

<script>
	function search_number() {
		const email  = document.getElementById("email").value;
		const NumberToSearch = document.getElementById("phoneNumber").value;
		
		redirect_with_get_params(phoneNumber, email);
	}
	
	function redirect_with_get_params(phoneNumber, email) {
		window.location.href = 'findPhoneNumber.jsp?BackNumber=' + phoneNumber + '&email =' + email;
	}
</script>

</body>
</html>