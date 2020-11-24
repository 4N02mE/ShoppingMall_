<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>

<%
String date = request.getParameter("date");
String status = "PAYMENT_WAITING";
int stock = Integer.parseInt(request.getParameter("stock"));
int product_id = Integer.parseInt(request.getParameter("product_id"));
int member_id = Integer.parseInt(request.getParameter("member_id"));


String insert_query = "INSERT INTO PAYMENT_HISTORY(ID, ORDER_DATE, ORDER_STATUS, ORDER_COUNT, ORDER_PRICE, PRODUCT_ID, MEMBER_ID, ADDRESS) " +
			   "VALUES(SEQ_PAYMENT.NEXTVAL, '%s', '%s', %d, %d, '%s', '%s', '%s')";
String select_query = "SELECT PRICE FROM PRODUCT WHERE ID = ";
String select_address_query = "SELECT ADDRESS FROM MEMBER WHERE ID = ";


try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
	Statement select_stmt=con.createStatement();
	Statement insert_stmt=con.createStatement();
	
	select_query += product_id;
	ResultSet rs = select_stmt.executeQuery(select_query);
	rs.next();
	int productPrice = stock * rs.getInt(1);
	rs.close();	
	
	select_address_query += member_id;
	ResultSet addressQueryRs = select_stmt.executeQuery(select_address_query);
	addressQueryRs.next();
	String address = addressQueryRs.getString(1);
	addressQueryRs.close();

	insert_stmt.executeQuery(String.format(insert_query, date, status, stock, productPrice, product_id, member_id, address));
		
	con.commit();
	con.close();
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>