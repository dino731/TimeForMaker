<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        // Database connection setup
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ADMIN", "ADMIN");
    } catch (Exception e) {
        e.printStackTrace();
    }

    String contextPath = request.getContextPath();
%>

<html>
<head>
    <title>Title</title>
</head>
<body>

<script>
    function suc() {
        <% 
        String msg = "";
        if (request.getMethod().equalsIgnoreCase("POST")) {
            try {
                request.setCharacterEncoding("UTF-8");
                String query = "INSERT INTO RESERVATION (RESERVATION_NO, RESERVATION_DATE, RESERVATION_STATUS, RESERVATION_TIME, PAYMENT_STATUS, USER_NUM, USER_ID, PRODUCT_NO) VALUES (RESERVATION_SEQ.NEXTVAL, ?, ?, TO_CHAR(SYSDATE, 'HH24:MI'), ?, ?, ?, ?)";
     
                pstmt = conn.prepareStatement(query);
     
                pstmt.setString(1, request.getParameter("RESERVATION_DATE"));
                pstmt.setString(2, request.getParameter("RESERVATION_STATUS"));
                pstmt.setString(3, request.getParameter("PAYMENT_STATUS"));
                pstmt.setInt(4, Integer.parseInt(request.getParameter("USER_NUM")));
                pstmt.setString(5, request.getParameter("USER_ID"));
                pstmt.setString(6, (request.getParameter("PRODUCT_NO")));
     
                pstmt.executeUpdate();
     
                conn.commit();
                    
                msg = "예약에 성공했습니다. 메인페이지로 이동합니다.";
                 
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        %>
        alert("<%= msg %>");
        window.location.href = '<%= contextPath %>';
    }

    document.addEventListener('DOMContentLoaded', function() {
        suc();
    });
</script>

</body>
</html>