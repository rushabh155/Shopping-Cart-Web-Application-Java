<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Admin"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
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

String id=request.getParameter("id");

int id1=Integer.parseInt(id);

EntityManagerFactory emf=Persistence.createEntityManagerFactory("rushabh");
EntityManager em=emf.createEntityManager();
EntityTransaction et=em.getTransaction();

    Merchant m=em.find(Merchant.class, id1);
    
    m.setStatus("active");
    
    Admin a=(Admin)session.getAttribute("admin");
    System.out.println(a.getId());
    m.setAdmin(a); // settinng  admin for merchant
    
   // List<Merchant>merchants = a.getMerchants();
    List<Merchant>merchants=new ArrayList();
    
    merchants.add(m); // merchant is present 
    	 		
    a.setMerchants(merchants); // setting merchant for admin
    	
    et.begin();
    em.merge(m);
    em.merge(a);
    et.commit();
    
    RequestDispatcher rd=request.getRequestDispatcher("Approvemerchant.jsp");
    rd.forward(request, response);

%>
</body>
</html>
