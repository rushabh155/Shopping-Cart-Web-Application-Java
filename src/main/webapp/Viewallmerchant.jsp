<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
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
    
     Query query=em.createQuery("select u from Merchant u");
    List<Merchant>merchants = query.getResultList();
    
    if(merchants.size()>0){
    	
    	
   %>
   
   <table cellpadding="20" border="2" align="center">
    	
   	<th>id</th>
   	<th>name</th>
   	<th>email</th>
   	<th>password</th>
   	<th>mobilenumber</th>
   	<th>status</th>
   	
   	<% for(Merchant merchant:merchants) { %>
   	
   	<tr>
   	 <td><%=merchant.getId()  %></td>
   	 <td><%=merchant.getName() %></td>
   	 <td><%= merchant.getEmail() %></td>
   	 <td><%= merchant.getPassword() %></td>
   	 <td><%= merchant.getMobilenumber() %></td>
   	 <td><%= merchant.getStatus() %></td>
   	</tr>
   	
   <% } %>
   
   </table>
   <% } %>
</body>
</html>