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

 //int id = request.getParameter("eventID");
 //String name = request.getParameter("eventNAME");
 //name = URLDecoder.decode(name, "EUC-KR");
 //String content = request.getParameter("eventCONTENT");
 //content = URLDecoder.decode(content, "EUC-KR");
 //String location = request.getParameter("eventLOCATION");
 //location = URLDecoder.decode(location, "EUC-KR");

 String sb = String.format("SELECT COURSEKEY, CNAME, CSTART_DATE, CLOCATION FROM tibero.course ORDER BY COURSEKEY;");


 JSONArray arr = new JSONArray();
 JSONObject tmpJson = new JSONObject();

 int id = 0;
 String name = "";
 String startdate = "";
 String location = "";

 try {
  String strSql = sb.toString();
  System.out.println(strSql); // log
  pstmt = con.prepareStatement(strSql);
  rs = pstmt.executeQuery();

  while (rs.next()){
    id = rs.getInt("COURSEKEY");
    name = rs.getString("CNAME");
    startdate = rs.getString("CSTART_DATE");
    location = rs.getString("CLOCATION");
    tmpJson.put("courseID", id);
    tmpJson.put("courseNAME", name);
    tmpJson.put("courseSTART_DATE", startdate.substring(0,10));
    tmpJson.put("courseLOCATION", location);
    arr.add(tmpJson);
      }

  } catch (SQLException e){
      e.printStackTrace();
  }
  outJson.put("arr", arr);
  out.println(outJson.toString());

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

