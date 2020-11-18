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


<%
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
	Statement select_stmt = con.createStatement();
	Statement insert_stmt = con.createStatement();
	
	String select_query =	"SELECT " +
							"MEMBER.NAME AS 구매자명, PRODUCT.NAME AS 상품명, " +
							"PAYMENT_HISTORY.ORDER_COUNT AS 상품갯수, PAYMENT_HISTORY.ORDER_PRICE AS 가격 " +
							"FROM PRODUCT, MEMBER, PAYMENT_HISTORY " +
							"WHERE " +
							"MEMBER.ID = PAYMENT_HISTORY.MEMBER_ID " +
							"AND " +
							"PRODUCT.ID = PAYMENT_HISTORY.PRODUCT_ID ";
	ResultSet rs = select_stmt.executeQuery(select_query);
	int ID_number = 0;
	while(rs.next()) {
		
		String NAME = rs.getString("구매자명");
		String PRODUCT = rs.getString("상품명");
		int COUNT = rs.getInt("상품갯수");
		int PRICE = rs.getInt("가격");
		
		String Log_text = NAME + "님이 " + PRODUCT + "상품을 " + COUNT + "개를 " + PRICE + "원에 구매하셨습니다.";
		String insert_query = "INSERT INTO PURCHASE_LOG(ID, LOG) VALUES(" + (ID_number+1) + ", '" + Log_text + "')";
		//string 추가시 ' ' (싱글쿼터)로 감싸기
		
		System.out.println(insert_query);
		
		insert_stmt.executeQuery(insert_query);
		ID_number++;
	}
    
    con.commit();
    con.close();
}
catch(Exception e)
{ 
    System.out.println(e);
}
%>

</body>
</html>