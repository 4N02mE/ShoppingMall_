<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<table border = "1">
	<tr>
		<td>상품명</td>
		<td>가격</td>
		<td>재고</td>
		<td>상품 설명</td>
		<td>원산지</td>
	</tr>

<%

String price = request.getParameter("PRICE");
String stock = request.getParameter("STOCK");

try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
	Statement select_stmt = con.createStatement();
	
	String select_query = 	"SELECT NAME, PRICE, STOCK, DESCRIPTION, ORIGIN " +
							"FROM PRODUCT ";
	
	if (price != null) {
		select_query += "WHERE PRICE '<=" + price + "' ";
	}
	
	if (stock != null) {
		select_query += "AND STOCK '<=" + stock + "' ";
	}
	
	%> <%=select_query%> <%
	
	ResultSet rs = select_stmt.executeQuery(select_query);
	while(rs.next()) {
		%><tr>
			  <td><%=rs.getString("NAME") %></td><%
			%><td><%=rs.getInt("PRICE") %></td><%
			%><td><%=rs.getInt("STOCK") %></td><%
			%><td><%=rs.getString("DESCRIPTION") %></td><%
			%><td><%=rs.getString("ORIGIN") %></td>
		 </tr><%
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

<p>Enter Price of Product to Search</p>
<input type="text" id="searchPrice1">
<input type="text" id="searchPrice2">
<input type="button" onclick="searchOption ()" value="search">
<p>Enter Stock of Product to Search</p>
<input type="text" id="searchStock1">
<input type="text" id="searchStock2">
<input type="button" onclick="searchOption ()" value="search">

<script>
	function searchOption () {
		const ProductPrice1 = document.getElementById("searchPrice1").value;
		const ProductPrice2 = document.getElementById("searchPrice2").value;
		const ProductStock1 = document.getElementById("searchStock1").value;
		const ProductStock2 = document.getElementById("searchStock2").value;
		
		redirect_with_get_parameters(ProductPrice, ProductStock)
	}
	
	function redirect_with_get_parameters(price, stock) {}
		window.location.href =  'product.jsp?PRICE=' + price + '&stock=' + stock;
	}
</script>
</body>
</html>