<%@page import="java.io.PrintWriter"%>
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

String name1=request.getParameter("name");

Query query=em.createQuery("select u from Product u where u.name=?1 ");

query.setParameter(1, name1);

 List<Product>products =query.getResultList();
 
 
if(products.size()>0){
%>

<table align="center" cellpadding="20" border="2">

<th>name</th>
<th>category</th>
<th>price</th>
<th>stock</th>
<th>Add to Cart</th>

<%for(Product p:products){  %>
<tr>
	<td><%= p.getName() %></td>
	<td><%= p.getCategory() %></td>
	<td><%= p.getPrice() %></td>
	<td><%= p.getStock() %></td>
	<td><a href="additemstocart3.jsp?id=<%=p.getId()%>">Add to Cart</a></td>
</tr>
<% } %>
</table>
<%}
  else{
	  
	  PrintWriter pw=response.getWriter();
	  pw.write("Product Not Available!!!");
	  
	  RequestDispatcher rd=request.getRequestDispatcher("searchproduct.html");
	  rd.include(request, response);
	  response.setContentType("text/html");
  }
  %>

</body>
</html>