<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<h3>판매 목록</h3>

<table border="1">
<%
	try
	{  
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection(  
		"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
		Statement select_stmt=con.createStatement();  
	
		String select_query = 	"SELECT PAYMENT_HISTORY.ID AS orderNumber, PAYMENT_HISTORY.ORDER_DATE as orderDate, PAYMENT_HISTORY.ORDER_STATUS as orderStatus, " +
								"PAYMENT_HISTORY.ORDER_COUNT as orderCount, PAYMENT_HISTORY.ORDER_PRICE as orderPrice, PRODUCT.NAME as productName, MEMBER.NAME as memberName " +
								"FROM MEMBER, PAYMENT_HISTORY, PRODUCT " +
								"WHERE MEMBER.ID = PAYMENT_HISTORY.MEMBER_ID AND PRODUCT.ID = PAYMENT_HISTORY.PRODUCT_ID " +
								"ORDER BY PAYMENT_HISTORY.ID ASC";
		%>
		<tr>
			<td>주문 번호</td>
			<td>주문 날짜</td>
			<td>주문 상태</td>
			<td>주문 갯수</td>
			<td>가격</td>
			<td>상품명</td>
			<td>고객명</td>
		</tr>
		<%
		ResultSet rs=select_stmt.executeQuery(select_query);  
		while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt("orderNumber") %></td>
				<td><%=rs.getString("orderDate") %></td>
				<td><%=rs.getString("orderStatus") %></td>
				<td><%=rs.getInt("orderCount") %></td>
				<td><%=rs.getInt("orderPrice") %></td>
				<td><%=rs.getString("productName") %></td>
				<td><%=rs.getString("memberName") %></td>
			</tr>
			<%
		}
		con.close();  
	}
	catch(Exception e)
	{ 
		System.out.println(e);
	}  
%>
</table>