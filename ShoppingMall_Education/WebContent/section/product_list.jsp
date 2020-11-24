<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>s
<h3>상품 목록</h3>

<table border="1">
<%
	try
	{  
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection(  
		"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
		Statement select_stmt=con.createStatement();  
	
		String select_query = 	"SELECT PRODUCT.ID AS ID, CATEGORY.NAME AS NAME, PRODUCT.PRICE AS PRICE, PRODUCT.STOCK AS STOCK, " +
								"PRODUCT.DESCRIPTION AS DESCRIPTION, PRODUCT.ORIGIN AS ORIGIN " +
								"FROM PRODUCT, CATEGORY " +
								"WHERE PRODUCT.CATEGORY_ID = CATEGORY.ID " +
								"ORDER BY PRODUCT.ID ASC";
		%>
		<tr>
			<td>ID</td>
			<td>상품명</td>
			<td>가격</td>
			<td>재고</td>
			<td>상품 설명</td>
			<td>원산지</td>
		</tr>
		<%
		ResultSet rs=select_stmt.executeQuery(select_query);  
		while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt("ID") %></td>
				<td><%=rs.getString("NAME") %></td>
				<td><%=rs.getInt("PRICE") %></td>
				<td><%=rs.getInt("STOCK") %></td>
				<td><%=rs.getString("DESCRIPTION") %></td>
				<td><%=rs.getString("ORIGIN") %></td>
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