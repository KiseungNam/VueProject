<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.simple.*" %>
<%
	// DB접속정보
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "SCOTT";
	String pw = "1234";
	
	// 접속
	Class.forName(driver);
	Connection db = DriverManager.getConnection(url, id, pw);
	
	// 파라미터 한글 처리
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("user_id");
	
	String sql = "select * from user_table where user_id = ?";
	
	PreparedStatement pstmt = db.prepareStatement(sql);
	pstmt.setString(1, userId);
	
	ResultSet rs = pstmt.executeQuery();
	
	boolean chk = rs.next();
	
	db.close();
%>
{
	"checkResult" : <%= chk %>
}