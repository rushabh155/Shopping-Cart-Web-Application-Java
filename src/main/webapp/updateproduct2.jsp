<%@page import="com.shoppingcart.dto.Merchant"%>
<%@page import="javax.persistence.Query"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="updateproduct3.jsp">

Enter id:<input type="number" name="id" value=<%= request.getParameter("id") %>><br><br>

Enter name:<input type="text" name="name"> <br><br>

Enter category: <input type="text" name="category"><br><br>

Enter Price:<input type="number" name="price"><br><br>

Enter Stock:<input type="number" name="stock"><br><br>

<input type="submit">

</form>


 
</body>
</html>