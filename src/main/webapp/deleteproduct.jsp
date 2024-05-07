<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
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

EntityManagerFactory emf=Persistence.createEntityManagerFactory("rushabh");
EntityManager em=emf.createEntityManager();
EntityTransaction et=em.getTransaction();


Query query=em.createQuery("select u from Product u");

  List<Product>products =query.getResultList();

  if(products.size()>0){

%>

 <table cellpadding="20" border="2" align="center">
    	
   	<th>id</th>
   	<th>name</th>
   	<th>category</th>
   	<th>price</th>
   	<th>stock</th>
   	<th>Delete</th>
   	
   <% for(Product product:products) { %>
   	
   	 <tr>
     <td><%=product.getId() %></td>
   	 <td><%=product.getName() %></td>
   	 <td><%= product.getCategory() %></td>
   	 <td><%= product.getPrice() %></td>
   	 <td><%= product.getStock() %></td>
   	 <td><a href="deleteproduct2.jsp?id=<%=product.getId()%>">Delete</a></td>
   </tr>
   
  <% } %>
   	
   </table>
   <% } %>
</body>
</html>