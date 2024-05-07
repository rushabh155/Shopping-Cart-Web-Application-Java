<%@page import="java.util.List"%>
<%@page import="org.hibernate.cache.spi.support.AbstractReadWriteAccess.Item"%>
<%@page import="com.shoppingcart.dto.Items"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="additemstocart2.jsp">

Search Product:<input type="text" name="name"><br><input type="submit" value="search">

</form>

</body>
</html>