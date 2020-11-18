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

<%
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
    Statement select_stmt = con.createStatement();
    Statement insert_stmt = con.createStatement();
    Statement update_stmt = con.createStatement();
    
    String select_query = "SELECT ID, COL1, COL2, COL3, COL4, AVG_COL FROM MORUGATSUYO";
    ResultSet rs = select_stmt.executeQuery(select_query);
    
 	for(int i = 0; i <= 99; i++) {
    	 int rand1 = (int)(Math.random() * 100);
    	 int rand2 = (int)(Math.random() * 100);
    	 int rand3 = (int)(Math.random() * 100);
    	 int rand4 = (int)(Math.random() * 100);
    	 
    	 String insert_query = "INSERT INTO MORUGATSUYO(ID ,COL1, COL2, COL3, COL4) VALUES("+ (i+1) + "," + rand1 + ", " + rand2 + "," + rand3 + "," + rand4 + ")";
    	 System.out.println(insert_query);
    	 //insert_stmt.executeQuery(insert_query);
    	 }
 	 
 	while(rs.next()) {
 		int A = rs.getInt("COL1");
 		int B = rs.getInt("COL2");
 		int C = rs.getInt("COL3");
 		int D = rs.getInt("COL4");
 		int ID = rs.getInt("ID");

   	 	String update_query = "UPDATE MORUGATSUYO SET AVG_COL = %d WHERE ID = %d";
   	 	System.out.println(String.format(update_query, (A + B + C + D)/4, ID));
   	 	update_stmt.executeQuery(String.format(update_query, (A + B + C + D)/4, ID));
   	 
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