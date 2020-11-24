<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<h3>판매 등록</h3>
<table border="1">
	<%
	try
	{  
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
	Statement select_stmt=con.createStatement();		
	%>
	<form>
		<tr>
			<td>
				<p>카테고리 ID</p>
			</td>
		</tr>
		<tr>
			<td><p>주문일</p></td>
			<td><input type="date" name="name"></td>
		</tr>
		<tr>
			<td><p>주문 상태</p></td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td><p>주문 갯수</p></td>
			<td><input type="number" name="stock"></td>
		</tr>
		<tr>
			<td><p>가격</p></td>
			<td><input type="number" name="price"></td>
		</tr>
		<tr>
			<td><p>상품명</p></td>
			<td>
				<select name="product_id">
					<%  
					String select_product_query = "SELECT ID, NAME FROM PRODUCT ORDER BY ID ASC";
					ResultSet productRs = select_stmt.executeQuery(select_product_query);
					while(productRs.next()) {
						%><option value=<%=productRs.getInt("ID") %>><%=productRs.getString("NAME") %></option><%
					}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td><p>고객명</p></td>
			<td>
				<select name="member_id">
					<%  
					String select_member_query = "SELECT ID, NAME FROM MEMBER ORDER BY ID";
					ResultSet memberRs = select_stmt.executeQuery(select_member_query);
					while(memberRs.next()) {
						%><option value=<%=memberRs.getInt("ID") %>><%=memberRs.getString("NAME") %></option><%
					}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="제출">
				<input type="button" value="다시쓰기">
			</td>
		</tr>
	</form>
	<%
		con.close();  
		}
	catch(Exception e)
	{ 
	System.out.println(e);
	}  
	%>
</table>