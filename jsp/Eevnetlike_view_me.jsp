
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

 //행사좋아요(내가 누른, 가족이 누른)
 String id = request.getParameter("userID");

 //좋아요 목록 눌렀을 때
 //내가 좋아요 누른 목록 보여주기
 String Me = String.format("SELECT EVENTKEY, NAME, ESTART_DATE FROM EVENT WHERE EVENTKEY = (SELECT EVENTKEY FROM EVENTLIKES WHERE ID = ('%s'));", id);
 

 
 
 
 
 
 
 
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
