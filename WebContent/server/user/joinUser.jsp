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
	
	// 브라우저가 전달하는 파라미터를 추출한다.
	String userName = request.getParameter("user_name");
	String userId = request.getParameter("user_id");
	String userPw = request.getParameter("user_pw");
	
	String sql = "insert into user_table (user_idx, user_name, user_id, user_pw) values (user_seq.nextval, ?, ?, ?)";
	
	PreparedStatement pstmt = db.prepareStatement(sql);
	pstmt.setString(1, userName);
	pstmt.setString(2, userId);
	pstmt.setString(3, userPw);
	
	pstmt.execute();
	
	db.close();
	
%>
{
	"result" : true
}
