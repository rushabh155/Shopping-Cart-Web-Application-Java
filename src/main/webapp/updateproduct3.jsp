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
<%
 
 
String id=request.getParameter("id");
 int id1=Integer.parseInt(id);
 
String name=request.getParameter("name");

String category=request.getParameter("category");

String price=request.getParameter("price");
double price1=Double.parseDouble(price);

String stock=request.getParameter("stock");
int stock1=Integer.parseInt(stock);


EntityManagerFactory emf=Persistence.createEntityManagerFactory("rushabh");
EntityManager em=emf.createEntityManager();
EntityTransaction et=em.getTransaction();

Product product= em.find(Product.class, id1);

product.setName(name);
product.setCategory(category);
product.setPrice(price1);
product.setStock(stock1);

et.begin();
em.merge(product);
et.commit();

PrintWriter pw=response.getWriter();
pw.write("data updated sucessfully");
 

%>
</body>
</html>