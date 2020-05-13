<%@page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="org.json.simple.*"%>

<!-- %!
public syncronized static Connection getTiberoConnection(){
        return ConnectionManager.getConnection("jdbc/dsTiberodb");
}
%-->

<%
Connection con = null;
//ResultSet rs = null ;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
 //DB커넥션
 String DB_URL      = "jdbc:tibero:thin:@180.71.58.133:8629:tibero";
 String DB_USER     = "tibero";
 String DB_PASSWORD = "tibero123!";
 Class.forName("com.tmax.tibero.jdbc.TbDriver");

 con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

 StringBuffer sb = new StringBuffer();
 sb.append("SELECT \n");
 sb.append("       PKEY, NAME, BIRTH \n");
 sb.append("  FROM tibero.T10000 \n");
// sb.append(" where ORD_NO in ('100524367', '100534736')");

 String strSql = sb.toString();
 System.out.println(strSql); // log

 //sql호출
 pstmt = con.prepareStatement(strSql);
 rs = pstmt.executeQuery();
 //out.println("strSql : \n" + strSql);
 //out.println("rs : " + rs);

 JSONArray arr = new JSONArray();
 
 String strORD_NO = "";
 while(rs.next()){
 //if(rs.next()) {
  strORD_NO = URLEncoder.encode(rs.getString("NAME"), "UTF-8");
  JSONObject obj = new JSONObject();
  obj.put("NAME", NAME);
  if (obj != null)
	arr.add(obj);
  //out.println("strORD_NO : " + strORD_NO);
 //}
 }
 out.print(arr);

%>

<script src="/js/jquery-3.4.1.js"></script>
<!--<script type="text/javascript" src="jquery.js"></script>-->
<script type="text/javascript">
 $(document).ready(function(){

         });

</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
</body>
</html>

<%
} catch (Exception e) {
  e.printStackTrace();

} finally {
 if(rs!=null) rs.close();
 if(pstmt!=null) pstmt.close();
 if(con!=null) con.close();
}

%>


