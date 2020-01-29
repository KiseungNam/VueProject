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
	
	String sql = "select board_info_idx, board_info_name from board_info_table order by board_info_idx";
	PreparedStatement pstmt = db.prepareStatement(sql);
	// 쿼리실행
	ResultSet rs = pstmt.executeQuery();
	
	JSONArray root = new JSONArray();
	
	while(rs.next()){
		JSONObject obj = new JSONObject();
		
		obj.put("boardInfoIdx", rs.getInt("board_info_idx"));
		obj.put("boardInfoName", rs.getString("board_info_name"));
		
		root.add(obj);
	}
%>
<%= root.toJSONString() %>
<% db.close(); %>