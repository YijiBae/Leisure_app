<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.sf.json.*" %>
<% request.setCharacterEncoding("UTF-8");%>

<%
Connection con = null;
//ResultSet rs = null ;
PreparedStatement pstmt = null;
ResultSet rs = null;

JSONObject outJson = new JSONObject();
//outJson.put("svc","json_test");

try {
 //DB커넥션
 String DB_URL      = "jdbc:tibero:thin:@180.71.58.133:8629:tibero";
 String DB_USER     = "tibero";
 String DB_PASSWORD = "tibero123!";
 Class.forName("com.tmax.tibero.jdbc.TbDriver");

 con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

 String id = request.getParameter("userID");
 String pw = request.getParameter("userPW");
 String name = request.getParameter("userNAME");
 String role = request.getParameter("userROLE");
 role = URLDecoder.decode(role, "EUC-KR");
 String local = request.getParameter("userLOCAL");
 local = URLDecoder.decode(local, "EUC-KR");
 String family = request.getParameter("userFAMILY");

 String sb = String.format("insert into tibero.userdata"+"(ID, PW, NAME, ROLE, LOCAL, FAMILY) values ('%s', '%s', '%s', '%s', '%s', '%s');", id, pw, name, role, local, family);

 String strSql = sb.toString();
 System.out.println(strSql); // log

 //sql호출
 pstmt = con.prepareStatement(strSql);
 rs = pstmt.executeQuery();
 out.println("strSql : \n" + strSql);
 //out.println("rs : " + rs);
 con.commit();

%>


<%
} catch (Exception e) {
  e.printStackTrace();
} finally {
 if(rs!=null) rs.close();
 if(pstmt!=null) pstmt.close();
 if(con!=null) con.close();
}

%>

