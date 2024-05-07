<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javax.xml.transform.sax.TransformerHandler"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.Persistence"%>
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
<%

String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String stock=request.getParameter("stock");

double price1=Double.parseDouble(price);
int stock1=Integer.parseInt(stock);


EntityManagerFactory emf=Persistence.createEntityManagerFactory("rushabh");
EntityManager em=emf.createEntityManager();
EntityTransaction et=em.getTransaction();

Merchant m=(Merchant)session.getAttribute("merchant");

Product product=new Product();
product.setName(name);
product.setCategory(category);
product.setPrice(price1);
product.setStock(stock1);


List<Product>products= m.getProducts();
products.add(product);

Merchant merchant=(Merchant)session.getAttribute("merchant");
merchant.setProducts(products);

et.begin();
em.persist(product);
em.merge(merchant);
et.commit();

PrintWriter pw=response.getWriter();
pw.println("Product Added sucessfully");

RequestDispatcher rd=request.getRequestDispatcher("merchantoptions.html");
rd.include(request, response);
response.setContentType("text/html");


%>
</body>
</html>