<%@page import="com.shoppingcart.dto.Merchant"%>
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

EntityManagerFactory emf=Persistence.createEntityManagerFactory("rushabh");
EntityManager em=emf.createEntityManager();
EntityTransaction et=em.getTransaction();

Query query=em.createQuery("select u from Merchant u where u.status='inactive' or u.status='active'");

List<Merchant>merchants = query.getResultList();

if(merchants.size()>0)
{ 
	
%>

<table border="2px" cellpadding="20" align="center">

<th>id</th>
<th>name</th>
<th>email</th>
<th>password</th>
<th>mobilenumber</th>
<th>status</th>
<th>Block</th>


<% for(Merchant m:merchants){ %>

<tr>
<td><%=m.getId() %></td>
<td><%=m.getName() %></td>
<td><%=m.getEmail() %></td>
<td><%=m.getPassword() %></td>
<td><%=m.getMobilenumber() %></td>
<td><%=m.getStatus() %></td>
<td><a href="Blockmerchant2.jsp?id=<%=m.getId()%>">Block</a></td>
</tr>

<%} %>

</table>
<%
}
%>
</body>
</html>