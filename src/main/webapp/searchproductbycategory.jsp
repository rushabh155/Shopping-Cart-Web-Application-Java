<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
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

//String choice=request.getParameter("choice");
String choice=request.getParameter("category");

EntityManagerFactory emf=Persistence.createEntityManagerFactory("rushabh");
EntityManager em=emf.createEntityManager();
EntityTransaction et=em.getTransaction();

Query query=em.createQuery("select u from Product u where u.category=?1");

query.setParameter(1, choice);

List<Product> products=query.getResultList();

if(products.size()>0){

%>

<table border="2" align="center" cellpadding="20">
   	<th>name</th>
   	<th>category</th>
   	<th>price</th>
   	<th>stock</th>
   	
   <% for(Product p:products){ %>
   
   <tr>
   	 <td><%=p.getName() %></td>
   	 <td><%= p.getCategory() %></td>
   	 <td><%= p.getPrice() %></td>
   	 <td><%= p.getStock() %></td>
   </tr>
   
   <%} %>
</table>
<%}else{

	PrintWriter pw=response.getWriter();
	pw.write("No such Category Found !!");
	
	RequestDispatcher rd=request.getRequestDispatcher("searchproductbycategory.html");
	rd.include(request, response);
	response.setContentType("text/html");
}
%>
</body>
</html>