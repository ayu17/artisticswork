<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>

<%

    
    Connection con = null;
    String url = "jdbc:mysql://localhost:3306/";
	 String dbName = "project";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = "ayush";
    try {
		Class.forName(driver).newInstance();
		con = DriverManager.getConnection(url+dbName,userName,password);
	System.out.println("hello");
    } 
	catch (Exception e) {
      e.printStackTrace();
    }
 %> 

