<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
Connection con = null;
//ResultSet rs = null ;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
 

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
<h1> Hi Hello Pjt1 !!!</h1>
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



<!-- 출처: https://misslui.tistory.com/33 [안녕~] -->

