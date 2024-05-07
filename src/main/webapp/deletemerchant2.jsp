<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.shoppingcart.dto.Admin"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
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

EntityManagerFactory emf=Persistence.createEntityManagerFactory("rushabh");
EntityManager em=emf.createEntityManager();
EntityTransaction et=em.getTransaction();


  Merchant merchant=em.find(Merchant.class, id1);
  
  Admin a=merchant.getAdmin();

  if(a!=null)
  {
	  List<Merchant>merchants=new ArrayList();
	  
	  for(Merchant m : a.getMerchants())
	  {
		  if(m.getId()==id1)
		  {
			 
		  }
		  else{
			  merchants.add(m);
		  }
		  
	  }
	 
		 a.setMerchants(merchants);
	   
	    
		  et.begin();
		  em.remove(merchant);
		  et.commit();
		  
		 RequestDispatcher rd=request.getRequestDispatcher("Deletemerchant.jsp");
		 rd.forward(request, response);
	 
  }
  else
  {
	  
	 
	
	 
  }
  
  
 
%>
</body>
</html>