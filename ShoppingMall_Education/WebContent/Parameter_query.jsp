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

<table border = "1">
<tr>
	<td>ID</td>
	<td>비밀번호</td>
	<td>이름</td>
	<td>이메일</td>
	<td>전화번호</td>
	<td>주소</td>
	<td>나이</td>
</tr>
<%
String phone_number = request.getParameter("test"); // != null ? request.getParameter("test") : "";

try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  
	String query = "SELECT ID, PASSWORD, NAME, EMAIL, PHONE, ADDRESS, AGE FROM MEMBER";
	
	if (phone_number != null) {
		query += " WHERE PHONE like '%" + phone_number + "'";
	}
	
	%> <%=query%> <%
	
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
		%><tr><%
	}
	
	con.commit();
	//step5 close the connection object  
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table>

<p>��ȭ��ȣ �� 4�ڸ��� �Է��Ͽ� �ּ���</p>
<input type="text" id="search_condition">
<input type="button" onclick="click_search()">

<script>
	function click_search() {
		const search_condition = document.getElementById("search_condition").value;
		
		redirect_with_get_params(search_condition);
	}
	
	function redirect_with_get_params(param) {
		window.location.href = 'Parameter_query.jsp?test=' + param;
	}
</script>
</body>
</html>