<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>query update</title>
</head>
<body>

<table border = "1">
	<tr>
		<td>구매자</td>
		<td>구매금액</td>
	</tr>
	
<%
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
	Statement select_stmt = con.createStatement();
	String select_query = 	"SELECT " +
							"MEMBER.NAME AS 구매자명, SUM(PAYMENT_HISTORY.ORDER_PRICE) AS 구매금액 " +
							"FROM MEMBER, PAYMENT_HISTORY " +
							"WHERE MEMBER.ID = PAYMENT_HISTORY.MEMBER_ID " +
							"GROUP BY MEMBER.NAME " +
							"ORDER BY 구매자명 ";
	
	ResultSet rs = select_stmt.executeQuery(select_query);
	while(rs.next()) {
		%>
			<tr>
				<td><%=rs.getString("구매자명") %></td>
				<td><%=rs.getInt("구매금액") %></td>
			</tr>
		<%
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

</body>
</html>